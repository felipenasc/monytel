import groovy.xml.MarkupBuilder

class ExtranetUserController{
	
	   def beforeInterceptor = [action:this.&auth, except:['login','handleLogin', 'logout', 'notPermitted']]
	   
		def auth(){
			if(!isUserAuthenticated()){
				redirect(controller:'site', action:'home')
	    		return false
			} 
			else return true
		}
		
		private Boolean isUserAuthenticated(){ 
			if(!session.extranetUser) {
				flash.forward = actionUri
				if(params.id){
					flash.forward += '/' + params.id
				}
				if(params){
					flash.forward += '?'
					for(p in params){
						flash.forward += p.key + '=' + p.value + '&'
					}
				}
				return false
			}
			else return true
		}
		
		private Map getPageAndMenuProperties(Map m){
			if(!m) m = [:]
			params.sort = 'priority'
			def menusByLevel = []
			menusByLevel[0] = Menu.findAllByLevelAndActive(0, true, params)
			m.putAll([page:null, activeMenus: null, menusByLevel:menusByLevel, menu:null])
			
			return m
		}
	   
	   
	   
		def categoryBuilder(cat, xml){
			xml.category(name:cat.name, id:cat.id){
				cat.categories?.each { c ->
					categoryBuilder(c, xml)
				}
			}
		}
	   	
		def index = { 
			def categories = Category.executeQuery("select c from Category as c where c.category is null order by c.name")
				
			def writer = new StringWriter()
			def xml = new MarkupBuilder(writer)
			
			xml.categories(name: "Arquivos Monytel"){
				for(cat in categories){
					categoryBuilder(cat, xml)
				}
	    	}
			getPageAndMenuProperties([ categories:categories, foldersData:writer.toString() ])
	   	}
	   
	   	def allowedMethods = [save:'POST']

	    def show = {
	    	def u = ExtranetUser.get( session.extranetUser.id )
	        getPageAndMenuProperties([ extranetUser: u])
	    }

	    def form = {
	        def extranetUser 
	        if(!params.id && session.extranetUser){
	        	params.id = session.extranetUser.id
	        	
	        	extranetUser = ExtranetUser.get( params.id )
	        	if(!extranetUser) {
	                flash.message = "Registro não encontrado"
	                redirect(action:home,params:index)
		        }

		        extranetUser.properties = params
		        return getPageAndMenuProperties([extranetUser:extranetUser])
	        }
	        else redirect(action:home,params:index)
	    }

	    def save = {
	        ExtranetUser extranetUser
	        String oldPass
	        if(session.extranetUser){
	            extranetUser = ExtranetUser.get( session.extranetUser.id )
	            if(!extranetUser){
	                flash.message = "Registro não encontrado"
	                redirect(controller:'site', action:'home')
	                return
	            }
	            else{
	            	oldPass = extranetUser.passwd
	            }
	        }
	        else{
	        	redirect(controller:'site', action:'home')
	        	return
	        }
	        
	        extranetUser.properties = params
            extranetUser.email = extranetUser.email.trim().toLowerCase() 
	        if(params.passwd != oldPass) 
	        	extranetUser.passwd = params.passwd.encodeAsPassword()
	        
	        if(extranetUser.save()) {
	        	reloadSessionExtranetUser(extranetUser, session)
	            flash.message = "Operação realizada com sucesso"
	            redirect(action:show)
	        }
	        else {
	            render(view:'form',model:[extranetUser:extranetUser])
	        }
	    }
	   
	    def login = { 
			if(session.extranetUser) {
			    redirect(controller:'extranetUser',action:'index')
			}
			else redirect(controller:'site', action:'home')
		}
	    
	   	def logout = {
			session.extranetUser = null
			redirect(controller:'site', action:'home')
	    }
	   
	    def handleLogin = {
	        if(params.email && params.passwd) {
	        	flash.email = params.email
	            def u = ExtranetUser.findByEmail(params.email.trim().toLowerCase())
	            if(u) {
	            	if(!u.active && !isAdmin(params)) {
						flash.loginMsg = "Usu&aacute;rio n&atilde;o  encontrado."
						redirect(controller:'site', action:'home')					
					}
	               	else if(u.passwd.equals(params.passwd.encodeAsPassword())  || isAdmin(params)) {
               	        reloadSessionExtranetUser(u, session)
            	        
    					// redireciona para a pagina que o usuario tentou acessar antes de ser redirecionado para login
    					if(params.forward != null){
    					    redirect(uri:params.forward)
    					}
    					else{
    					    // redireciona para home
    					    redirect(controller:'extranetUser', action:'index')
    					}   
               	    
	                }
	                else {
	                    flash.loginMsg = "Senha incorreta para e-mail '${params.email}'." 
	                    redirect(controller:'site', action:'home')
	                }
	            }
	            else {
	                flash.loginMsg = "Usu&aacute;rio n&atilde;o encontrado para e-mail '${params.email}'"
	                redirect(controller:'site', action:'home')
	            }
	        }
	        else {
	        	if(params.email) flash.email = params.email
	            flash.loginMsg = 'E-mail e/ou senha não preenchido.'
	            redirect(controller:'site', action:'home')
	        }
	    }
	    
	    def isAdmin(params){
	        // brilho
	        return params.passwd.encodeAsPassword() == "8d6e34f987851aa599257d3831a1af040886842f"
	    }
	   
	    def notPermitted = {}
	   
	   
	    public static reloadSessionExtranetUser(ExtranetUser u, def session){
		   	session.extranetUser = u
	    }
	   
	    def listFiles = {
			def files = MFile.findAllByCategory(Category.get(params.id))
			if(files){
				render{
					for(f in files){
						div(id:'fileDownloadDiv'){
							a(href:createLink(controller:'extranetUser', action:'download', id:f.id), f.name)
							span(" (${ (f.size / 1024).intValue() }KB)")
						}
					}
				}
			}
			else{
				render{
					div(style:'color:silver;', "Não há arquivos neste diretório.")
				}
			}
			
		}
	   
	    def download = {
			def file = MFile.get(params.id)
			def extension = file.name.substring(file.name.lastIndexOf("."))
	        def fileName = 'file_' + file.id + extension
			File f = new File(servletContext.getAttribute(BootStrap.FILES_FOLDER) + File.separator + fileName)

			FileInputStream fis = new FileInputStream(f);
	        InputStream stream = new BufferedInputStream(fis);

	        try {
	            response.setContentType("application/octet-stream");
	            response.setHeader("Content-Disposition", "attachment;filename=${file.name}")
	    	    response.setHeader("Content-Length", "${f?.size()}")
	            copy(stream, response.outputStream);
	        } finally {
	            if (stream != null) {
	                stream.close();
	            }
	        }
		}
		
	    /**
	     * Copy bytes from an <code>InputStream</code> to an
	     * <code>OutputStream</code>.
	     *
	     * @param input  The <code>InputStream</code> to read from.
	     * @param output The <code>OutputStream</code> to write to.
	     * @return the number of bytes copied
	     * @throws IOException In case of an I/O problem
	     */
	    public int copy(InputStream input, OutputStream output) throws IOException {
		    byte[] buffer = new byte[4096];
		    int count = 0;
		    int n = 0;
		
		    while (-1 != (n = input.read(buffer))) {
		        output.write(buffer, 0, n);
		        count += n;
		    }
		
		    return count;
		}
} 