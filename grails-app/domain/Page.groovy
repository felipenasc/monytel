class Page implements Comparable { 
	String name
	String content
	String title
	Boolean active	
	Integer priority

	Page parentPage
	
	SortedSet childrenPages
	
//	def hasMany = [ childrenPages : Page ]
//	static belongsTo = [parentPage:Page]
	
	static constraints = {
        name(length:4..255,blank:false,unique:true)
        title(length:1..200,blank:false)
        content(nullable:true)
        active(nullable:false)
        parentPage(nullable:true)
        priority(nullable:true)
    }
	
	int compareTo(obj) {
		priority.compareTo(obj.priority);
	}
	
}	
