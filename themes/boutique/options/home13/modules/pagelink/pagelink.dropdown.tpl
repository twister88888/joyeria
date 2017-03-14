{$bef}
{if isset($menuContents) && $menuContents|@count >0}
<ul class="pagelink_categories {$custom_class}">
    {foreach from=$menuContents item=parent_menu name=parent_menus}
        {if $parent_menu.link_type == 'CURRENCY-BOX'}
            <li class="menu-item-has-children">
                <a title="{l s='Currenct' mod='pagelink'}" href="{$parent_menu.link}">{if $parent_menu.custom_class == 'use_iso'}{$parent_menu.currencies.iso_code}{else}{$parent_menu.currencies.name}{/if}</a>
                <ul class="sub-menu">
                    {foreach from=$currencies key=k item=f_currency}
                        <li>
                            <a  href="javascript:setCurrency({$f_currency.id_currency});">
                                {if $parent_menu.custom_class == 'use_iso'}
                                    {$f_currency.iso_code}
                                {else}
                                    {$f_currency.name}
                                {/if}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </li>
        {elseif $parent_menu.link_type == 'LANGUAGE-BOX'}
            <li class="menu-item-has-children">
                <a title="{l s='Language' mod='pagelink'}" href="#">
                    <img src="{$img_lang_dir}{$lang_id}.jpg" alt="{$lang_iso_code}" width="16" height="11" />{$lang_name}</a>

                <ul class="sub-menu">
                    {foreach from=$languages key=k item=language name="languages"}
                        <li {if $language.iso_code == $lang_iso}class="selected_language"{/if}>
                            {if $language.iso_code != $lang_iso}
                                {assign var=indice_lang value=$language.id_lang}
                                {if isset($lang_rewrite_urls.$indice_lang)}
                                    <a href="{$lang_rewrite_urls.$indice_lang|escape:htmlall}">
                                        {if $parent_menu.custom_class == 'use_iso'}
                                            {$language.iso_code}
                                        {else}
                                            {$language.name}
                                        {/if}
                                    </a>
                                {else}
                                    <a href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}">                     {if $parent_menu.custom_class == 'use_iso'}
                                            {$language.iso_code}
                                        {else}
                                            {$language.name}
                                        {/if}
                                    </a>
                                {/if}
                            {else}
                                <a href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}">
                                    {if $parent_menu.custom_class == 'use_iso'}
                                        {$language.iso_code}
                                    {else}
                                        {$language.name}
                                    {/if}
                                </a>
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            </li>
        {else}
            <li class="menu-item-has-children">
                {if isset($parent_menu.submenus) && $parent_menu.submenus|@count >0}
                    <a href="{$parent_menu.link}" title="{$parent_menu.name}">
                        {if $parent_menu.icon_type == 'class'}
                            <i class="{$parent_menu.full_path}"></i>
                        {else}
                            {if $parent_menu.full_path != ''}
                                <img src="{$parent_menu.full_path}" alt="{$parent_menu.name}" />
                            {/if}
                        {/if}
                        {$parent_menu.name}
                    </a>
                    <ul class="sub-menu">
                        {foreach from=$parent_menu.submenus item=sub name=subs}
                            <li class="{$sub.custom_class}">
                                <a href="{$sub.link}" title="{$sub.name}">
                                    {if $parent_menu.icon_type == 'class'}
                                        <i class="{$sub.full_path}"></i>
                                    {else}
                                        {if $parent_menu.full_path != ''}
                                            <img src="{$sub.full_path}" alt="{$sub.name}" />
                                        {/if}
                                    {/if}
                                    {$sub.name}
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    <a href="{$parent_menu.link}" title="{$parent_menu.name}">
                        {if $parent_menu.icon_type == 'class'}
                            <i class="{$parent_menu.full_path}"></i>
                        {else}
                            {if $parent_menu.full_path != ''}
                                <img src="{$parent_menu.full_path}" alt="{$parent_menu.name}" />
                            {/if}
                        {/if}
                        {$parent_menu.name}
                    </a>
                {/if}
            </li>
        {/if}
    {/foreach}
</ul>
{/if}
{$aft}