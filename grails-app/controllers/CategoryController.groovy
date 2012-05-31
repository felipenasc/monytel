import groovy.xml.MarkupBuilder
            
class CategoryController extends InterauthController{
	
	def beforeInterceptor = this.&auth
	
	def SUCCESS_OPERATION = "Operação realizada com sucesso!"
	def NOT_FOUND = "Registro não econtrado."
	
	
    def index = { redirect(action:list) }

    // the delete, save and update actions only
    // accept POST requests
    def allowedMethods = [save:'POST']
	
	def categoryBuilder(cat, xml){
		xml.category(name:cat.name, id:cat.id){
			cat.categories?.each { c ->
				categoryBuilder(c, xml)
			}
		}
	}
	
	def list = {
		def categories = Category.executeQuery("select c from Category as c where c.category is null order by c.name")
		
		def writer = new StringWriter()
		def xml = new MarkupBuilder(writer)
		
		xml.categories(name: "Arquivos Monytel", ){
			for(cat in categories){
				categoryBuilder(cat, xml)
			}
    	}
		
		[ categories:categories, foldersData:writer.toString() ]
	}
	
	def navigation = {
		render(categoryNavigation(category:Category.get(params.id)))
	}
	
	private void montaListaIdsCategories(category, categoriesIds){
		categoriesIds.add(category.id)
		if(category.categories){
			category.categories.each{ cat ->
				montaListaIdsCategories(cat, categoriesIds)
			}
		}
	}

	
	def delete = {
		def categoryToBeDeleted = Category.get(params.id)
		List categoriesIds = []
		if(categoryToBeDeleted){
			montaListaIdsCategories(categoryToBeDeleted, categoriesIds)
		}

		if(categoriesIds.size() > 0){
			def files = MFile.executeQuery("select f from MFile as f join f.category as category where category.id in (" + categoriesIds.join(",") + ")")
			
			if(files){
				def folder = servletContext.getAttribute(BootStrap.FILES_FOLDER)
				for(f in files){
					
			    	def extension = f.name.substring(f.name.lastIndexOf("."))
			    	def fileName = 'file_' + f.id + extension
			    	def file = new File(folder + File.separator + fileName)
					file.delete()
				}
			}
		}
		
		categoryToBeDeleted.delete()
		
		render {
			ul{
				li(id:'returnDeleteCode','OK')
				li(id:'returnDeleteMsg', 'Diretório excluído com sucesso.')
			}
		}
	}

    def save = {
        Category category
        if(params.id){
            category = Category.get( params.id )
            if(!category){
                flash.message = NOT_FOUND
                redirect(action:edit,id:params.id)
                return
            }
        }
        else{
            category = new Category()
        }
        
        def alreadyExistCategory 
        def parentCategory = Category.get(params."category.id")
        if(parentCategory)
        	alreadyExistCategory = Category.findByCategoryAndName(parentCategory, params.name) 
        else
        	alreadyExistCategory = Category.findByName(params.name)
        
        if(alreadyExistCategory){
        	render {
    			ul{
    				li(id:'returnCode','ERRO')
    				li(id:'returnMsg', 'Categoria existente. Escolha outro nome.')
    			}
    		}
        }
        else{
        	category.properties = params
        	if(category.save()) {
        		render {
        			ul{
        				li(id:'returnCode','OK')
        				li(id:'returnMsg', 'Categoria inserida com sucesso.')
        			}
        		}
            }
            else {
            	render {
        			ul{
        				li(id:'returnCode','ERRO')
        				li(id:'returnMsg', 'Erro ao inserir nova categoria. Tente novamente.')
        			}
        		}
            }        	
        }
    }    

}