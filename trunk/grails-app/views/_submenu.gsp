<ul>
	<g:if test="${ menusByLevel }">
		<g:each in="${menusByLevel[2]}" var="menuLvl3" status="i">
			<li class="${menuLvl3.id == activeMenus[2]?.id ? 'active ' : ''} ${i == 0 ? ' first' : ''}">
				<g:if test="${menuLvl3?.page != null}">
					<g:link controller="site" action="page" params="[pageId: menuLvl3.page?.id, menuId:menuLvl3.id]">${menuLvl3.menuText}</g:link>
				</g:if>
				<g:else>
					<a href="${request.getContextPath() + menuLvl3.uri}?${request.getQueryString()}">${menuLvl3.menuText}</a>
				</g:else>
			</li>
		</g:each>
	</g:if>
</ul>