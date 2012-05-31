
<html>
    <head>
		 <meta name="layout" content="admin" />
         <title>Logon</title>
    </head>
    <body>
        <div class="body">
        
           <g:form action="handleLogin" method="post">
           		<input name="forward" type="hidden" value="${flash.forward ? flash.forward : ''}" />
               	<div class="dialog">
				   	<p>Entre com seus dados de login:</p>
	                <table  class="userForm">
	                  <tr class='prop'>
	                      <td valign='top' style='text-align:left;' width='20%'>
	                          <label for='email'>E-mail:</label>
	                      </td>
	                      <td valign='top' style='text-align:left;' width='80%' class=''>
	                          <input id="email" type='text' name='email' value='${user?.email}' />
	                      </td>
	                  </tr>
	
	                  <tr class='prop'>
	                      <td valign='top' style='text-align:left;' width='20%'>
	                          <label for='passwd'>Senha:</label>
	                      </td>
	                      <td valign='top' style='text-align:left;' width='80%' class=''>
	                          <input id="passwd" type='password' name='passwd' value='${user?.passwd}' />
	                      </td>
	                  </tr>
	                       
	               </table>			   	
		       </div>
               <div class="buttons">
                     <span class="formButton">
                        <input type="submit" value="Login"></input>
                     </span>
               </div>
            </g:form>
        </div>
    </body>
</html>
            