import br.com.interatus.pwdgen.PwdGenerator

class AdminController  extends InterauthController{
	
	def beforeInterceptor = [action:this.&auth, except:['index']]
	
	PwdGenerator pwdGenerator
	
	def index = { 
		if(!session.user){
			flash.forward = '/admin/index'
			redirect(controller:'user', action:'login')
		}
	}
	
	def extranetUserForm = {
	        def extranetUser 
	        if(params.id){
	        	extranetUser = ExtranetUser.get( params.id )
	        	if(!extranetUser) {
	                flash.message = "Registro não encontrado"
	                redirect(action:index)
		        }
	        }
	        else{
	        	extranetUser = new ExtranetUser()
	        }
	        extranetUser.properties = params
	        return ['extranetUser':extranetUser]
    }

    def extranetUserSave = {
        ExtranetUser extranetUser
        String oldPass
        if(params.id){
            extranetUser = ExtranetUser.get( params.id )
            if(!extranetUser){
                flash.message = "Registro não encontrado"
                redirect(action:extranetUserForm,id:params.id)
                return
            }
            else{
            	oldPass = extranetUser.passwd
            }
        }
        else{
            extranetUser = new ExtranetUser()
            extranetUser.created = new Date();
        }
        
        extranetUser.properties = params
        if(params.passwd != oldPass) 
        	extranetUser.passwd = params.passwd.encodeAsPassword()
        
        if(extranetUser.save()) {
            flash.message = "Operação realizada com sucesso"
            redirect(action:extranetUserShow,id:extranetUser.id)
        }
        else {
            render(view:'extranetUserForm',model:[extranetUser:extranetUser])
        }
    }
    
	
	def extranetUserShow = {
    	def u = ExtranetUser.get( params.id )
        [ extranetUser: u]
    }
	
	def extranetUserList = {
        if(!params.max)params.max = 50
        [ extranetUserList: ExtranetUser.listOrderByName( params ) ]
    }

    def whlexg = {
        if(params.pin){
        	String code = pwdGenerator.getCode(params.pin + session.user.email);
        	return [whlPasswd:code]
        }
    }
}