class BootStrap {
	
	private static final String FILES_FOLDER = "filesFolder"

     def init = { servletContext ->

		def grailsEnv = System.getProperty("grails.env")
		if(grailsEnv == "development") {
			servletContext.setAttribute(BootStrap.FILES_FOLDER, "C:\\tmp\\monytel-files")
		}
		else if(grailsEnv == "production") {
		    servletContext.setAttribute(BootStrap.FILES_FOLDER, "/usr/tomcat/monytel-files")
		}
		else{
			servletContext.setAttribute(BootStrap.FILES_FOLDER, "/usr/tomcat/monytel-files")
		}
		
		// Monta o menu
		montaMenu(servletContext)	
		
     }
     
     def montaMenu(servletContext){
     	def menuPrincipal = []
     	def mapa = [:]
     	def params = [:]
     	params.sort = 'priority'
     	
     	menuPrincipal = Menu.findAllByLevelAndActive(0, true, params)
			
		/*Montar menu principal,com seus filhos*/
		menuPrincipal.each{ itemMenuPrincipal ->
			itemMenuPrincipal.childrenMenus.each{ itemMenuSecundario -> 
				itemMenuSecundario.childrenMenus.each{}
				mapa[itemMenuSecundario.id] = itemMenuSecundario.childrenMenus
			}
			mapa[itemMenuPrincipal.id] = itemMenuPrincipal.childrenMenus
		}
		
     	servletContext.menuPrincipal = menuPrincipal
     	servletContext.mapaMenus = mapa
     }
     
     def destroy = {
     }
     

} 