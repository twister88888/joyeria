<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($current_dir)}{$current_dir|escape:'html':'UTF-8'}{/if}{if isset($page_name)} {$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{else} show-left-column{/if}{if $hide_right_column} hide-right-column{else} show-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso}">
{if ($page_name != 'category' && $page_name !='best-sales' && $page_name != 'search' && $page_name != 'manufacturer' && $page_name != 'supplier' && $page_name != 'prices-drop' && $page_name != 'new-products') and isset($compared_products)}{addJsDef comparedProductsIds=$compared_products}{/if}
{if !isset($content_only) || !$content_only}
{if isset($restricted_country_mode) && $restricted_country_mode}
	<div id="restricted-country">
		<p>{l s='You cannot place a new order from your country.'}{if isset($geolocation_country) && $geolocation_country} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>{/if}</p>
	</div>
{/if}
<div id="page">
	<div id="box-mobile-menu" class="box-mobile-menu">
		<div class="box-inner">
			<span class="close-menu"><span class="icon pe-7s-close"></span></span>
		</div>
	</div>
	{capture name='displayBanner'}{hook h='displayBanner'}{/capture}
	{if $smarty.capture.displayBanner}
		<div class="banner">
			<div class="container">
				<div class="row">
					{$smarty.capture.displayBanner}
				</div>
			</div>
		</div>
	{/if}
	<div class="header-container">
		<header id="header" class="header style3 style4">
			<div class="top-header">
				<div class="inner">
					<div  class="main-menu-wapper">
						<div class="row">
							<div class="col-md-12 col-lg-3 logo-wapper">
								<div id="header_logo">
									<a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{$shop_name|escape:'html':'UTF-8'}">
										<img class="logo img-responsive" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if isset($logo_image_width) && $logo_image_width} width="{$logo_image_width}"{/if}{if isset($logo_image_height) && $logo_image_height} height="{$logo_image_height}"{/if}/>
									</a>
								</div>
							</div>
							<div class="col-xs-2 col-sm-3 col-md-6 col-lg-6">
								<div class="menu-container">
									{capture name='displayNav'}{hook h='displayNav'}{/capture}
									{if $smarty.capture.displayNav}
										{$smarty.capture.displayNav}
									{/if}
									<span class="mobile-navigation"><i class="fa fa-bars"></i></span>
								</div>
							</div>
							<div class="col-xs-10 col-sm-9 col-md-6 col-lg-3 control-wapper">
								<div class="box-control">
									{if isset($HOOK_TOP)}{$HOOK_TOP}{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="menu_sticky">
				<div class="sticky_content">
					<div class="container">
						<div class="col-xs-2 col-sm-3 col-md-6 col-lg-6">
							<div class="menu-container">
								{capture name='displayNav'}{hook h='displayNav'}{/capture}
								{if $smarty.capture.displayNav}
									{$smarty.capture.displayNav}
								{/if}
								<span class="mobile-navigation"><i class="fa fa-bars"></i></span>
							</div>
						</div>
						<div class="col-xs-10 col-sm-9 col-md-6 col-lg-3 control-wapper">
							<div class="box-control">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="main-header">
				<div class="container">
					{if isset($BEFORE_LOGO)}{$BEFORE_LOGO}{/if}
				</div>
			</div>
		</header>
	</div>
	<div class="columns-container">
		{if isset($HOOK_HOME_TOP_COLUMN) && $HOOK_HOME_TOP_COLUMN|trim}
			{$HOOK_HOME_TOP_COLUMN}
		{/if}
		<div id="columns" class="container">
			<div id="slider_row" class="row">
				{capture name='displayTopColumn'}{hook h='displayTopColumn'}{/capture}
				{if $smarty.capture.displayTopColumn}
					<div id="top_column" class="center_column col-xs-12 col-sm-12">{$smarty.capture.displayTopColumn}</div>
				{/if}
			</div>
			{if $page_name !='index' && $page_name !='pagenotfound'}
				{include file="$tpl_dir./breadcrumb.tpl"}
			{/if}
			<div class="row">
				{if isset($left_column_size) && !empty($left_column_size)}
					<div id="left_column" class="column col-xs-12 col-sm-{$left_column_size|intval}">{$HOOK_LEFT_COLUMN}</div>
				{/if}
				{if isset($left_column_size) && isset($right_column_size)}{assign var='cols' value=(12 - $left_column_size - $right_column_size)}{else}{assign var='cols' value=12}{/if}
				<div id="center_column" class="center_column col-xs-12 col-sm-{$cols|intval}">
{/if}