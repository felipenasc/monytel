
<html>
<head>
<meta name="layout" content="admin" />
<title>Detalhes do Menu</title>
</head>
<body>
	<div class="body">
	<content tag="heading"> Detalhes do Menu </content>
	<div class="nav">
       	<g:link action="list">lista de menus</g:link> |
        <g:link action="form">novo menu</g:link> |
        <g:link action="form" id="${menu.id}">alterar</g:link> | 
		<a href="javascript:deleteEntity('menuForm')">apagar</a>
    </div>
	<div class="dialog">
		<table class="list">
			<tbody>
				<tr class="prop">
					<th valign="top" class="name">Texto:</th>
					<td valign="top" class="value">${menu.menuText}</td>
				</tr>
				<tr class="prop">
					<th valign="top" class="name">Ordem:</th>
					<td valign="top" class="value">${menu.priority}</td>
				</tr>
				<tr class="prop">
					<th valign="top" class="name">Página:</th>
					<td valign="top" class="value"><g:link controller="page"
						action="show" id="${menu?.page?.id}">${menu?.page?.name}</g:link></td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">URI:</th>
					<td valign="top" class="value">${menu.uri}</td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">Nível:</th>
					<td valign="top" class="value">${menu.level}</td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">Menu Pai:</th>
					<td valign="top" class="value"><g:link controller="menu"
						action="show" id="${menu?.parentMenu?.id}">${menu?.parentMenu?.menuText}</g:link></td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">Menus Filhos:</th>
					<td valign="top" style="text-align: left;" class="value">
					<ul>
						<g:each var="m" in="${menu.childrenMenus}">
							<li><g:link controller="menu" action="show" id="${m.id}">${m.menuText}</g:link></li>
						</g:each>
					</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	</div>
	<form action="${createLink(action:'delete')}" method="post" id="menuForm">
		<input type="hidden" name="id" value="${menu?.id}">
	</form>
</body>
</html>
