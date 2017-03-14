<div class="margin-top-50 section-lasttest-blog">
	<div class="section-title style6 text-center margin-bottom-40">
		<h3>{l s='from to blog' mod='smartbloghomelatestnews'}</h3>
		<span class="sub-title">{l s='There are many variations of passages' mod='smartbloghomelatestnews'}</span>
	</div>
	{if isset($view_data) AND !empty($view_data)}
	<div class="lastest-blog style5 nav-center-center nav-style6 owl-carousel no-overflow" data-nav="true" data-dots="false" {if $view_data|count >1}data-loop="true"{else}data-loop="false"{/if} data-margin="30" data-responsive='{ldelim}"0":{ldelim}"items":1{rdelim},"600":{ldelim}"items":1{rdelim},"1000":{ldelim}"items":3{rdelim}{rdelim}'>
		{foreach from=$view_data item=post}
		{assign var="options" value=null}
		{$options.id_post = $post.id}
		{$options.slug = $post.link_rewrite}
			<div class="item-blog">
				<div class="thumb"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><img alt="{$post.title}" src="{$modules_dir}smartblog/images/{$post.post_img}-home-default.jpg"></a></div>
				<div class="info">
					<div class="metas">
						<span class="date">
							<span class="day">{$post.date_added|date_format:"%d"}</span>
							<span class="month">{$post.date_added|date_format:"%b"}</span>
						</span>
						{*<span><a href="#">Bubbles</a></span>*}
					</div>
					<h3 class="blog-title"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title|truncate:40:'...'}</a></h3>
					<a class="readmore" href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">read more</a>
				</div>
			</div>
		{/foreach}
	</div>
	{/if}
</div>