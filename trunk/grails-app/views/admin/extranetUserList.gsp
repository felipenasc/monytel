  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Lista de Usuários da Extranet</title>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Lista de Usuários da Extranet
		   </content>
           <table class="list">
             <thead>
               <tr>
               	    <g:sortableColumn property="name" title="Nome" />
               </tr>
             </thead>
             <tbody>
               <g:each in="${extranetUserList}">
                    <tr>
                       <td><a href="${createLink(controller:'admin', action:'extranetUserShow', id:it.id)}">${it.name}<a></td>
                    </tr>
               </g:each>
             </tbody>
           </table>
           <div class="paginateButtons">
               <g:paginate total="${ExtranetUser.countByActive(true)}" />
           </div>
        </div>
    </body>
</html>
