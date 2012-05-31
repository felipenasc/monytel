class User{
	static withTable = "appuser"

	String passwd
	Boolean active
	
	String name
	String email
	Date created = new Date()
	
	static constraints = {
        passwd(blank:false)
        name(blank:false)
        email(blank:false, email:true)
        active(nullable:false)
        created(nullable:false)
    }
	
	static hasMany = [permissions:Permission]
	
//	static mapping = {
//		table 'appuser'
//		columns {
//			permissions column:'user_id',joinTable:'user_permission'
//		}
//	}	
}	
