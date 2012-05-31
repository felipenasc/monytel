import org.hibernate.SessionFactory;
import org.springframework.web.multipart.MultipartFile;

class FileController extends InterauthController{
	
	SessionFactory sessionFactory
	
	def beforeInterceptor = this.&auth
		
	def index = { redirect(action:list,params:params) }
	
	def list = {
		def files = MFile.findAllByCategory(Category.get(params.id))
		if(files){
			def delImage = "<img src='${createLinkTo(dir:'images2', file:'del.gif')}' >"
			render{
				for(f in files){
					div(id:'fileDownloadDiv'){
						a(href:createLink(controller:'file', action:'download', id:f.id), f.name)
						span(" (${ (f.size / 1024).intValue() }KB)")
						//out << "<a href=\"javascript:delFile(${f.id})\">" + delImage + "</a>"
						a(href:"javascript:delFile(${f.id})", "apagar")
					}
				}
			}
		}
		else{
			render{
				div(style:'color:silver;', "Não há arquivos neste diretório.")
			}
		}
		
	}
	
	def delete = {
		def file = MFile.get(params.id)
		
		def categoryId = file.category.id
		
		//Conseguindo a extensão
    	def extension = file.name.substring(file.name.lastIndexOf("."))
    	
    	def fileName = 'file_' + file.id + extension
    	def file2 = new File(servletContext.getAttribute(BootStrap.FILES_FOLDER) + File.separator + fileName)
		if(file.delete()){
			file2.delete()
			flash.message = 'Arquivo excluído com sucesso'
	        redirect(controller:'category', action:'list')
		}
		else{
			flash.message = 'ERRO ao excluir o arquivo. Por favor tente novamente.'
	        render(view:'list')
		}
	}
	
    def save = {
        def file = new MFile()
		def f = request.getFile('mfile')
        file.properties = params
        file.name = f.getOriginalFilename()
        file.size = f.getSize()
        file.user = User.get(session.user.id)
        
        if(file.save()){
        	sessionFactory.getCurrentSession().flush()
        	def extension = getExtension(f)
        	
        	// Se não for uma imagem, conseguir a extensão
        	if(extension == null){
        		extension = file.name.substring(file.name.lastIndexOf("."))
        	}
        	def fileName = 'file_' + file.id + extension
        	f.transferTo(new File(servletContext.getAttribute(BootStrap.FILES_FOLDER) + File.separator + fileName))
        	
        	flash.message = 'Arquivo adicionado com sucesso'
        	redirect(controller:'category', action:'list')
        }
		else{
			flash.message = 'ERRO ao adicionar arquivo. Por favor tente novamente.'
        	render(view:'list')
		}
		
    }
	
	def download = {
		def file = MFile.get(params.id)
		def extension = file.name.substring(file.name.lastIndexOf("."))
        def fileName = 'file_' + file.id + extension
		File f = new File(servletContext.getAttribute(BootStrap.FILES_FOLDER) + File.separator + fileName)

		FileInputStream fis = new FileInputStream(f);
        InputStream stream = new BufferedInputStream(fis);

        try {
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=${file.name}")
    	    response.setHeader("Content-Length", "${f?.size()}")
            copy(stream, response.outputStream);
        } finally {
            if (stream != null) {
                stream.close();
            }
        }
	}
	
    /**
     * Copy bytes from an <code>InputStream</code> to an
     * <code>OutputStream</code>.
     *
     * @param input  The <code>InputStream</code> to read from.
     * @param output The <code>OutputStream</code> to write to.
     * @return the number of bytes copied
     * @throws IOException In case of an I/O problem
     */
    public int copy(InputStream input, OutputStream output) throws IOException {
	    byte[] buffer = new byte[4096];
	    int count = 0;
	    int n = 0;
	
	    while (-1 != (n = input.read(buffer))) {
	        output.write(buffer, 0, n);
	        count += n;
	    }
	
	    return count;
	}
	
	private String getExtension(MultipartFile file){
        String contentType = file.getContentType();
        String fileExtension = null;
        if (contentType.equalsIgnoreCase("image/pjpeg") || contentType.equalsIgnoreCase("image/jpeg") || contentType.equalsIgnoreCase("image/jpg")) {
            fileExtension = ".jpg";
        }
        else if (contentType.equalsIgnoreCase("image/gif")) {
            fileExtension = ".gif";
        }
        else if (contentType.equalsIgnoreCase("image/png") || contentType.equalsIgnoreCase("image/x-png")) {
            fileExtension = ".png";
        }

        return fileExtension;
    }
		
}	