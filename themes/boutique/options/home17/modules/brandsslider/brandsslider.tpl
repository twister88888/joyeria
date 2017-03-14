<!-- Brands slider module -->
    <div class="margin-bottom-60">
        <div class="brands-slide owl-carousel nav-style7 nav-center-center owl-theme owl-loaded" data-nav="true" data-dots="false" {if $manufacturers|count >1}data-loop="true"{else}data-loop="false"{/if} data-margin="65" data-responsive='{ldelim}"0":{ldelim}"items":1{rdelim},"600":{ldelim}"items":3{rdelim},"1000":{ldelim}"items":6{rdelim}{rdelim}'>
            {foreach from=$manufacturers item=manufacturer name=manufacturer_list}
                <a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'html'}">
                    <img src="{$img_manu_dir}{$manufacturer.image}" alt="{$manufacturer.name}"/></a>
            {/foreach}
        </div>
    </div>
<!-- /Brands slider module -->