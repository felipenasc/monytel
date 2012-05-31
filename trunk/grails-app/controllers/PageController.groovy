import Constants as CO


// AuthController vem do Interauth plugin, assim como o metodo auth()
class PageController extends InterauthController{
	
	//def beforeInterceptor = [action:this.&auth, only:'list']
	def beforeInterceptor = this.&auth
	
	def index = { redirect(action:list,params:params) }
	
	def allowedMethods = [delete:'POST',
                          save:'POST']


    def list = {
    	if(!params.max)params.max = 10
    	
    	def pageList = Page.findAllByParentPageIsNull(params)
    	
        [ pageList: pageList ]
    }

    def show = {
    	def p = Page.get( params.id )
        [ page: p, menus:Menu.findAllByPage(p) ]
    }

    def delete = {
        def page = Page.get( params.id )
        if(page) {
            page.delete(flush:true)
            flash.message = CO.SUCCESS_OPERATION
            // verifica se uma aba foi deletada, se sim, redireciona para o show da página pai
            if (page.parentPage == null) {
            	redirect(action:list)
            } else {
            	redirect(action:show,id:page.parentPage.id)
            }
        }
        else {
            flash.message = CO.NOT_FOUND
            redirect(action:list)
        }
    }

    def form = {
        def page 
        if(params.id){
        	page = Page.get( params.id )
        	if(!page) {
                flash.message = CO.NOT_FOUND
                redirect(action:list)
	        }
        }
        else{
        	page = new Page()
        }
        page.properties = params
        return ['page':page]

        
    }

    def save = {
        Page page
        if(params.id){
            page = Page.get( params.id )
            if(!page){
                flash.message = CO.NOT_FOUND
                redirect(action:form,id:params.id)
                return
            }
        }
        else{
            page = new Page()
        }
        
        page.properties = params
    	if (page.priority==null) page.priority = 0;
        if(page.save()) {
            flash.message = CO.SUCCESS_OPERATION
            
            // se uma aba foi salva, redireciona para o show da aba pai
            if (page.parentPage!=null) {
            	page = page.parentPage
            }
            redirect(action:show,id:page.id)
        }
        else {	
            render(view:'form',model:[page:page])
        }
    }   
}