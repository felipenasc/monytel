  
<html>
    <head>
         <meta name="layout" content="admin" />
         <title>Lista de Páginas</title>
    </head>
    <body>
        <div class="body">
           <content tag="heading">
				Lista de Páginas
		   </content>
           <table class="list">
             <thead>
               <tr>
               	    <g:sortableColumn property="name" title="Nome" />
               	    <g:sortableColumn property="title" title="Titulo" />
               	    <th>Abas</th>
               </tr>
             </thead>
             <tbody>
               <g:each in="${pageList}" var="page">
                    <tr>
                       <td><a href="${createLink(controller:'page', action:'show', id:page.id)}">${page.name}<a></td>
                       <td>${page.title}</td>
                       <td>
                       		<g:each in="${page.childrenPages}" var="aba">
                       			<a href="${createLink(controller:'page', action:'form', id:aba.id)}">${aba.name}<a><br>
                       		</g:each>
                       <td>
                    </tr>
               </g:each>
             </tbody>
           </table>
           <div class="paginateButtons">
               <g:paginate total="${Page.findAllByParentPageIsNull().size()}" />
           </div>
        </div>
    </body>
</html>
