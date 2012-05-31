<ul class="menuFirstLevel">
	<li><g:link controller="site" action="home">Home</g:link></li>
	<g:if test="${ menusByLevel }">
	<g:each in="${menusByLevel[0]}" var="menuLvl0"> 
		<li class="${activeMenus && menuLvl0?.id == activeMenus[0]?.id ? 'active' : ''}">
			<g:if test="${menuLvl0?.uri}">
				<a href="${request.getContextPath() + menuLvl0.uri}?${request.getQueryString()}">${menuLvl0?.menuText}</a>
			</g:if>
			<g:else>
				<g:link controller="site" action="page" params="[pageId: menuLvl0?.page?.id, menuId:menuLvl0?.id]">${menuLvl0?.menuText}</g:link>
			</g:else>
		</li> 
	</g:each>
	</g:if>
	<li class="first"></li>
</ul>
<div class="backlist">
<ul class="menuSecondLevel">

	<g:if test="${!menusByLevel[1]}">
		<li class="first"></li>
	</g:if>
	<g:else>
		<g:each in="${menusByLevel[1]}" var="menuLvl1" status="i">
			<li class="${activeMenus && menuLvl1.id == activeMenus[1]?.id ? 'active ' : ''} ${i == 0 ? ' first' : ''}">
				<g:if test="${menuLvl1.uri}">
					<a href="${request.getContextPath() + menuLvl1.uri}?${request.getQueryString()}">${menuLvl1.menuText}</a>
				</g:if>
				<g:else>
					<g:link controller="site" action="page" params="[pageId: menuLvl1.page?.id, menuId:menuLvl1.id]">${menuLvl1.menuText}</g:link>
				</g:else>
			</li>
		</g:each>
		<li></li>
	</g:else>
</ul>
</div>

<!-- QuickMenu Structure [Menu 0] -->
<ul id="qm0" class="qmmc">

	<li><a href="javascript:void(0)">Home</a></li>
	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a class="qmparent" href="javascript:void(0)">Produtos</a>

		<ul>
		<li><a href="javascript:void(0)">PABX</a></li>
		<li><a href="javascript:void(0)">Interface Celular</a></li>
		<li><a href="javascript:void(0)">VoIP</a></li>
		<li><a href="javascript:void(0)">Financiamento pelo BNDES</a></li>
		</ul></li>

	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a class="qmparent" href="javascript:void(0)">Serviços</a>

		<ul>
		<li><a href="javascript:void(0)">Serviços Customizados</a></li>
		<li><a href="javascript:void(0)">Softswitch VoIP</a></li>
		</ul></li>

	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a class="qmparent" href="javascript:void(0)">Empresa</a>

		<ul>
		<li><a href="javascript:void(0)">A Empresa</a></li>
		<li><a href="javascript:void(0)">A Fabrica</a></li>
		<li><a href="javascript:void(0)">Filial Rio</a></li>
		<li><a href="javascript:void(0);">New Item</a></li>
		</ul></li>

	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a href="javascript:void(0);">Revendas</a></li>
	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a href="javascript:void(0);">Fale com o Presidente</a></li>
	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a href="javascript:void(0);">Contato</a></li>
	<li><span class="qmdivider qmdividery" ></span></li>
	<li><a href="javascript:void(0);">Pós-venda</a></li>
<li class="qmclear">&nbsp;</li></ul>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
