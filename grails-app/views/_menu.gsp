<!-- QuickMenu Structure [Menu 0] -->
<ul id="qm0" class="qmmc">
	<li><g:link controller="site" action="home">Home</g:link></li>
	<g:if test="${ application.menuPrincipal }">
		<g:each in="${application.menuPrincipal}" var="itemMenuPrincipal"> 
			<li><span class="qmdivider qmdividery" ></span></li>
			<li>
				<g:if test="${itemMenuPrincipal?.uri}">
					<a class="qmparent" href="${request.getContextPath() + itemMenuPrincipal?.uri}?${request.getQueryString()}">${itemMenuPrincipal?.menuText}</a>
				</g:if>
				<g:else>
					<g:link class="qmparent" controller="site" action="page" params="[pageId: itemMenuPrincipal?.page?.id, menuId:itemMenuPrincipal?.id]">${itemMenuPrincipal?.menuText}</g:link>
				</g:else>
			  
			  <g:if test="${ application.mapaMenus }">
				<g:if test="${!application.mapaMenus[itemMenuPrincipal?.id]}">
				</g:if>
				<g:else>
					<ul>
						<g:each in="${application.mapaMenus[itemMenuPrincipal?.id]}" var="itemMenuSecundario" status="i">
							<li>
								<g:if test="${itemMenuSecundario?.uri}">
									<a href="${request.getContextPath() + itemMenuSecundario?.uri}?${request.getQueryString()}">${itemMenuSecundario?.menuText}</a>
								</g:if>
								<g:else>
									<g:link controller="site" action="page" params="[pageId: itemMenuSecundario?.page?.id, menuId:itemMenuSecundario?.id]">${itemMenuSecundario?.menuText}</g:link>
								</g:else>
							</li>
						</g:each>
					</ul>
				</g:else>
			  </g:if>
			</li> 
		</g:each>
	</g:if>
	
	<li class="qmclear">&nbsp;</li>

</ul>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
