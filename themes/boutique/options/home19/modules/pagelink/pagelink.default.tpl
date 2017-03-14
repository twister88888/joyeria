{if isset($menuContents) && $menuContents|@count >0}
    <div class="{$custom_class} pagelink-widget">
        <span class="icon bar">
            <span></span>
            <span></span>
            <span></span>
        </span>
        <div class="settings-wrapper">
            <div class="setting-content">
                {foreach from=$menuContents item=parent_menu name=parent_menus}
                    {if $parent_menu.link_type == 'LANGUAGE-BOX'}
                        <div class="language-box {$parent_menu.custom_class}">
                            <div class="select-language">
                                <div class="language-title">{$parent_menu.name}</div>
                                <div class="language-topbar">
                                    <div class="lang-list">
                                        <ul class="clearfix">
                                            {foreach from=$languages key=k item=language name="languages"}
                                                <li {if $language.iso_code == $lang_iso}class="active"{/if}>
                                                    <a href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}">
                                                        <img src="{$img_lang_dir}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" />
                                                        {*<span class="long-name">{$language.name}</span>
                                                        <span class="short-name">{$language.iso_code}</span>*}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {elseif $parent_menu.link_type == 'CURRENCY-BOX'}
                        <div class="currency-box {$parent_menu.custom_class}">
                            <div class="select-currency">
                                <div class="currency-title">{$parent_menu.name}</div>
                                <div class="currency-topbar">
                                    <div class="currency-list">
                                        <ul class="clearfix">
                                            {foreach from=$currencies key=k item=f_currency}
                                                <li {if $parent_menu.currencies.iso_code == $f_currency.iso_code}class="active"{/if}>
                                                    <a  href="javascript:setCurrency({$f_currency.id_currency});">
                                                        {$f_currency.sign}
                                                        {*<span class="long-name">{$f_currency.name}</span>
                                                        <span class="short-name">{$f_currency.iso_code}</span>*}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {else}
                        <div class="link_item {$parent_menu.custom_class}">
                            <a href="{$parent_menu.link}" title="{$parent_menu.name}">
                                {if $parent_menu.icon_type == 'class'}
                                    <i class="{$parent_menu.full_path}"></i>
                                {else}
                                    {if $parent_menu.full_path != ''}
                                        <img src="{$parent_menu.full_path}" alt="{$parent_menu.name}" />
                                    {/if}
                                {/if}
                                <span class="link-title">{$parent_menu.name}</span>
                            </a>
                        </div>
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{/if}