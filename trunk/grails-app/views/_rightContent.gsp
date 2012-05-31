		<g:if test="${ application.mapaMenus[menu?.parentMenu?.id] && menu?.parentMenu}">
		<div class="box">
			<div class="box_top_orange"></div>
			<div class="box_center_orange" id="subnav">
				<div class="box_title"><img src="${resourceLinkTo(dir:'images2',file:'sitemap_color.png')}" class="box_title_icon"><span class="box_title_text">${menu.parentMenu.menuText}</span></div>
				<g:each in="${application.mapaMenus[menu.parentMenu.id]}" var="itemMenuNivel3" status="i">
					<div class="boxsubmenu_row">
						<span>
							<g:if test="${itemMenuNivel3?.page != null}">
								<g:link controller="site" action="page" params="[pageId: itemMenuNivel3?.page?.id, menuId:itemMenuNivel3?.id]">${itemMenuNivel3?.menuText}</g:link>
							</g:if>
							<g:else>
								<a href="${request.getContextPath() + itemMenuNivel3?.uri}?${request.getQueryString()}">${itemMenuNivel3?.menuText}</a>
							</g:else>
						</span>
					</div>
				</g:each>
			</div>
			<div class="box_bottom_orange"></div>
		</div>
		</g:if>
			
		<div class="box">
			<g:link controller="site" action="page" params="[pageId: 850, menuId:851]"><img src="${resourceLinkTo(dir:'images2',file:'fale-com-presidente.png')}" border="0" /></g:link>
		</div>
		
		
		<div class="box">
			<div class="box_top"></div>
			<div class="box_center">
				<div class="box_title"><img src="${resourceLinkTo(dir:'images2',file:'phone.png')}" class="box_title_icon"><span class="box_title_text">Contatos</span></div>
				<div style="padding-left:20px;padding-top:5px;">
					<a href="mailto:comercial@monytel.com.br">comercial@monytel.com.br</a><br>
					<a href="mailto:suporte@monytel.com.br">suporte@monytel.com.br</a><br>
					<a href="mailto:posvenda@monytel.com.br">posvenda@monytel.com.br</a>
				</div>
				
			</div>
			<div class="box_bottom"></div>
		</div>
		
		
		<div id="logonBox" class="box">
			<form method="post" action="${createLink(controller:'extranetUser', action:'handleLogin')}" id="extranetLoginForm">
				<div id="logonForm">
					<g:if test="${!session.extranetUser}">
						<g:if test="${flash.loginMsg}">
							 <div style="color:red;">${flash.loginMsg}</div>
						</g:if>
						E-MAIL: <input name="email" type="text" size="12" value="${flash.email}"/><br>
						SENHA: <input name="passwd" type="password" size="12" />
						<a href="#" onclick="document.getElementById('extranetLoginForm').submit();"><img src="${resourceLinkTo(dir:'images2',file:'ok.gif')}" class="logonOkButton" border="0" /></a>
					</g:if>
					<g:else>
						<div>
							Usu&aacute;rio:  <strong>${session.extranetUser.name}</strong>.<br />
							<hr>
							<a href="${createLink(controller:'extranetUser', action:'index')}" >extranet</a> <br>
							<a href="${createLink(controller:'extranetUser', action:'form')}" >meus dados</a> <br>
							<a href="${createLink(controller:'extranetUser', action:'logout')}" >sair</a>  
						</div>
					</g:else>
				</div>
			</form>
		</div>	
	
		
	