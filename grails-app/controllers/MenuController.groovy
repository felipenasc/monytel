import Constants as CO

class MenuController extends InterauthController{
	//	def beforeInterceptor = [action:this.&auth, only:'list']
	def beforeInterceptor = this.&auth
	
    def index = { redirect(action:list,params:params) }
	
	def allowedMethods = [delete:'POST',
                          save:'POST']

    def list = {
        if(!params.max)params.max = 20
        params.sort = 'priority'
        [ menuList: Menu.findAllByLevel( 0, params ) ]
    }

    def show = {
        [ menu : Menu.get( params.id ) ]
    }

    def delete = {
        def menu = Menu.get( params.id )
        if(menu) {
            menu.delete()
            flash.message = CO.SUCCESS_OPERATION
            redirect(action:list)
        }
        else {
            flash.message = CO.NOT_FOUND
            redirect(action:list)
        }
    }

    def form = {
        def menu 
        if(params.id){
        	menu = Menu.get( params.id )
        	if(!menu) {
                flash.message = CO.NOT_FOUND
                redirect(action:list)
	        }
        }
        else{
        	menu = new Menu()
        }
        menu.properties = params
        return ['menu':menu]

        
    }

    def save = {
    		
        Menu menu
        if(params.id){
            menu = Menu.get( params.id )
            if(!menu){
                flash.message = CO.NOT_FOUND
                redirect(action:form,id:params.id)
                return
            }
        }
        else{
            menu = new Menu()
        }
        
        menu.properties = params
	println params
	println("Depois: " + menu.properties)
        if(menu.save()) {
            flash.message = CO.SUCCESS_OPERATION
            redirect(action:show,id:menu.id)
        }
        else {
            render(view:'form',model:[menu:menu])
        }
    }  
}