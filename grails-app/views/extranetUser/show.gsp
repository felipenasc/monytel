
<html>
<head>
<meta name="layout" content="site" />
<title>Detalhes do Usuário da Extranet</title>
</head>
<body>

	<h1 class="pageTitle">Meus Dados</h1>
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

</body>
</html>
