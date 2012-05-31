

abstract class InterauthController {

	def auth(){
		if(!isUserAuthenticated()){
			redirect(controller:'user',action:'login')
    		return false
		} 
		else if(!isUserAuthorized()){
			redirect(controller:'user',action:'notPermitted')
	    	return false
		}
		else return true
	}
	
	protected Boolean isUserAuthenticated(){ 
		if(!session.user) {
			flash.forward = actionUri
			if(params.id){
				flash.forward += '/' + params.id
			}
			if(params){
				flash.forward += '?'
				for(p in params){
					flash.forward += p.key + '=' + p.value + '&'
				}
			}
			return false
		}
		else return true
	}
	
	protected Boolean isUserAuthorized(){
		if(isUserAuthenticated()){
			def u = session.user
			return isUserAuthorized(u)
		}
		else{
			return false
		}
	}
	
	protected Boolean isUserAuthorized(User u){
		def authorizedUser = false
		if(!u || !u.permissions || u.permissions.size() == 0){
    		return false
    	}
    	else{
	    	u.permissions.uris.each{ uris ->
	    		uris.split(/\s+/).each{ uri ->
	    			if(uri == actionUri){
		    			authorizedUser = true
		    		}
	    		}
	    	}
    	}
    	if(!authorizedUser){
    		return false
    	}
    	else{
    		return true
    	}
		
	}

}