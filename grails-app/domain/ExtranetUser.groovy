class ExtranetUser{
	String name
	String email
	String passwd
	Boolean active
	Date created
	
	static constraints = {
        name(blank:false)
        email(blank:false, email:true)
        passwd(blank:false)
        active(nullable:false)
        created(blank:false)
    }

}	
