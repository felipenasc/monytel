  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Lista de Arquivos</title>
         <resource:treeView />
		 

        <script>
    		var newCategorySubmit = function(){
    			Element.hide('categoryFormDiv')
    			Element.show('categorySpinner');
    		}

           	var newCategoryResult = function (){
           		alert($('returnMsg').innerHTML);
           		if($('returnCode').innerHTML == "OK") document.location.href = '${request.contextPath}/category/list/'
           		Element.hide('categorySpinner');
           		/*
           		new Ajax.Updater('categoryListDiv', '${request.contextPath}/category/list/',
						{	asynchronous:true,
							evalScripts:true,
							onComplete:function(e){Element.hide('statusIconSpinner_'+taskId); Element.show('statusImg_'+taskId); new Effect.Highlight('task_'+taskId)},
							onLoading:function(e){Element.hide('statusImg_'+taskId); Element.hide('changeStatusDiv_'+taskId); Element.show('statusIconSpinner_'+taskId)}
						}
					);
				*/

		    }

		    var delFile = function(fileId){
		    	if(confirm("Deseja realmente apagar o arquivo?")){
		    		document.location.href = '${request.contextPath}/file/delete/'+fileId
		    	}
		    }

		    var delCategory = function(){
		    	var categoryId =  $('categoryId').value
                
                var del = false;
                if(confirm("Deseja realmente apagar este diretório?")){
                    del = true;
		    	}
                if(del){
                    new Ajax.Updater('delCategoryReturn', "${request.contextPath}/category/delete/" + categoryId,
			    		{
			    		    	asynchronous:true,
								evalScripts:true,
								onLoading:function(e){
									Element.hide('categoryListDiv');
									Element.show('categoryListSpinner');
								},
								onComplete:function(e){
									Element.hide('categoryListSpinner');
                                    var msgErro = 'Erro ao apagar diretório';
                                    var finalUri = '${request.contextPath}/category/list/';
									if($('returnDeleteCode') != null && $('returnDeleteMsg') != null){
										alert($('returnDeleteMsg').innerHTML);
										if($('returnDeleteCode').innerHTML == "OK") document.location.href = finalUri;
										else{
											alert(msgErro);
											document.location.href = finalUri;
										}
									}
									else{
										alert(msgErro);
										document.location.href = finalUri;
									}
								}
			    		}
			    	);
                }
            }

		    var showFiles = function(catId){
		    	if(catId != null && catId != ""){
			    	$('categoryId').value = catId
			    	$('fileCategoryId').value = catId
			    	
			    	new Ajax.Updater('fileExplorerHeader', '${request.contextPath}/category/navigation/' + catId,
							{	asynchronous:true,
								evalScripts:true,
								onLoading:function(e){
									$('fileExplorerHeader').innerHTML = ''
									Element.show('categorySpinner');
									Element.hide('newDirLink');
									Element.hide('newFileLink');
	                                Element.hide('delDirLink');
	                            },
								onComplete:function(e){Element.show('newDirLink');Element.show('newFileLink');Element.show('delDirLink');;Element.hide('categorySpinner');}
							}
						);
	
					new Ajax.Updater('fileListDiv', '${request.contextPath}/file/list/' + catId,
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
    	<span id="newCategoryReturn" style="display: none;"></span>
    	<span id="delCategoryReturn" style="display: none;"></span>

           
        <div class="body">
           <content tag="heading">
				Lista de Arquivos
		   </content>
		   
		   Clique num dos diretórios abaixo para ver seus arquivos ou para poder criar um sub-diretório.<br> 
		   Para criar um sub-diretório, após clicar no diretório pai que deseja, clique em <img src='${resourceLinkTo(dir:'images2', file:'plus.gif')}'>.<br>
		   Para fazer upload de um arquivo, após clicar no diretório que deseja, clique em <img src='${resourceLinkTo(dir:'images2', file:'upload.gif')}'>.<br>
		   Para deletar um diretório, após clicar no diretório que deseja,  clique em <img src='${resourceLinkTo(dir:'images2', file:'del.gif')}' border='0'>.
		   <br>&nbsp;<br>
		   
		   <table cellspacing="0" cellpadding="4" border="0" width="100%" style="border: 1px gray solid">
			<tr>
			    <td width="255px"></td>
			    <td style="border-bottom: 1px gray solid;" height="28px;" nowrap="nowrap">
			    	<span id="fileExplorerHeader" style="color: silver;">
			    		<img src='${resourceLinkTo(dir:'images2', file:'arrow_left_faded.gif')}' >
			    		clique em um diretório ao lado
			    	</span>
			    	<a href="#" id="newDirLink" onclick="Element.show('categoryFormDiv');Element.hide('newDirLink');" style="margin-left: 30px;"><img src='${resourceLinkTo(dir:'images2', file:'plus.gif')}' title="inserir novo diretório" alt="inserir novo diretório"></a>
                    <a href="javascript:delCategory()" id="delDirLink" style="display: none;"><img src='${resourceLinkTo(dir:'images2', file:'del.gif')}' border='0' title="deletar este diretório" alt="deletar este diretório"></a>
                    <a href="#" id="newFileLink" onclick="Element.show('fileFormDiv');Element.hide('newFileLink');" style="display: none;"><img src='${resourceLinkTo(dir:'images2', file:'upload.gif')}' title="upload de arquivo" alt="upload de arquivo"></a>
			    </td>
			    <td style="border-bottom: 1px gray solid;">
			    	<span id="categorySpinner" style="display: none;"><img src='${resourceLinkTo(dir:'images', file:'spinner.gif')}' ></span>
			    	<div id="categoryFormDiv" style="display: none;">
					   	<g:formRemote url="[controller:'category',action:'save']" name="catForm" onComplete="newCategoryResult()" onLoading="newCategorySubmit()" update="newCategoryReturn">
						       <input type="hidden" name="category.id" value="0" id="categoryId"/>
						       Novo Diretório: <input type="text" name="name" value="" />
						       <input type="submit" value="criar" />
						       <input type="button" value="cancelar" onclick="Element.hide('categoryFormDiv');Element.show('newDirLink');" />
						</g:formRemote >
					</div>
			    </td>
			</tr>
			<tr>
			    <td style="border-right: 1px gray solid;">
			    	<span id="categoryListSpinner" style="display: none;"><img src='${resourceLinkTo(dir:'images', file:'spinner.gif')}' ></span>
			    	
			    	
			    	<richui:treeView xml="${foldersData}" onLabelClick="showFiles(id)"/>
			    	
			    	<div id="categoryListDiv" style="padding-left: 10px;">
			    		
					    	
					    	
					    	
				    	
			    	</div>
			    </td>
			    <td valign="top" colspan="2">
			    	<span id="fileSpinner" style="display: none;"><img src='${resourceLinkTo(dir:'images', file:'spinner.gif')}' ></span>
			    	<div id="fileFormDiv" style="display: none;">
					   <g:form controller="file" action="save" method="post" enctype="multipart/form-data">
						   <input type="hidden" name="category.id" id="fileCategoryId" value="0">
						   <table>
						   	<tr>
						   		<th align="left" colspan="2">Inserir novo arquivo</th>
							</tr>
						   	<tr>
						   		<td align="right" valign="top">Descrição:</td>
						   		<td><textarea rows="5" cols="70" name="description"></textarea></td>
						   	</tr>
						   	<tr>
						   		<td align="right" valign="top">Arquivo:</td>
						   		<td><input type="file" name="mfile" size="20" /></td>
						   	</tr>
						   	<tr>
						   		<td align="center" colspan="2" valign="top">
						   			<input type="submit" value="Enviar Arquivo">
						   			<input type="button" value="Cancelar" onclick="Element.hide('fileFormDiv');Element.show('newFileLink')">
						   		</td>
						   	</tr>
						   </table>
			           </g:form>
		           	</div>
		           	
			    	<div id="fileListDiv" style="margin: 10px 0 0 10px;">
			    	</div>
			    </td>
			</tr>
		   </table>
        </div>
    </body>
</html>
