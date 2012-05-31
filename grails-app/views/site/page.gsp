<html>
<head>
<meta name="layout" content="site" />
<resource:tabView />

<link rel="stylesheet" type="text/css" href="${resourceLinkTo(dir:'css', file:'tabView.css')}"/>

</head>
<body>
${page?.content }

<g:if test="${page?.childrenPages?.size()>0}">
	<richui:tabView id="tabView">
		<richui:tabLabels>
			<g:each in="${page.childrenPages}" var="aba" status="i">
				<g:if test="${i==0}">
					<richui:tabLabel selected="true" title="${aba.title}"/>
				</g:if>
				<g:else>
					<richui:tabLabel title="${aba.title}"/>
				</g:else>
			</g:each>
		</richui:tabLabels>
	
		<richui:tabContents>
			<g:each in="${page.childrenPages}" var="aba">
				<richui:tabContent>
			    	<div class="toptabview"></div>
			    	<div class="middletabview">${aba?.content }</div>
			    	<div class="bottomtabview"></div>
				</richui:tabContent>
			</g:each>
		</richui:tabContents>
	</richui:tabView>
</g:if>
</body>
</html>
