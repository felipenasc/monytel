<html>
    <head>
		<meta name="layout" content="site" />
		<title>Monytel Extranet</title>
		<style>
			<g:if test="${ !menusByLevel[2] }">
				div#contentMenu{width:0px;}
				div#contentHighlights{width:0px;}
				div#content{width:730px;}
			</g:if>
		</style>
		<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'silverstripetree',file:'tree.css')}" />
		
		<resource:treeView />
		
		<script type="text/javascript">
			var showFiles = function(catId){
				if(catId != null && catId != ""){
			    	new Ajax.Updater('fileListDiv', '${request.contextPath}/extranetUser/listFiles/' + catId,
							{	asynchronous:true,
								evalScripts:true,
								onLoading:function(e){
									Element.show('fileSpinner');
									$('fileListDiv').innerHTML = ''
								},
								onComplete:function(e){Element.hide('fileSpinner');}
							}
						);
				}
		    }
		</script>
    </head>
    <body>
		   <h1 class="pageTitle">Extranet - Download de Arquivos</h1>
		   
		   <div id="categoryListDiv">
		   		<richui:treeView xml="${foldersData}" onLabelClick="showFiles(id)"/>
		   </div>
		   <span id="fileSpinner" style="display: none;padding-left: 10px;"><img src='${resourceLinkTo(dir:'images', file:'spinner.gif')}' ></span>
		   <div id="fileListDiv">
		   		<span id="introText">Clique no link desejado ao lado para visualizar os arquivos dispon&iacute;veis para download.</span>
		   </div>
        
    </body>
</html>
