
<html>
<head>
<meta name="layout" content="admin" />
<title>Detalhes do Usu�rio da Extranet</title>
</head>
<body>
<div class="body">
	<content tag="heading"> Detalhes do Usu�rio da Extranet</content>
	<div class="nav">
       	<g:link action="extranetUserList">lista de usu�rios da extranet</g:link> |
        <g:link action="extranetUserForm">novo usu�rio da extranet</g:link> |
        <g:link action="extranetUserForm" id="${extranetUser.id}">alterar</g:link>
    </div>
    <br>
	<div class="dialog">
		<table class="list">
			<tbody>
				<tr class="prop">
					<th valign="top" class="name" width="100px">Nome:</th>
					<td valign="top" class="value">${extranetUser.name.encodeAsHTML()}</td>
				</tr>
				<tr class="prop">
					<th valign="top" class="name">E-mail:</th>
					<td valign="top" class="value">${extranetUser.email}</td>
				</tr>
		
				
				<tr class="prop">
					<th valign="top" class="name">Status:</th>
					<td valign="top" class="value">${extranetUser.active ? 'Ativo' : 'Inativo'}</td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">Criado em :</th>
					<td valign="top" class="value">${extranetUser.created}</td>
				</tr>

			</tbody>
		</table>
	</div>
</div>
</body>
</html>
