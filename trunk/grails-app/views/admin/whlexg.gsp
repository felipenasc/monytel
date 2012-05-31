<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Acesso ao WHL E1G</title>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Acesso ao WHL E1G
		   </content>

           <g:if test="${formError}">
                <div class="errors">
                    ${formError}
                </div>
           </g:if>
           <g:form controller="admin" method="post" action="whlexg">

               <div class="dialog">
                <table>
                    <tbody>
						<tr class='prop'>
							<td valign='top' class='name' align="right"><label>PIN:</label></td>
							<td valign='top' class='value'>
								<input type="text" name='pin' value="${params.pin}"/>
							</td>
						</tr>
                        <tr>
                            <td></td>
                            <td><span class="button"><input type="submit" value="Gerar Senha" /></span></td>
                        </tr>

                    </tbody>
                </table>
               </div>
            </g:form>
        </div>
        <g:if test="${whlPasswd}"><div class="whlPasswd" id="whlPasswd">Senha: ${whlPasswd}</div></g:if>
    </body>
</html>
