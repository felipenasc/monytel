class NavigatorTagLib{
    def navigation = { attrs ->
		if(!attrs.menu){
		    out << ""
		}
		else{
		    printParentMenu(attrs.menu, out)
		}
	}
    
    private printParentMenu(Menu menu, Writer out){
        if(menu.parentMenu) 
            printParentMenu(menu.parentMenu, out)
            
        out << " <li><a href='"
        if(menu.page)
        	out << createLink(controller:'site', action:'page', params:[pageId: menu.page?.id, menuId:menu.id])
        else
        	out << grailsAttributes.getApplicationUri(request) + menu.uri + "?" + request.getQueryString()
		
        out << "'>" + menu.menuText.toUpperCase() + "</a>"
	}
    
    
    
    
    
    
    
    
    
    def categoryNavigation = { attrs ->
		if(!attrs.category){
		    out << ""
		}
		else{
		    printParentCategory(attrs.category, out)
		}
	}
	
	private printParentCategory(Category category, Writer out){
	    if(category.category) 
	        printParentCategory(category.category, out)
	        
	    out << "&raquo; <a href=\"javascript:showFiles('${category.id}')\"  > ${category?.name}</a> "
	}
		
	def categoryMenu = { attrs ->
			if(!attrs.category){
		   		out << ""
			}
			else{
			    printCategoryMenu(attrs.category, out, 0)
			}
			
	}
		
	private printCategoryMenu(Category category, Writer out, int level){
		
		
		
//		out << "<li class=\"closed\">"
//
//		out << "<a href=\"javascript:showFiles('${category.id}')\"  id=\"${category.id}\">${category?.name}</a>"
//		
//		level++
//		if(category.categories)	out << "<ul>"
//		category.categories?.each { c ->
//			printCategoryMenu(c, out, level)
//		}
//		if(category.categories) out << "</ul>"
//		
//		out << "</li>"
		
	}


}