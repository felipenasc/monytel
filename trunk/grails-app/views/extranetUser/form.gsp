<html>
    <head>
         <meta name="layout" content="site" />
         <title>Formulário de Usuário da Extranet</title>
    </head>
    <body>
        
		   <h1 class="pageTitle">Formulário de Usuário  da Extranet</h1>
			
           <g:hasErrors bean="${extranetUser}">
                <div class="errors">
                    <g:renderErrors bean="${extranetUser}" as="list" />
                </div>
           </g:hasErrors>
           <g:form controller="extranetUser" method="post" action="save">
               <div class="dialog">
                <table>
                    <tbody>
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='name'>Nome:</label></td>
							<td valign='top' class='value ${hasErrors(bean:extranetUser,field:'name','errors')}'>
								<input type="text" name='name' value="${extranetUser?.name?.encodeAsHTML()}"/>
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='email'>E-mail:</label></td>
							<td valign='top' class='value ${hasErrors(bean:extranetUser,field:'email','errors')}'>
								<input type="text" name='email' value="${extranetUser?.email?.encodeAsHTML()}"/>
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='passwd'>Senha:</label></td>
							<td valign='top' class='value ${hasErrors(bean:extranetUser,field:'passwd','errors')}'>
								<input type="password" name='passwd' value=""/> <g:if test="${params.id}">(preencha apenas caso queira alterar)</g:if>
							</td>
						</tr>
                    </tbody>
                </table>
               </div>
              <div class="buttons">
                     <span class="button"><input type="submit" value="Salvar" /></span>
               </div>
            </g:form>
        
    </body>
</html>
