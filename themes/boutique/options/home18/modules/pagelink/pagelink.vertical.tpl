	{if isset($menuContents) && $menuContents|@count >0}
		<div class="block-category-carousel {$custom_class}">
			<div class="inner">
				{if $display_name == 1}
					<h3 class="title">{$name}</h3>
				{/if}
				{$bef}
				<div class="block-inner owl-carousel nav-style2 nav-center-center" data-nav="true" data-dots="true" data-items="1" data-loop="false" data-autoplay="true">
					<ul class="list-cat">
					{counter assign=i start=0 print=false}
					{foreach from=$menuContents item=parent_menu name=parent_menus}
						{if $parent_menu.link_type != 'LANGUAGE-BOX' && $parent_menu.link_type != 'CURRENCY-BOX'}
							{counter}
							<li{if isset($parent_menu.custom_class) && $parent_menu.custom_class|count_characters>0} class="{$parent_menu.custom_class}"{/if}>
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
							</li>
							{if ($i % 4 == 0) && !$smarty.foreach.parent_menus.last}
								</ul><ul class="list-cat">
							{/if}
						{/if}
					{/foreach}
					</ul>
				</div>
			</div>
		</div>
		{$aft}
	{/if}
