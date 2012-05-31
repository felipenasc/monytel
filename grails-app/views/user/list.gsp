  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Lista de Usuários</title>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Lista de Usuários
		   </content>
		   <div class="paginateButtons">
               <g:paginate total="${User.count()}" />
           </div>
           <table class="list">
             <thead>
               <tr>
               	    <g:sortableColumn property="name" title="Nome" />
               </tr>
             </thead>
             <tbody>
               <g:each in="${userList}">
                    <tr>
                       <td><a href="${createLink(controller:'user', action:'show', id:it.id)}">${it.name}<a></td>
                    </tr>
               </g:each>
             </tbody>
           </table>
           <div class="paginateButtons">
               <g:paginate total="${User.count()}" />
           </div>
        </div>
    </body>
</html>
