{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if count($categoryProducts) > 0 && $categoryProducts !== false}
	<div class="product-slide upsell-products">
		<div class="section-title text-center"><h3>{l s='UPSELL PRODUCTS' mod='productscategory'}</h3> </div>
		<div class="owl-carousel nav-center-center nav-style7" data-responsive='{ldelim}"0":{ldelim}"items":1{rdelim},"600":{ldelim}"items":3{rdelim},"1000":{ldelim}"items":4{rdelim}{rdelim}' data-autoplay="true"{if $categoryProducts|count>1} data-loop="true"{/if} data-items="4" data-dots="false" data-nav="false" data-margin="30">
			{include file="$tpl_dir./product-list.tpl" is_slide=true products = $categoryProducts}
			{*{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
			<li class="product-item">
				<div class="product-inner">
					<div class="product-thumb">
						<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" class="lnk_img product-image" title="{$categoryProduct.name|htmlspecialchars}"><img src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$categoryProduct.name|htmlspecialchars}" /></a>
						<div class="group-button">
							{hook h='displayProductListFunctionalButtons' product=$categoryProduct}
							{if isset($comparator_max_item) && $comparator_max_item}
								<a class="add_to_compare compare" href="{$categoryProduct.link|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product}"
								   title="" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Add to Compare'}">
									<i class="fa fa-exchange"></i></a>
							{/if}
							{if isset($quick_view) && $quick_view}
								<a class="quick-view" href="{$categoryProduct.link|escape:'html':'UTF-8'}" rel="{$categoryProduct.link|escape:'html':'UTF-8'}">
									<i class="fa fa-search"></i>
								</a>
							{/if}
						</div>
					</div>
					<div class="product-info">
						<h3 class="product-name"><a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)|escape:'html':'UTF-8'}" title="{$categoryProduct.name|htmlspecialchars}">{$categoryProduct.name|truncate:14:'...'|escape:'html':'UTF-8'}</a></h3>
						{if $ProdDisplayPrice && $categoryProduct.show_price == 1 && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
							<span class="price">
								{if isset($categoryProduct.specific_prices) && $categoryProduct.specific_prices
								&& ($categoryProduct.displayed_price|number_format:2 !== $categoryProduct.price_without_reduction|number_format:2)}
									<ins>{convertPrice price=$categoryProduct.displayed_price}</ins>
									*}{*{if $categoryProduct.specific_prices.reduction && $categoryProduct.specific_prices.reduction_type == 'percentage'}
										<span class="price-percent-reduction small">-{$categoryProduct.specific_prices.reduction * 100}%</span>
									{/if}*}{*
									<del>{displayWtPrice p=$categoryProduct.price_without_reduction}</del>

								{else}
									<ins>{convertPrice price=$categoryProduct.displayed_price}</ins>
								{/if}
							</span>
						{/if}
						{if !$PS_CATALOG_MODE && ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
							<div class="no-print">
								<a class="button ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$categoryProduct.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product|intval}" title="{l s='Add to cart' mod='productscategory'}">
									<span>{l s='Add to cart' mod='productscategory'}</span>
								</a>
							</div>
						{/if}
					</div>
				</div>
			</li>
			{/foreach}*}
		</div>
	</div>
{/if}
