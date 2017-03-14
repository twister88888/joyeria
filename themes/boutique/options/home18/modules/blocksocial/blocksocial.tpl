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
<div class="widget widget_social">
	<h3 class="widget-title">{l s='Follow Us' mod='blocksocial'}</h3>
	<div class="content">
		<div class="social">
			{if isset($facebook_url) && $facebook_url != ''}
				<a href="{$facebook_url|escape:html:'UTF-8'}"><i class="fa fa-facebook"></i></a>
			{/if}
			{if isset($twitter_url) && $twitter_url != ''}
				<a href="{$twitter_url|escape:html:'UTF-8'}"><i class="fa fa-twitter"></i></a>
			{/if}
			{if isset($rss_url) && $rss_url != ''}<a href="{$rss_url|escape:html:'UTF-8'}"><i class="fa fa-rss"></i></a>{/if}
			{if isset($youtube_url) && $youtube_url != ''}<a href="{$youtube_url|escape:html:'UTF-8'}"><i class="fa fa-youtube"></i></a>{/if}
			{if isset($google_plus_url) && $google_plus_url != ''}
				<a href="{$google_plus_url|escape:html:'UTF-8'}"><i class="fa fa-google-plus"></i></a>
			{/if}
			{if isset($instagram_url) && $instagram_url != ''}
				<a href="{$instagram_url|escape:html:'UTF-8'}"><i class="fa fa-instagram"></i></a>
			{/if}
			{if isset($pinterest_url) && $pinterest_url != ''}
				<a href="{$pinterest_url|escape:html:'UTF-8'}"><i class="fa fa-pinterest"></i></a>
			{/if}
			{if isset($vimeo_url) && $vimeo_url != ''}
				<a href="{$vimeo_url|escape:html:'UTF-8'}"><i class="fa fa-vimeo"></i></a>
			{/if}
		</div>
	</div>
</div>