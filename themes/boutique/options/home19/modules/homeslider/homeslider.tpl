<!-- Module HomeSlider -->
{if isset($homeslider_slides)}
	<div class="full-width">
		<div id="homepage-slider" class="full-screen home-slide-3 home-slide-5">
			{if isset($homeslider_slides.0) && isset($homeslider_slides.0.sizes.1)}{capture name='height'}{$homeslider_slides.0.sizes.1}{/capture}{/if}
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
	</div>
	<div class="clearBoth"></div>
{/if}
<!-- /Module HomeSlider -->