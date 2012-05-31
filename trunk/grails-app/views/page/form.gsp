  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Formulário de Página</title>
         <script type="text/javascript" src="${resourceLinkTo(dir:'fckeditor', file:'fckeditor.js')}"></script>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Formulário de Página
		   </content>
			
           <g:hasErrors bean="${page}">
                <div class="errors">
                    <g:renderErrors bean="${page}" as="list" />
                </div>
           </g:hasErrors>
           <g:form controller="page" method="post" action="save">
               <input type="hidden" name="id" value="${page?.id}" />
               <div class="dialog">
                <table>
                    <tbody>
                    	<g:if test="${page?.parentPage!=null}">
                    		<tr class='prop'>
                    			<td colspan="2"><h1>ABA</h1></td>
                    		</tr>
                    		<tr class='prop'>
                    			<td valign='top' class='name'>P&aacute;gina PAI:</td>
                    			<td valign='top' class='value'>${page?.parentPage?.title} [ ${page?.parentPage?.name} ]
                    				<input type="hidden" name="parentPage.id" value="${page.parentPage.id}">
                    			</td>
                    		</tr>
                    		
                    	</g:if>
						<tr class='prop'><td valign='top' class='name'><label for='name'>Nome administrativo:</label></td><td valign='top' class='value ${hasErrors(bean:page,field:'name','errors')}'><input type="text" name='name' value="${page?.name?.encodeAsHTML()}"/></td></tr>
						<tr class='prop'><td valign='top' class='name'><label for='title'>T&iacute;tulo da p&aacute;gina:</label></td><td valign='top' class='value ${hasErrors(bean:page,field:'title','errors')}'><input type="text" name='title' value="${page?.title?.encodeAsHTML()}"/></td></tr>
						<tr class='prop'>
							<td valign='top' class='name'><label for='active'>Status de Ativo:</label></td><td valign='top' class='value ${hasErrors(bean:page,field:'active','errors')}'>
								<input type="checkbox" name='active' value="true" ${page?.active ? 'checked="checked"' : ''}/> P&aacute;gina Ativa
							</td>
						</tr>
                    	<g:if test="${page?.parentPage!=null}">
							<tr class='prop'>
								<td valign='top' class='name'><label for='active'>Ordem:</label></td><td valign='top' class='value ${hasErrors(bean:page,field:'active','errors')}'>
									<input type="text" name='priority' value="${page?.priority}"/> 
								</td>
							</tr>
                    	</g:if>
						<tr class='prop'>
							<td valign='top' class='name'><label for='content'>Conte&uacute;do:</label></td>
							<td valign='top' class='value ${hasErrors(bean:page,field:'content','errors')}'>
								<resource:richTextEditor type="full"/>
								<richui:richTextEditor name="content" value="${page?.content}" width="725" height="500"  />
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
