class UserController extends InterauthController{
	
	   UserService userService
	
	   def beforeInterceptor = [action:this.&auth, except:['login','handleLogin', 'logout', 'notPermitted']]

	   def index = { redirect(action:list,params:params) }
	   
	   def allowedMethods = [delete:'POST',
	                          save:'POST']

	    def list = {
	        if(!params.max)params.max = 40
	        params["sort"] = "name" 
	        [ userList: User.list( params ) ]
	    }

	    def show = {
	    	def u = User.get( params.id )
	        [ user: u, permissions:Permission.executeQuery("select p from Permission p join p.users as u where u.id = ?", [u.id]) ]
	    }

	    def delete = {
	        def user = User.get( params.id )
	        if(user) {
	            user.delete()
	            flash.message = "Operação realizada com sucesso"
	            redirect(action:list)
	        }
	        else {
	            flash.message = "Registro não encontrado"
	            redirect(action:list)
	        }
	    }

	    def form = {
	        def user 
	        if(params.id){
	        	user = User.get( params.id )
	        	if(!user) {
	                flash.message = "Registro não encontrado"
	                redirect(action:list)
		        }
	        }
	        else{
	        	user = new User()
	        }
	        user.properties = params
	        return ['user':user, 'permissions':Permission.list()]
	    }

	    def save = {
	        User user
	        String oldPass
	        if(params.id){
	            user = User.get( params.id )
	            if(!user){
	                flash.message = "Registro não encontrado"
	                redirect(action:form,id:params.id)
	                return
	            }
	            else{
	            	oldPass = user.passwd
	            }
	        }
	        else{
	            user = new User()
	        }
	        
	        user.properties = params
	        user.email = user.email.trim().toLowerCase()
	        if(!params.active) user.active = false
	        
	        if(params.passwd && params.passwd != "" && params.passwd != oldPass) 
	        	user.passwd = params.passwd.encodeAsPassword()
	       	else
	       		user.passwd = oldPass
	        	
	        // Adding Permissions
	        Set permissions = new HashSet()
	        
	        // Caso apenas um checkbox seja selecionado, o parametro chega como String. Caso seja mais de um, ele chega como String[]
	        // Entao, este if abaixo altera ele para ele ser tratado da mesma forma depois (com loop de each).
	        if(params.permission instanceof String){
	        	def perms = [params.permission]
	        	params.permission = perms
	        }
	        
	        params.permission.each{ permissionId ->
	        	def p = Permission.get(new Long(permissionId))
	        	permissions.add(p)
	        }
	        if(user.permissions != null && user.permissions.size() > 0){
	        	user.permissions.clear()
	        }
	        user.permissions = permissions
	        
	        if(user.save()) {
	            flash.message = "Operação realizada com sucesso"
	            redirect(action:show,id:user.id)
	        }
	        else {
	            render(view:'form',model:[user:user, 'permissions':Permission.list()])
	        }
	    }
	   
	    def login = { 
			if(session.user) {
			    redirect(controller:'user',action:'list')
			}
		}
	    
	   	def logout = {
			session.user = null
			redirect(uri:'/')
	    }
	   
	    def handleLogin = {
	        if(params.email && params.passwd) {
	            def u = userService.getUser(params.email)
	            if(u) {
				
	            	if(!u.active && !userService.isAdmin(params.passwd)) {
						flash.message = "Usuário não encontrado."
						redirect(action:login)					
					}
	               	else if(u.passwd.equals(params.passwd.encodeAsPassword())  || userService.isAdmin(params.passwd)) {
               	        reloadSessionUser(u, session)
            	        
    					// redireciona para a pagina que o usuario tentou acessar antes de ser redirecionado para login
    					if(params.forward != null){
    					    redirect(uri:params.forward)
    					}
    					else{
    					    // redireciona para home
    					    redirect()
    					}   
               	    
	                }
	                else {
	                    flash.message = "Senha incorreta para e-mail '${params.email}'." 
	                    render(view:'login')
	                }
	            }
	            else {
	                flash.message = "Usuário não encontrado para e-mail '${params.email}'"
	                render(view:'login')
	            }
	        }
	        else {
	            flash.message = 'Login e/ou senha não preenchido.'
	            render(view:'login')
	        }
	    }
	    
	   def notPermitted = {}
	   
	   public static reloadSessionUser(User u, def session){
		   	u.permissions.each{p ->
		   		p.uris
		   	} 
  	     	session.user = u
	   }
}