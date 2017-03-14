{if isset($widget.products) && $widget.products|@count >0}
    {$widget.bef}
    {assign var="liwidth" value="mobile-slide-item `$widget.class_ts` `$widget.class_xs` `$widget.class_sm` `$widget.class_md` `$widget.class_lg`"}
    {assign var="col_setting" value="lg-columns-`$widget.large_columns` desktop-columns-`$widget.desktop_columns` tablet-columns-`$widget.tablet_columns` mobile-columns-`$widget.mobile_columns`"}
    {assign var="liwidth" value="mobile-slide-item `$widget.class_ts` `$widget.class_xs` `$widget.class_sm` `$widget.class_md` `$widget.class_lg`"}
    {assign var="col_setting" value="lg-columns-`$widget.large_columns` desktop-columns-`$widget.desktop_columns` tablet-columns-`$widget.tablet_columns` mobile-columns-`$widget.mobile_columns`"}
    <div class="megacategory {$widget.layout} {$widget.custom_class}">
        <div class="load_more_products">
        {$widget.description}
        {include file="$tpl_dir./product-list.tpl" products = $widget.products liwidth=$liwidth col_setting=$col_setting home_img_type=$widget.image_type home_img_size=$widget.image_size}
        <a class="button-loadmore" data-id="{$widget.id}" data-type="widget"  data-page="0" data-liwidth="{$liwidth}" href="javascript:void(0);">load more!</a>
        </div>
    </div>
    {$widget.aft}
{/if}