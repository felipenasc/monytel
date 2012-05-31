class AlwaysCreatedSessionFilters {
	def filters = {
	
    	sessionGuaranteed(controller:'*', action:'*') {
           before = {
              def session = request.session
           }
		}
		 
	} 
}