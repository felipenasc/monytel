class CentralController extends InterauthController {
	UserService userService

	def index = { 
		if(params.process){
			if(!isUserAuthorized(userService.getUser(params.login))){
				redirect(controller:'user',action:'notPermitted')
		    	return false
			}
			else{
				def resultMap =  userService.validateWhlUser(params.login, params.passwd, params.pin)
				return [processed: resultMap]				
			}
		}
    }
}