class MFile {
	static withTable = "file"
	String name
	String description
	Long size // in bytes
	Date uploaded = new Date()
	
	User user
	Category category
	
	static def constraints = {
		name(blank:false)
		description(blank:false)
		uploaded(nullable:false)
		user(nullable:false)
		category(nullable:false)
		size(nullable:false)
	}
	
//	static belongsTo = [category:Category]
	
//	static mapping = {
//		table 'file'
//		columns {
//			category column:'category_id'
//		}
//	}
	
}
