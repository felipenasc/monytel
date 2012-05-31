  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Lista de Menus</title>
    </head>
    <body>
        <div class="body">
            <content tag="heading">
				Formulário de Menu
		    </content>
            <table class="list">
             <thead>
               <tr>
                   	    <g:sortableColumn property="texto" title="Texto" />
                        <th>Ordem</th>
                   	    <th>Página ou URI</th>
               </tr>
             </thead>
             <tbody>
               <g:each in="${menuList}">
                    <tr>
                            <td><g:childrenMenus menu="${it}" /></td>
                            <td>${it.priority}</td>
                            <td>${it.page?.name ? it.page?.name : it.uri}</td>
                    </tr>
               </g:each>
             </tbody>
           </table>
               <div class="paginateButtons">
                   <g:paginate total="${Menu.count()}" />
               </div>
        </div>
    </body>
</html>
