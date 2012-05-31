class MenuTagLib {

    def childrenMenus = { attrs ->
		if(!attrs.menu){
		    out << ""
		}
		else{
		    printChildren(attrs.menu, out)
		}
		
	}
    
    private printChildren(Menu menu, Writer out){
    	def spacer = ""
    	def level = menu.level
		for ( i in 0..level ) {
			if(i>0) spacer += "&nbsp;&nbsp;&nbsp;"
		}
    	out << spacer + "<a href='"
    	out << createLink(controller:'menu', action:'show', id:menu?.id)
     	out << "'> &raquo; ${menu?.menuText}</a><br>"
        if(menu.childrenMenus?.size() > 0){
        	menu.childrenMenus?.each{ child ->
        		printChildren(child, out)
        	}
        }
    }
    

}
