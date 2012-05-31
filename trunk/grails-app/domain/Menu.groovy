class Menu implements Comparable {
	Page page
	String menuText
	String uri //if there is no Page, we can set the URI directly (ex.: /controller/action/id)
	Menu parentMenu
	Integer priority
	Integer level
	Boolean active
	SortedSet childrenMenus
	
//	def hasMany = [ childrenMenus : Menu ]
//	static belongsTo = [parentMenu:Menu]
	
	static constraints = {
        menuText(length:1..200,blank:false)
        parentMenu(nullable:true)
        page(nullable:true)
        uri(nullable:true)
        priority(nullable:false)
        active(nullable:false)
        level(blank:false)
    }
	
	int compareTo(obj) {
		priority.compareTo(obj.priority)
	}
}	
