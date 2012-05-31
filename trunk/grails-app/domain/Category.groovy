class Category{ 
	String name

	Category category // categoria pai
	Set categories
	Set files
	def hasMany = [categories : Category, files : MFile]

	static def constraints = {
	    name(size:1..255, blank:false)
	    category(nullable:true)
	}
	
//	static belongsTo = [parent:Category]
	
//	static mapping = {
//		table 'category'
//		columns {
//			categories column:'category_id'
//		}
//	}
	
//	int compareTo(obj) {
//	    name?.compareTo(obj?.name)
//   }
}	
