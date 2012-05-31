class UrlMappings {
	static mappings = {
	  "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	 
	  "/p/$pageId/$menuId"{
	  	controller = "site"
	  	action = "page"
	  	constraints {}
	  }
	  
	 "500"(view:'/error')
	}	
}
