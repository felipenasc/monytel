<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title><g:layoutTitle default="Monytel :: Extranet :: Administraç&atilde;o" /></title>
		<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'css/site',file:'sitelayout.css')}" />
		<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'css',file:'theme.css')}" />
        
		<!-- load the menu stylesheet -->
		<style type="text/css">
		      @import url("${resourceLinkTo(dir:'hmenu', file:'skin-xp-apps2.css')}");
		</style>
		<script type="text/javascript">
			_dynarch_menu_url = "${resourceLinkTo(dir:'hmenu')}";
		</script>
		<script type="text/javascript" src="${resourceLinkTo(dir:'hmenu', file:'hmenu.js')}"></script>
		
		<script type="text/javascript" src="${resourceLinkTo(dir:'js', file:'application.js')}"></script>
		<script type="text/javascript" src="${resourceLinkTo(dir:'js/prototype', file:'prototype.js')}"></script>
		<script type="text/javascript" src="${resourceLinkTo(dir:'js/prototype', file:'scriptaculous.js')}"></script>
		
		<script type="text/javascript">
			function deleteEntity(formName){
				if(confirm('Deseja realmente apagar este registro?')){
					$(formName).submit();
				}
			}
			function submitForm(idFormElem){
				if($(idFormElem) != null){
					$(idFormElem).submit()
				}
			}
			
			var initSiteMenu = function(){
				DynarchMenu.setup('menu', { shadows: [-1, 0, 5, 5], scrolling: true }); 
				Element.show('ztopmenudyna');				
			}
		</script>
		
		<g:layoutHead />
		
		<g:if test="${session.user}">
			<script type="text/javascript">
				callOnLoad(initSiteMenu)
			</script>
		</g:if>
		
	</head>
	<body>
		<div id="page">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="1%" rowspan="2" style="padding: 8px;"><img src="${resourceLinkTo(dir:'images',file:'logo.gif')}"/></td>
				<td>
					<g:if test="${session.user}">
						<div id="ztopmenudyna" >
							<ul id="menu" class="clearfix">
							  <li>
								<a href="${resourceLinkTo(dir:'')}">Home</a>
							  </li>
							  
							  <g:auth uris="/menu">
                              <li>
								Menus
								<ul>
								  <li>
									<g:link controller="menu" action="list">Lista de Menus</g:link>
								  </li>
								  <li>
								  	<g:link controller="menu" action="form">Novo Menu</g:link>
								  </li>
								</ul>
							  </li>
                              </g:auth>

                              <g:auth uris="/page">
                              <li>
								P&aacute;ginas
								<ul>
								  <li>
									<g:link controller="page" action="list">Lista de Páginas</g:link>
								  </li>
                                  <g:auth uris="/page/delete /page/form /page/save">
                                  <li>
									<g:link controller="page" action="form">Nova Página</g:link>
								  </li>
                                  </g:auth>
                                </ul>
							  </li>
							  </g:auth>

                              <g:auth uris="/user">
                               <li>
								Usuários
								<ul>
								  <li>
									<g:link controller="user" action="list">Lista de Usuários</g:link>
								  </li>
								  <li>
									<g:link controller="user" action="form">Novo Usuário</g:link>
								  </li>
								</ul>
							  </li>
                              </g:auth>    

                             <g:auth uris="/admin/extranetUserForm">
                             <li>
								Usuários da Extranet
								<ul>
								  <li>
									<g:link controller="admin" action="extranetUserList">Lista de Usuários da Extranet</g:link>
								  </li>
								  <li>
									<g:link controller="admin" action="extranetUserForm">Novo Usuário da Extranet</g:link>
								  </li>
								</ul>
							 </li>
                             </g:auth>


                              <g:auth uris="/file/list">
                              <li>
								<g:link controller="category" action="list">Arquivos</g:link>
							  </li>
                              </g:auth>

                              <g:auth uris="/admin/whlexg">
                              <li>
								<g:link controller="admin" action="whlexg">Acesso WHL E1G</g:link>
							  </li>
                              </g:auth>

                            </ul>


						</div>
				   </g:if>

				</td>
			  </tr>
			  <tr>
				<td><h2>Extranet :: <g:pageProperty name='page.heading'/></h2></td>
			  </tr>
			</table>

		
			<div class="zdividerthin"></div>
			<div class="zdividerthick"></div>
		
			<div id="zcontent">
				<g:if test="${flash.message}">
					 <div class="message">${flash.message}</div>
				</g:if>
				<g:layoutBody />
			</div>
			<div id="zfooter">
				<div class="zdividerthin"></div>
				<div class="zdividerthick"></div>

				<!-- FOOTER -->
				<div id="divider"><div></div></div>
				<span class="left">&nbsp;&nbsp;Vers&atilde;o 1.2 20/11/07
					<g:if test="${session.user}">
					| Usuário: ${session.user.name}
					| <a href="">Meus Dados</a>
					| <a href="${createLink(controller:'user', action:'logout')}">Sair</a>
					</g:if>
				</span>
				<span class="right">
					&copy; ${new java.text.SimpleDateFormat('yyyy').format(new Date())} <a href="http://www.interatus.com.br">Interatus</a> &nbsp;&nbsp;
				</span>
				<!-- FOOTER -->

			</div>
		</div>
	</body>
</html>
<script>
	if(document.forms[0] != null){
		Form.focusFirstElement(document.forms[0])
	}
</script>