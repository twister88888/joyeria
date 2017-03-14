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
{if isset($products) && $products}
	{if (!isset($themeSetting))}
		{if !class_exists(OvicLayoutControl)}
			{hook h='addOvicLayout'}
		{/if}
		{assign var='themeSetting' value=OvicLayoutControl::getOptionListSetting()}
	{/if}
	{*define number of products per line in other page for desktop*}
	{if !isset($home_img_type)}
		{if isset($themeSetting.imagehome)}
			{assign var='home_img_type' value=$themeSetting.imagehome.type}
			{assign var='home_img_size' value=$themeSetting.imagehome.size}
		{else}
			{assign var='home_img_type' value='home_default'}
			{if isset($homeSize)}
				{assign var='home_img_size' value=$homeSize}
			{/if}
		{/if}
	{/if}
	{if !isset($liwidth)}
		{assign var='liwidth' value="col-xs-{math equation="x/y" x=12 y=$themeSetting.mobile_col} col-sm-{math equation="x/y" x=12 y=$themeSetting.tablet_col} col-md-{math equation="x/y" x=12 y=$themeSetting.desktop_col} col-lg-{math equation="x/y" x=12 y=$themeSetting.large_col}"}
	{/if}
	{if !isset($col_setting)}
		{assign var="col_setting" value="lg-columns-`$themeSetting.large_col` desktop-columns-`$themeSetting.desktop_col` tablet-columns-`$themeSetting.tablet_col` mobile-columns-`$themeSetting.mobile_col`"}
	{/if}
	<!-- Products list -->
	{if !isset($is_slide) || $is_slide == false}
	<div{if isset($id) && $id} id="{$id}"{/if} class="product-list-grid product_list row {$col_setting}{if isset($class) && $class} {$class}{/if}" data-col="{$col_setting}" data-liwidth="{$liwidth}">
	{else}
		{assign var='liwidth' value=""}
		{if isset($nbitemperslide) && $nbitemperslide > 1}
			<div class="product-list-grid">
		{/if}
	{/if}
		{foreach from=$products item=product name=products}
			{assign var='imginfo' value = Image::getImages(Language::getIdByIso($lang_iso),$product.id_product)}
			{assign var='new_idimg' value=''}
			{foreach from=$imginfo item=imgitem}
				{if !$imgitem['cover']}
					{assign var='new_idimg' value="`$imgitem['id_product']`-`$imgitem['id_image']`"}
					{break}
				{/if}
			{/foreach}
			<div itemscope itemtype="http://schema.org/Product" class="product-item style8 ajax_block_product {$liwidth} {if isset($itemClass)} {$itemClass}{/if}">
				<div class="product-inner">
					<div class="product-thumb{if !empty($new_idimg)} has-back-image{/if}">
						<div class="product-image-container">
							{if isset($product.new) && $product.new == 1}
								<span class="new">new</span>
							{/if}
							{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<span class="sale">Sale</span>
							{/if}
							<a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
								<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, $home_img_type)|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($home_img_size)} width="{$home_img_size.width}" height="{$home_img_size.height}"{/if} itemprop="image" />
							</a>
							{if !empty($new_idimg)}
								<a class="back-image" href="{$product.link|escape:'html':'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $new_idimg, $home_img_type)|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"{if isset($home_img_size)} width="{$home_img_size.width}" height="{$home_img_size.height}"{/if}></a>
							{/if}
							<div class="group-button">
								{hook h='displayProductListFunctionalButtons' product=$product}
								{if isset($comparator_max_item) && $comparator_max_item}
									<a class="add_to_compare compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"
									   title="" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Add to Compare'}">
										<i class="fa fa-exchange"></i></a>
								{/if}
								{if isset($quick_view) && $quick_view}
									<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" data-rel="{$product.link|escape:'html':'UTF-8'}">
										<i class="fa fa-search"></i>
									</a>
								{/if}
							</div>
							{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
								<div class="add-cart-wapper">
								{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
									{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
									<a class="button ajax_add_to_cart_button add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
										{l s='Add to cart'}
									</a>
								{else}
									<span class="button ajax_add_to_cart_button disabled add_to_cart_button">
								{l s='Add to cart'}
							</span>
								{/if}
								</div>
							{/if}
						</div>
					</div>
					<div class="product-info">
						<h3 itemprop="name" class="product-name">
							<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}</a>
						</h3>
						<div class="content_price">
							{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								{hook h="displayProductPriceBlock" product=$product type='before_price'}
								<span class="price product-price">
							{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
						</span>
								{if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
									{hook h="displayProductPriceBlock" product=$product type="old_price"}
									<span class="old-price product-price">
								{displayWtPrice p=$product.price_without_reduction}
							</span>
									{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
								{/if}
								{hook h="displayProductPriceBlock" product=$product type="price"}
								{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{hook h="displayProductPriceBlock" product=$product type='after_price'}
							{/if}
						</div>
						<div class="hook-reviews">
							{hook h='displayProductListReviews' product=$product}
						</div>
						{if $PS_STOCK_MANAGEMENT && isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
							<span class="available">
								{if ($product.allow_oosp || $product.quantity > 0)}
									{l s='Available: '}
									{if $product.quantity <= 0}
										{if $product.allow_oosp}
											{if isset($product.available_later) && $product.available_later}
												<span>{$product.available_later}</span>
											{else}
												<span>{l s='In Stock'}</span>
											{/if}
										{/if}
									{else}
										{if isset($product.available_now) && $product.available_now}
											<span>{$product.available_now}</span>
										{else}
											<span>{l s='In Stock'}</span>
										{/if}
									{/if}
								{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
										{l s='Product available with different options'}
								{else}
										{l s='Out of stock'}
								{/if}
							</span>
						{/if}
						<div class="short-descript" itemprop="description">
							{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
						</div>
					</div>
				</div>
			</div>
			{if isset($is_slide) && $is_slide && isset($nbitemperslide) && $nbitemperslide >1}
				{if $smarty.foreach.products.iteration%$nbitemperslide == 0 && !$smarty.foreach.products.last}
					</div>
					<div class="product-list-grid">
				{/if}
			{/if}
		{/foreach}
	{if !isset($is_slide) || $is_slide == false}
		</div>
	{else}
		{if isset($nbitemperslide) && $nbitemperslide > 1}
			</div>
		{/if}
	{/if}
{/if}
