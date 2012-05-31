<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">
	 
	<link rel="stylesheet" type="text/css" media="all" href="<g:resourceLinkTo dir="css/site" file="sitelayout.v2.css"/>" />
	<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'css/site',file:'menu.css')}" />
	<link rel="stylesheet" type="text/css" media="all" href="${resourceLinkTo(dir:'css/site',file:'menu2.css')}" />
	<script type="text/javascript" src="${resourceLinkTo(dir:'js/prototype', file:'prototype.js')}"></script>
	<script type="text/javascript" src="${resourceLinkTo(dir:'js/prototype', file:'scriptaculous.js')}"></script>
	<script type="text/javascript" src="${resourceLinkTo(dir:'js/prototype', file:'rico.js')}"></script>
	<script type="text/javascript" src="${resourceLinkTo(dir:'js', file:'application.js')}"></script>
	<title><g:layoutTitle default="Monytel" /></title>
	<g:layoutHead /> 
	
	<!-- Add-On Core Code (Remove when not using any add-on's) -->
	<style type="text/css">.qmfv{visibility:visible !important;}.qmfh{visibility:hidden !important;}</style>
	<script type="text/javascript">qmad=new Object();qmad.bvis="";qmad.bhide="";</script>

	<!-- Add-On Settings -->
	<script type="text/javascript" src="${resourceLinkTo(dir:'js', file:'qckmenu.js')}"></script>
	
</head>

<body>

	<div id="pageContainer">
		<table id="tblPageContainer" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" id="tblHeaderContainer">
						<div class="menu1Container">
							<g:render template="/menu"/>
						</div>
						<g:if test="${caminho != ''}">
							<div class="caminhoMenu">${caminho}</div>
						</g:if>	
					</div>
				</td>
			</tr>
			<tr>
				<td id="tblContentContainer" valign="top">
						<g:if test="${page}">
							<h1 class="pageTitle">${page?.title}</h1>
						</g:if>
						<g:layoutBody />
				</td>
				<td id="tblRightContainer"  valign="top">
					<g:render template="/rightContent"/>
				</td>
			</tr>
		</table>
		
		<br clear="all"/>
	</div>
	<p>&copy; 2008 Monytel</p>


    <g:if test='${java.lang.System.getProperty("grails.env") == "production"}'> <!--  -->
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
        </script>
        <script type="text/javascript">
        _uacct = "UA-3063171-1";
        urchinTracker();
        </script>
    </g:if>

</body>
</html>
