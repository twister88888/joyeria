<div class="margin-top-95 section-lasttest-blog">
	<div class="section-title style4 text-center">
		<span class="text-head">{l s='B' mod='smartbloghomelatestnews'}</span>
		<h3><a href="{smartblog::GetSmartBlogLink('smartblog')}">{l s='from to blog' mod='smartbloghomelatestnews'}</a></h3>
	</div>
	{if isset($view_data) AND !empty($view_data)}
	<div class="lastest-blog style3 nav-center-center nav-style7 owl-carousel owl-theme owl-loaded" data-nav="true" data-dots="false" {if $view_data|count >1}data-loop="true"{else}data-loop="false"{/if} data-margin="30" data-responsive='{ldelim}"0":{ldelim}"items":1{rdelim},"600":{ldelim}"items":2{rdelim},"1000":{ldelim}"items":3{rdelim}{rdelim}'>
		{foreach from=$view_data item=post}
		{assign var="options" value=null}
		{$options.id_post = $post.id}
		{$options.slug = $post.link_rewrite}
			<div class="item-blog">
				<h3 class="blog-title"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title|truncate:40:'...'}</a></h3>
				<div class="thumb"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><img alt="{$post.title}" src="{$modules_dir}smartblog/images/{$post.post_img}-home-default.jpg"></a></div>
				<div class="metas">
					{*<span><a href="#">Webdesign</a></span>*}
					<span class="date">{$post.date_added|date_format:"%D"}</span>
					<span class="comment"><i class="fa fa-eye"></i> {$post.viewed} {l s='Viewed' mod='smartbloghomelatestnews'}</span>
				</div>
				<div class="desc">
					{$post.short_description|escape:'htmlall':'UTF-8'}
				</div>
			</div>
		{/foreach}
	</div>
	{/if}
</div>