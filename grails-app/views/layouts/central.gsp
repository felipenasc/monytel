<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<title><g:layoutTitle default="Grails" /></title>
		
		<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'css',file:'theme.css')}" />
		
		<style>
			body{
				text-align: center;
				min-width: 990px; 
			}
			div#page{
				text-align: left;
				min-height: 100%;
				width: 990px;
				margin: 0 auto;
			}
		</style>
		<g:layoutHead />
	</head>
	<body>
		<div id="page">
			<div style="margin: 10px 0 40px 0px;"><img src="${resourceLinkTo(dir:'images',file:'logo.gif')}"/></div>
			<g:layoutBody />
				
		</div>
	</body>
</html>