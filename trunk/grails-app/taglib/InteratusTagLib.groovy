class InteratusTagLib {

    def auth = { attrs, body ->
	    def uris = attrs.uris.split(" ")
	    def hasPrivilege = false
	    
    	    if (session.user) {
		def permitedUris = []
		session.user.permissions.each{
			it.uris.split(/\s+/).each{ uri ->
				permitedUris << uri
			}
		}
		uris.each {
	    		if (it in permitedUris) {
	    			hasPrivilege = true
	    		}
	    	}
	    }
	    
	    if (hasPrivilege) {
	    	out << body()
	    }
    	
    }

    
    def nl2br = { attrs, body ->
            out << attrs.text.replace("\n", "<br>")
    }
    
    def isValidImage = { attrs, body ->
    	if(attrs["extension"] == ".jpg" || attrs["extension"] == ".gif" || attrs["extension"] == ".png"){
    		out << body()
    	}
    }
    
    def isNotValidImage = { attrs, body -> 
	    if(attrs["extension"] != ".jpg" && attrs["extension"] != ".gif" && attrs["extension"] != ".png"){
	    	out << body()
		}
    }

}
