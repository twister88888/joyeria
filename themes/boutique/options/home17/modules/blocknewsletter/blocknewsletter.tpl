<div class="margin-top-30">
	<div class="block-newletter">
		<div class="head">
			<div class="section-title text-center">
				<h3>{l s='Newsletter' mod='blocknewsletter'}</h3>
				<span class="sub-title">{l s='Sign up for Our Newsletter & Promotions' mod='blocknewsletter'}</span>
			</div>
		</div>
		<div class="form">
			<form class="newletter" action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
				<input class="inputNew form-control newsletter-input email-text" id="newsletter-input" type="text" name="email" size="18" value="{if isset($msg) && $msg}{$msg}{elseif isset($value) && $value}{$value}{else}{l s='Your email address here...' mod='blocknewsletter'}{/if}" />
				<button type="submit" name="submitNewsletter" class="button ">
					<span>{l s='SIGNUP' mod='blocknewsletter'}</span>
				</button>
				<input type="hidden" name="action" value="0" />
			</form>
			<div class="desc">
				<span class="text-primary">{l s='SALE UPTO' mod='blocknewsletter'} <span class="big-text">{l s='30%' mod='blocknewsletter'}</span></span>
				<span>{l s='On your next purchase!' mod='blocknewsletter'}</span>
			</div>
		</div>
	</div>
</div>
{strip}{addJsDefL name=placeholder_blocknewsletter}{l s='Your email address here...' mod='blocknewsletter' js=1}{/addJsDefL}{/strip}