class MobileController {
	
	UserService userService
	
	def whlPwd = {
		def resultMap =  userService.validateWhlUser(params.login, params.passwd, params.pin)
		render(text:resultMap.text);
		
	}
}