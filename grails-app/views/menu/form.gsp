<html>
    <head>
 		 <meta name="layout" content="admin" />
         <title>Formulário de Menu</title>
    </head>
    <body>
        <div class="body">
        	<content tag="heading">
				Formulário de Menu
			</content>

           <g:hasErrors bean="${menu}">
                <div class="errors">
                    <g:renderErrors bean="${menu}" as="list" />
                </div>
           </g:hasErrors>
                   
           <g:form controller="menu" method="post" action="save">
               <input type="hidden" name="id" value="${menu?.id}" />
               <div class="dialog">
                <table>
                    <tbody>
						<tr class='prop'>
							<td valign='top' class='name'><label for='priority'>Ordem:</label></td>
							<td valign='top' class='value ${hasErrors(bean:menu,field:'priority','errors')}'>
							<input type='text' name='priority' value="${menu?.priority}" /></td>
						</tr>
						<tr class='prop'>
							<td valign='top' class='name'><label for='page'>Página:</label></td>
							<td valign='top' class='value ${hasErrors(bean:menu,field:'page','errors')}'>
							<g:select optionKey="id" from="${Page.findAllByActive(true)}" name='page.id' value="${menu?.page?.id}" optionValue="name" noSelection="[0:'-Selecione-']"></g:select></td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name'><label for='uri'>URI:</label></td>
							<td valign='top' class='value ${hasErrors(bean:menu,field:'uri','errors')}'>
								<input type='text' name='uri' value="${menu?.uri}" />
							</td>
						</tr>
						
						<tr class='prop'>
							<td valign='top' class='name'><label for='level'>Nível do Menu (0=menu principal, 1=submenu, 2=menu do conteúdo):</label></td>
							<td valign='top' class='value ${hasErrors(bean:menu,field:'level','errors')}'>
								<input type='text' name='level' value="${menu?.level}" />
							</td>
						</tr>
						
						<tr class='prop'><td valign='top' class='name'><label for='parentMenu'>Menu Pai:</label></td><td valign='top' class='value ${hasErrors(bean:menu,field:'parentMenu','errors')}'>
							<g:select optionKey="id" from="${Menu.findAllByActive(true)}" name='parentMenu.id' value="${menu?.parentMenu?.id}" optionValue="menuText" noSelection="[0:'-Selecione-']"></g:select></td>
						</tr>
						<tr class='prop'><td valign='top' class='name'><label for='menuText'>Texto:</label></td><td valign='top' class='value ${hasErrors(bean:menu,field:'menuText','errors')}'><input type="text" name='menuText' value="${menu?.menuText?.encodeAsHTML()}"/></td></tr>
						<tr class='prop'>
							<td valign='top' class='name'><label for='active'>Status de Ativo:</label></td><td valign='top' class='value ${hasErrors(bean:menu,field:'active','errors')}'>
								<input type="checkbox" name='active' value="true" ${menu?.active ? 'checked="checked"' : ''}/> Menu Ativo
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
