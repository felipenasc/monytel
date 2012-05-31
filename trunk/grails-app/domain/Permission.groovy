class Permission {
	
	String name
	String uris // space separated values
	
	static constraints = {
        name(blank:false, unique:true)
        uris(blank:false)
    }
	
	static hasMany = [users:User]
	static belongsTo = User
	
//	static mapping = {
//		table 'permission'
//		columns {
//			users column:'permission_id',joinTable:'user_permission'
//		}
//	}	
}	
