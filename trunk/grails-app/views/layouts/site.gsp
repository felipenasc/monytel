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
	<script type="text/javascript" src="${resourceLinkTo(dir:'js', file:'jquery.tools-1.2.7.min.js')}"></script>
	<script type="text/javascript">
		$.noConflict();
		
		jQuery(document).ready(function($) {
			if(window.location.pathname.endsWith('p/893/0')){
				$("#boxAvisoHome").overlay({
					api: true,
					mask: {
						color: '#000',
						loadSpeed: 200,
						opacity: 0.8
					},
					closeOnClick: true,
			        load: true
				});
			}
		});
	</script>
	
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

	<div style="display: none;width: 600px;background-color: #F7F7F7;border:4px solid black; padding: 10px;" id="boxAvisoHome">
		<p style="font-size: 20px;color: red;">COMUNICADO MONYTEL</p>
		<p style="font-size: 16px;font-weight: bold;">Resolu&ccedil;&atilde;o 553 da Anatel - 9&deg; d&iacute;gito</p>
		<p style="margin-top: 15px;text-align: left;font-size: 13px;">
			Com o objetivo de solucionar o problema de falta de numera&ccedil;&atilde;o na regi&atilde;o metropolitana de S&atilde;o Paulo, em 27 de janeiro de 2012 a Anatel tornou p&uacute;blico 
			no Di&aacute;rio Oficial da Uni&atilde;o, o aviso no qual comunicava a inclus&atilde;o do 9&deg; d&iacute;gito nos telefones m&oacute;veis da &aacute;rea de registro 11 a partir de 29/07/2012.
		</p>
		<p style="margin-top: 15px;text-align: left;font-size: 13px;">
			A Monytel vem por meio deste informar que a partir de 01/06/2012 estar&atilde;o dispon&iacute;veis as vers&otilde;es de software para a implementa&ccedil;&atilde;o da faciliudade do 
			9&deg; d&iacute;gito nos sistemas de sua fabrica&ccedil;&atilde;o (Centrais PABX e Interfaces Celulares).
		</p>
		<p style="margin-top: 15px;text-align: left;font-size: 13px;">
			Para que n&atilde;o haja impactos indesejados, entre em contato com o departamento comercial atrav&eacute;s dos telefones (11) 4615-7373 / 7395 / 7382 ou pelo e-mail comercial@monytel.com.br e solicite um or&ccedil;amento para a adequa&ccedil;&atilde;o do seu equipamento.
		</p>
		<p style="margin-top: 30px;font-size: 13px;">
			<a href="#" class="close">FECHAR</a>
		</p>
	</div>
</body>
</html>
