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
<!-- Block Newsletter module-->
{*<div id="newsletter_block_left" class="block">
	<h4>{l s='Newsletter' mod='blocknewsletter'}</h4>
	<div class="block_content">
		<form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
			<div class="form-group{if isset($msg) && $msg } {if $nw_error}form-error{else}form-ok{/if}{/if}" >
				<input class="inputNew form-control grey newsletter-input" id="newsletter-input" type="text" name="email" size="18" value="{if isset($msg) && $msg}{$msg}{elseif isset($value) && $value}{$value}{else}{l s='Enter your e-mail' mod='blocknewsletter'}{/if}" />
                <button type="submit" name="submitNewsletter" class="btn btn-default button button-small">
                    <span>{l s='Ok' mod='blocknewsletter'}</span>
                </button>
				<input type="hidden" name="action" value="0" />
			</div>
		</form>
	</div>
    {hook h="displayBlockNewsletterBottom" from='blocknewsletter'}
</div>*}
<div class="block-newletter style4">
	<div class="head">
		<div class="section-title text-center">
			<h3>{l s='Newsletter' mod='blocknewsletter'}</h3>
			<span class="sub-title">{l s='Sign up for Our Newsletter &amp; Promotions' mod='blocknewsletter'}</span>
		</div>
	</div>
	<div class="form">
		<div class="desc">
			<span class="text-primary">{l s='SALE UPTO' mod='blocknewsletter'}<span class="big-text">{l s='30%' mod='blocknewsletter'}</span></span>
			<span>{l s='On your next purchase!' mod='blocknewsletter'}</span>
		</div>
		<form class="form-newsletter newletter" action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
			<input class="inputNew form-control newsletter-input email-text" id="newsletter-input" type="text" name="email" size="18" value="{if isset($msg) && $msg}{$msg}{elseif isset($value) && $value}{$value}{else}{l s='Your email address here...' mod='blocknewsletter'}{/if}" />
			<button type="submit" name="submitNewsletter" class="button ">
				<span>{l s='SIGNUP' mod='blocknewsletter'}</span>
			</button>
			<input type="hidden" name="action" value="0" />
		</form>

	</div>
</div>
{strip}{addJsDefL name=placeholder_blocknewsletter}{l s='Your email address here...' mod='blocknewsletter' js=1}{/addJsDefL}{/strip}