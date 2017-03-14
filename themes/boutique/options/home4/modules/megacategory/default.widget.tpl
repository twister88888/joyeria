{*<pre>{$widget|print_r}</pre>*}
{if isset($widget.products) && $widget.products|@count >0}
	{$widget.bef}
	{assign var="liwidth" value="mobile-slide-item `$widget.class_ts` `$widget.class_xs` `$widget.class_sm` `$widget.class_md` `$widget.class_lg`"}
	<div class="megacategory {$widget.layout} {$widget.custom_class}">
		{if $widget.display_name == '1'}
			<div class="section-title text-center margin-bottom-30">
				<h3>{$widget.name}</h3>
			</div>
		{/if}
		<div class="block-top-sell">
		<div class="box-product-list row owl-carousel-mobile nav-style7 nav-center-center" data-nav="false" data-dots="false" data-margin="0"{if $widget.products|@count > 1} data-loop="true"{/if} data-items="1">
			{include file="$tpl_dir./product-list.tpl" is_slide=true products = $widget.products home_img_type=$widget.image_type home_img_size=$widget.image_size itemClass=$liwidth}
		</div>
		</div>
	</div>
	{$widget.aft}
{/if}
 