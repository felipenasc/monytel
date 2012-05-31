import br.com.interatus.pwdgen.PwdGenerator

class UserService {
	
    boolean transactional = false
    
    PwdGenerator pwdGenerator

    def getUser(String email) {
    	def u = User.findByEmail(email?.trim()?.toLowerCase())
    }
    
    def isAdmin(passwd){
        // brilho
        return passwd.encodeAsPassword() == "8d6e34f987851aa599257d3831a1af040886842f"
    }
    
    def validateWhlUser(login, passwd, pin){
    	if(!login || !passwd || !pin){
			return [result:false, text:"Preencha corretamente o login, senha e PIN."]
		}
		else{
			def u = getUser(login)
			if(u) {
				if(!u.active && !isAdmin(passwd)) {
					return [result:false, text:"Usuario inativo."]
				}
               	else if(u.passwd.equals(passwd.encodeAsPassword())  || isAdmin(passwd)) {
               		return [result:true, text:pwdGenerator.getCode(pin + login)]
                }
                else {
                	return [result:false, text:"Senha de usuario incorreta."] 
                }
            }
            else {
            	return [result:false,text:"Usuario inexistente."]
            }
		}
    	
    }
}