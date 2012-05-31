
<html>
<head>
<meta name="layout" content="admin" />
<title>Detalhes da Página</title>
</head>
<body>
<div class="body">
	<content tag="heading"> Detalhes da Página 
	</content>
	<div class="nav">
       	<g:link action="list">lista de páginas</g:link> |
        <g:link action="form">nova página</g:link> |
        <g:link action="form" id="${page.id}">alterar</g:link> | 
		<a href="javascript:deleteEntity('pageForm')">apagar</a> | 
		<g:link action="form" params="['parentPage.id':page.id]">criar aba</g:link>
    </div>
	<div class="dialog">
		<table class="list">
			<tbody>
				<tr class="prop">
					<th valign="top" class="name">Nome:</th>
					<td valign="top" class="value">${page.name}</td>
				</tr>
				<tr class="prop">
					<th valign="top" class="name">Título:</th>
					<td valign="top" class="value">${page.title}</td>
				</tr>
			</tbody>
		</table>
		
		<table class="list">
			<tbody>
				<tr class="prop">
					<th valign="top" class="name">Menus que apontam para esta página:</th>
					<td valign="top" class="value">
					   <ul>
                           <g:each var="m" in="${menus}">
                               <li><g:link controller="menu" action="show" id="${m.id}">${m}</g:link></li>
                           </g:each>
                       </ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<form action="${createLink(action:'delete')}" method="post" id="pageForm">
	<input type="hidden" name="id" value="${page?.id}">
</form>

<div style="width: 750px;">
		${page?.content}
</div>

<g:if test="${page.childrenPages.size() > 0}">
	<table class="list">
		<tbody>
			<tr><td colspan="6" align="center" style="background-color: black; color: white;">A B A S</td></tr>
			<g:each in="${page.childrenPages}" var="aba">
				<tr class="prop">
					<th valign="top" class="name">Nome: ${aba?.name}</th>
					<th valign="top" class="name">T&iacute;tulo: ${aba?.title}</th>
					<th valign="top" class="name">Ordem: ${aba?.priority}</th>
				</tr>
				<tr>
				</tr>
					<td colspan="6">
						<div class="nav">
							<g:link action="form" params="['parentPage.id':page.id]">criar nova aba</g:link> | 
					        <g:link action="form" id="${aba.id}">alterar</g:link> | 
							<a href="javascript:deleteEntity('pageForm${aba.id}')">apagar</a>
							<form action="${createLink(action:'delete')}" method="post" id="pageForm${aba.id}">
								<input type="hidden" name="id" value="${aba?.id}">
							</form>
					    </div>				
					<td>
				<tr>
				<td colspan="6">${aba.content}</td>
				</tr>
			</g:each>
			
		</tbody>
	</table>
</g:if>
</body>
</html>
