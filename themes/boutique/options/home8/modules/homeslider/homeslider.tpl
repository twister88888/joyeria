<!-- Module HomeSlider -->
{if isset($homeslider_slides)}
	<div id="homepage-slider" class="full-screen">
		<ul id="homeslider">
			{foreach from=$homeslider_slides item=slide}
				{if $slide.active}

					<li class="homeslider-container">
						<a  style="background-image: url({$link->getMediaLink("`$smarty.const._MODULE_DIR_`homeslider/images/`$slide.image|escape:'htmlall':'UTF-8'`")});" href="{$slide.url|escape:'html':'UTF-8'}" title="{$slide.legend|escape:'html':'UTF-8'}">
							&nbsp;
						</a>
						{if isset($slide.description) && trim($slide.description) != ''}
							<div class="homeslider-description">{$slide.description}</div>
						{/if}
					</li>
				{/if}
			{/foreach}
		</ul>
	</div>
	<div class="clearBoth"></div>
{/if}
<!-- /Module HomeSlider -->