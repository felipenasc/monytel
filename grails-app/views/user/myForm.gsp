  
<html>
    <head>
         <meta name="layout" content="main" />
         <title>Formulário de Usuário</title>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Formulário de Usuário
		   </content>
			
           <g:hasErrors bean="${user}">
                <div class="errors">
                    <g:renderErrors bean="${user}" as="list" />
                </div>
           </g:hasErrors>
           <g:form controller="user" method="post" action="save">
               <input type="hidden" name="id" value="${user?.id}" />
               <div class="dialog">
                <table>
                    <tbody>
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='name'>Nome:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'name','errors')}'>
								<input type="text" name='name' value="${user?.name?.encodeAsHTML()}"/>
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='email'>E-mail:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'email','errors')}'>
								<input type="text" name='email' value="${user?.email?.encodeAsHTML()}"/>
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='passwd'>Senha:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'passwd','errors')}'>
								<input type="password" name='passwd' value="${user?.passwd}"/>
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='active'>Status de Ativo:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'active','errors')}'>
								<input type="checkbox" name='active' value="true" ${user?.active ? 'checked="checked"' : ''}/> Usuário Ativo
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='nome'>Privilégios:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'name','errors')}'>
								<g:each var="perm" in="${permissions}">
	                               <input type="checkbox" name='permission' value="${perm.id}" ${user?.permissions?.contains(perm) ? 'checked="checked"' : ''}/> ${perm.name}<br>
	                           	</g:each>
							</td>
						</tr>
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label for='nome'>Projetos Permitidos:</label></td>
							<td valign='top' class='value ${hasErrors(bean:user,field:'name','errors')}'>
								<g:each in="${projects}">
	                               <input ${ user.projects.contains(it) ? "checked='checked'" : ""} type='checkbox' name='projects' value='${it.id}'>${it.name}<br>
	                           	</g:each>
							</td>
						</tr>
						
                    </tbody>
                </table>
               </div>
              <div class="buttons">
                     <span class="button"><input type="submit" value="Salvar" /></span>
               </div>
            </g:form>
        </div>
    </body>
</html>
