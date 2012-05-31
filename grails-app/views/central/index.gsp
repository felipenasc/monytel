  
<html>
    <head>
        <meta name="layout" content="site" />
        <title>Central de Senha Monytel</title>
		
        
    </head>
    <body>
    	<div style="width: 640px; height: 400px">
    		<p style="font-size: 14px;font-weight: bold">Bem-vindo(a)!</p>
    		Esta página é responsável por gerar a senha a ser utilizada nos sistemas centralizados da Monytel.
    		<p></p>
    		<table width="100%">
    		  <form action="${createLink(controller:'central', action:'index')}" id="senhaForm" method="post">
    		    <input type="hidden" name="process" value="1">
    			<tr>
    				<td width="1%" nowrap="nowrap" align="right">E-mail:</td>
    				<td><input type="text" name="login" id="login" value="${params.login }" /></td>
    			</tr>
    			<tr>
    				<td align="right" nowrap="nowrap" >Senha do site:</td>
    				<td><input type="password" name="passwd" id="passwd" /></td>
    			</tr>
    			<tr>
    				<td align="right" nowrap="nowrap" valign="top">PIN:<br> (gerado pelo Centralizado)</td>
    				<td  valign="top"><input type="text" id="pin" name="pin"  value="${params.pin }"/></td>
    			</tr>
    			<tr>
    				<td></td>
    				<td>
    					<input  type="submit" value="Gerar Senha" />
    				</td>
    			</tr>
    		  </form>
    		</table>
    		<p>&nbsp;</p>
    		<g:if test="${processed}"><div class="whlPasswd" id="whlPasswd">${processed.result ? "Senha: " : ''} ${processed.text}</div></g:if>
    	</div>
    	
    </body>
</html>
