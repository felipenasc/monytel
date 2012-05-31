
<html>
<head>
<meta name="layout" content="admin" />
<title>Detalhes da Usuário</title>
</head>
<body>
<div class="body">
	<content tag="heading"> Detalhes da Usuário 
	</content>
	<div class="nav">
       	<g:link action="list">lista de usuários</g:link> |
        <g:link action="form">novo usuário</g:link> |
        <g:link action="form" id="${user.id}">alterar</g:link>
    </div>
    <br>
	<div class="dialog">
		<table class="list">
			<tbody>
				<tr class="prop">
					<th valign="top" class="name" width="100px">Nome:</th>
					<td valign="top" class="value">${user.name.encodeAsHTML()}</td>
				</tr>
				<tr class="prop">
					<th valign="top" class="name">E-mail:</th>
					<td valign="top" class="value">${user.email}</td>
				</tr>
		
				
				<tr class="prop">
					<th valign="top" class="name">Status:</th>
					<td valign="top" class="value">${user.active ? 'Ativo' : 'Inativo'}</td>
				</tr>
				
				<tr class="prop">
					<th valign="top" class="name">Privilégios:</th>
					<td valign="top" class="value">
					   <ul>
                           <g:each var="p" in="${permissions}">
                               <li>${p.name}</li>
                           </g:each>
                       </ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>
