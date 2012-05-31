class SiteController {

	def index = {redirect(action:home,params:params)}
	
	def page = {
		if(!params.pageId){
			redirect()
			return [menusLevel1:menusLevel1];
		}
		else{
			def p = Page.get(params.pageId)
			def m = Menu.get(params.menuId)
			//List activeMenus = []
			List menusByLevel = []
			def mapa = [:]
			params.sort = 'priority'
				
			//activateMenus(m, activeMenus, servletContext.menuPrincipal)
		
			//return [page:p, activeMenus: activeMenus, menusByLevel:servletContext.menuPrincipal, menu:m, mapa:servletContext.menuSecundario,caminho:retornaCaminho(m)]
			return [page:p, menu:m,caminho:retornaCaminho(m)]
		}
	}
	
	private List activateMenus(Menu m, List activeMenus, List menusByLevel){
		for(i in 0..4){
			def activeMenu = getActiveMenuByLevel(m, i)
			if(activeMenu != null){
				activeMenus[i] = activeMenu
				if(activeMenu.childrenMenus.size() > 0){
					activeMenu.childrenMenus.each{}
					menusByLevel[i+1] = activeMenu.childrenMenus						
				}
			}
		}
	}
	
	def home = {
		redirect(uri:grailsApplication.metadata['app.home'])
	}
	
	private getActiveMenuByLevel(Menu m, Integer activeLevel){
		def menu = m
		if(m?.level <= (activeLevel - 1)) menu = null
		else if(m.level > activeLevel){
			menu = getActiveMenuByLevel(m.parentMenu, activeLevel)
		}
		return menu
	}
	
	private String retornaCaminho(menu){
		def menuPai =""
		if(menu!=null){
			if(menu.parentMenu!=null){
				//menuPai += retornaCaminho(menu.parentMenu.parentMenu)  
				if(menu.parentMenu.parentMenu){
					menuPai += "<span class='menuPai'>" + menu.parentMenu.parentMenu.menuText + " > </span>"   
				}  
				menuPai +=  "<span class='menuPai'>" + menu.parentMenu.menuText + " > </span>"  
				menuPai += "<span class='menufilho'>" + menu.menuText + "</span>"
			}
		}
		return menuPai
	}
}

