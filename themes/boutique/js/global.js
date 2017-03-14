/*
 * 2007-2015 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2015 PrestaShop SA
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */
//global variables
var responsiveflag = false;
$(document).ready(function(){
	highdpiInit();
	responsiveResize();
	init_menu_reposive();
	if (navigator.userAgent.match(/Android/i))
	{
		var viewport = document.querySelector('meta[name="viewport"]');
		viewport.setAttribute('content', 'initial-scale=1.0,maximum-scale=1.0,user-scalable=0,width=device-width,height=device-height');
		window.scrollTo(0, 1);
	}
	if (typeof quickView !== 'undefined' && quickView)
		quick_view();
	dropDown();

	if (typeof page_name != 'undefined' && !in_array(page_name, ['index', 'product']))
	{
		bindGrid();

		$(document).on('change', '.selectProductSort', function(e){
			if (typeof request != 'undefined' && request)
				var requestSortProducts = request;
			var splitData = $(this).val().split(':');
			var url = '';
			if (typeof requestSortProducts != 'undefined' && requestSortProducts)
			{
				url += requestSortProducts ;
				if (typeof splitData[0] !== 'undefined' && splitData[0])
				{
					url += ( requestSortProducts.indexOf('?') < 0 ? '?' : '&') + 'orderby=' + splitData[0] + (splitData[1] ? '&orderway=' + splitData[1] : '');
					if (typeof splitData[1] !== 'undefined' && splitData[1])
						url += '&orderway=' + splitData[1];
				}
				document.location.href = url;
			}
		});

		$(document).on('change', 'select[name="n"]', function(){
			$(this.form).submit();
		});

		$(document).on('change', 'select[name="currency_payment"]', function(){
			setCurrency($(this).val());
		});
	}

	$(document).on('change', 'select[name="manufacturer_list"], select[name="supplier_list"]', function(){
		if (this.value != '')
			location.href = this.value;
	});

	$(document).on('click', '.back', function(e){
		e.preventDefault();
		history.back();
	});

	jQuery.curCSS = jQuery.css;
	if (!!$.prototype.cluetip)
		$('a.cluetip').cluetip({
			local:true,
			cursor: 'pointer',
			dropShadow: false,
			dropShadowSteps: 0,
			showTitle: false,
			tracking: true,
			sticky: false,
			mouseOutClose: true,
			fx: {
				open:       'fadeIn',
				openSpeed:  'fast'
			}
		}).css('opacity', 0.8);

	if (typeof(FancyboxI18nClose) !== 'undefined' && typeof(FancyboxI18nNext) !== 'undefined' && typeof(FancyboxI18nPrev) !== 'undefined' && !!$.prototype.fancybox)
		$.extend($.fancybox.defaults.tpl, {
			closeBtn : '<a title="' + FancyboxI18nClose + '" class="fancybox-item fancybox-close" href="javascript:;"></a>',
			next     : '<a title="' + FancyboxI18nNext + '" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
			prev     : '<a title="' + FancyboxI18nPrev + '" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
		});

	// Close Alert messages
	$(".alert.alert-danger").on('click', this, function(e){
		if (e.offsetX >= 16 && e.offsetX <= 39 && e.offsetY >= 16 && e.offsetY <= 34)
			$(this).fadeOut();
	});
	$('#menu_sticky').sticky({topSpacing: 0});
	$('#menu_sticky').on('sticky-start', function () {
		if ((($(window).width() + scrollCompensate()) >= 768) && !($('#menu_sticky').hasClass('add_content'))) {
			if ($('#header').hasClass('style1')){
				if ($('#menu_sticky .box-control .box-settings').length == 0){
					var setting_content = $( ".top-header .box-settings" ).clone();
					setting_content.appendTo('#menu_sticky .box-control');
				}
				if ($('#menu_sticky .box-control #search_block_top').length == 0){
					$('#search_block_top').insertBefore('#menu_sticky .box-control .box-settings');
				}
			}else if($('#header').hasClass('style2')||$('#header').hasClass('style5')||$('#header').hasClass('style12')||$('#header').hasClass('style18')){
				if ($('#menu_sticky .box-control .shopping_cart_container').length == 0){
					var cart_content = $( ".main-header .shopping_cart_container" ).clone();
					cart_content.appendTo('#menu_sticky .box-control');
				}
				if ($('#menu_sticky .box-control .box-settings').length == 0){
					var setting_content = $( ".main-header .box-settings" ).clone();
					setting_content.appendTo('#menu_sticky .box-control');
				}
				if ($('#menu_sticky .box-control #search_block_top').length == 0){
					$('#search_block_top').insertBefore('#menu_sticky .box-control .shopping_cart_container');
				}
			}else if ($('#header').hasClass('style3')){
				if ($('#menu_sticky .box-control .shopping_cart_container').length == 0){
					var cart_content = $( ".top-header .shopping_cart_container" ).clone();
					cart_content.appendTo('#menu_sticky .box-control');
				}
				if ($('#menu_sticky .box-control .box-settings').length == 0){
					var setting_content = $( ".top-header .box-settings" ).clone();
					setting_content.appendTo('#menu_sticky .box-control');
				}
				if ($('#menu_sticky .box-control #search_block_top').length == 0){
					$('#search_block_top').insertBefore('#menu_sticky .box-control .shopping_cart_container');
				}
			}
			$('#menu_sticky').addClass('add_content');
		}
	});
	$('#sticker').on('sticky-update', function() {resizeTopmenu();});
	$('#menu_sticky').on('sticky-end', function () {
		if ((($(window).width() + scrollCompensate()) >= 768) && ($('#menu_sticky').hasClass('add_content'))) {
			if ($('#header').hasClass('style1')) {
				if ($('.top-header .box-control #search_block_top').length == 0)
					$('#search_block_top').insertBefore('.top-header .box-control .box-settings');
			}else if ($('#header').hasClass('style2')||$('#header').hasClass('style5')||$('#header').hasClass('style12')||$('#header').hasClass('style18')) {
				if ($('.main-header .box-control #search_block_top').length == 0)
					$('#search_block_top').insertBefore('.main-header .box-control .shopping_cart_container');
			}else if ($('#header').hasClass('style3')) {
				if ($('.top-header .box-control #search_block_top').length == 0)
					$('#search_block_top').insertBefore('.top-header .box-control .shopping_cart_container');
			}
			$('#menu_sticky').removeClass('add_content');
		}
	});
	/* ---------------------------------------------
	 Owl carousel
	 --------------------------------------------- */
	$('.owl-carousel').each(function(){
		var config = $(this).data();
		var animateOut = $(this).data('animateout');
		var animateIn = $(this).data('animatein');
		if(typeof animateOut != 'undefined' ){
			config.animateOut = animateOut;
		}
		if(typeof animateIn != 'undefined' ){
			config.animateIn = animateIn;
		}
		var owl = $(this);
		owl.owlCarousel(config);
	});
	// BOX MOBILE MENU
	$(document).on('click','.mobile-navigation',function(){
		$('#box-mobile-menu').addClass('open');
	});
	// Close box menu
	$(document).on('click','#box-mobile-menu .close-menu',function(){
		$('#box-mobile-menu').removeClass('open');
	});

	// Box Setting
	$(document).on('click','.box-settings .icon',function(){
		$(this).closest('.box-settings').toggleClass('open');
	})
	// Scroll top
	$(document).on('click','.scroll_top',function(){
		$('body,html').animate({scrollTop:0},400);
		return false;
	});
	//SKILL BAR
	if ($('.item-processbar').length > 0){
		$('.item-processbar').each(function(){
			var $heightSkill = $(this).attr('data-height'),
				$percentSkill = $(this).attr('data-percent'),
				$bgSkill = $(this).attr('data-bgskill'),
				$bgBar = $(this).attr('data-bgBar');

			$(this).find('.processbar-bg').css({
				"height":$heightSkill,
				"background-color":$bgBar

			});
			$(this).find('.processbar-width').css({
				"height":$heightSkill
			});

			$(this).find('.processbar-width').animate({
				'width':$percentSkill+'%'
			},6000);

			if($bgSkill != ''){
				$(this).find('.processbar-width').css({
					'background-color':$bgSkill
				});
			};
		});
	}
	$('.tabs-container').each(function () {
		$(this).find('.tabs li:first-child').addClass('active').find('a').addClass('active');
		$(this).find('.tab-pane:first').addClass('active');
		$(this).find('.tabs li a').click(function (e) {
			e.preventDefault();
			var selector = $(this).attr('href');
			$(this).parent().parent().find('a').not(this).removeClass('active').parent().removeClass('active');

			$(this).addClass('active').parent().addClass('active');
			$(this).parents('.tabs-container').find('.tab-pane').not(selector).removeClass('active');
			$(this).parents('.tabs-container').find(selector).addClass('active');
		});
	});
	$(document).on('click','.box-search .search_block_icon',function(){
		$(this).closest('.box-search').find('#searchbox').toggle(600);
		$(this).closest('.box-search').toggleClass('open');
	});
	// MENU SIDEBAR

	$(document).on('click','#header .close-header-sidebar',function(){
		$(this).closest('#header').addClass('closed').removeClass('opened');
	})
	$(document).on('click','#header .open-header-sidebar',function(){
		$(this).closest('#header').removeClass('closed').addClass('opened');
	});

	$(document).on('click','.header-categoy-menu .close-header-sidebar',function(){
		$(this).closest('.header-categoy-menu').addClass('closed').removeClass('opened');
	})
	$(document).on('click','.header-categoy-menu .open-header-sidebar',function(){
		$(this).closest('.header-categoy-menu').removeClass('closed').addClass('opened');
	});
	// TESTANIAL STYLE 1
	if ($('.testimonials-owl-3').length > 0){
		$('.testimonials-owl-3').each(function(){
			var owl = $(this).find('.testimonial-owl');
			owl.owlCarousel(
				{
					autoplay:true,
					dots:false,
					loop:true,
					nav:true,
					smartSpeed:1000,
					margin:15,
					navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
					responsive : {
						// breakpoint from 0 up
						0 : {
							items : 2
						},
						// breakpoint from 480 up
						480 : {
							items : 2
						},
						// breakpoint from 768 up
						768 : {
							items : 3
						},
						1000 : {
							items : 3
						}
					}
				}
			);
			owl.trigger('next.owl.carousel');
			owl.on('changed.owl.carousel', function(event) {
				owl.find('.owl-item.active').removeClass('item-center');
				var caption = owl.find('.owl-item.active').first().next().find('.inner').html();

				var t = owl.closest('.testimonials-owl-3').find('.testimonial-info');
				var animated = t.data('animated');
				t.html(caption).addClass('animated '+animated).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$(this).removeClass('animated '+animated);
				});
				setTimeout(function(){
					owl.find('.owl-item.active').first().next().addClass('item-center');
				}, 100);
			})
		});
	}
	if( $('.group-banner-masonry').length >0 ){
		$('.group-banner-masonry').each(function(){
			var grid =  $('.group-banner-masonry').isotope(
				{
					itemSelector: '.banner-masonry-item',
					percentPosition: true,
					masonry: {
						// use outer width of grid-sizer for columnWidth
						columnWidth: '.grid-sizer'
					}
				}
			);
			grid.imagesLoaded().progress( function() {
				grid.isotope(
					{
						itemSelector: '.banner-masonry-item',
						percentPosition: true,
						masonry: {
							// use outer width of grid-sizer for columnWidth
							columnWidth: '.grid-sizer'
						}
					}
				);
			});
		})
	}
	$(document).on('click','.home-top-category-slide .block-toggle',function(){
		$(this).closest('.home-top-category-slide').find('.block-category-carousel').toggleClass('open');
		$(this).toggleClass('closed');
	})
	tab_owl_fade_effect();
	tab_product_fade_effect();
	positionFootersidebar();
	heightheader_categoy_menu();
	scrollbar_header_sidebar();
	$(".cart_block ").mCustomScrollbar();
	resizeTopmenu();
});

$(window).resize(function(){
	responsiveResize();
	init_carousel_mobile();
	positionFootersidebar();
	heightheader_categoy_menu();
	scrollbar_header_sidebar();
	resizeTopmenu();
});
/* ---------------------------------------------
 Scripts scroll
 --------------------------------------------- */
$(window).scroll(function(){
	// Show hide scrolltop button
	if( $(window).scrollTop() == 0 ) {
		$('.scroll_top').stop(false,true).fadeOut(600);
	}else{
		$('.scroll_top').stop(false,true).fadeIn(600);
	}
});
function highdpiInit()
{
	if (typeof highDPI === 'undefined')
		return;
	if(highDPI && $('.replace-2x').css('font-size') == "1px")
	{
		var els = $("img.replace-2x").get();
		for(var i = 0; i < els.length; i++)
		{
			src = els[i].src;
			extension = src.substr( (src.lastIndexOf('.') +1) );
			src = src.replace("." + extension, "2x." + extension);

			var img = new Image();
			img.src = src;
			img.height != 0 ? els[i].src = src : els[i].src = els[i].src;
		}
	}
}


// Used to compensante Chrome/Safari bug (they don't care about scroll bar for width)
function scrollCompensate()
{
	var inner = document.createElement('p');
	inner.style.width = "100%";
	inner.style.height = "200px";

	var outer = document.createElement('div');
	outer.style.position = "absolute";
	outer.style.top = "0px";
	outer.style.left = "0px";
	outer.style.visibility = "hidden";
	outer.style.width = "200px";
	outer.style.height = "150px";
	outer.style.overflow = "hidden";
	outer.appendChild(inner);

	document.body.appendChild(outer);
	var w1 = inner.offsetWidth;
	outer.style.overflow = 'scroll';
	var w2 = inner.offsetWidth;
	if (w1 == w2) w2 = outer.clientWidth;

	document.body.removeChild(outer);

	return (w1 - w2);
}

function responsiveResize()
{
	compensante = scrollCompensate();
	if (($(window).width()+scrollCompensate()) <= 767 && responsiveflag == false)
	{
		accordion('enable');
		accordionFooter('enable');
		responsiveflag = true;
	}
	else if (($(window).width()+scrollCompensate()) >= 768)
	{
		accordion('disable');
		accordionFooter('disable');
		responsiveflag = false;
		if (typeof bindUniform !=='undefined')
			bindUniform();
	}
	blockHover();
}

function blockHover(status)
{
	var screenLg = $('body').find('.container').width() == 1170;

	if ($('.product_list').is('.grid'))
		if (screenLg)
			$('.product_list .button-container').hide();
		else
			$('.product_list .button-container').show();

	$(document).off('mouseenter').on('mouseenter', '.product_list.grid li.ajax_block_product .product-container', function(e){
		if (screenLg)
		{
			var pcHeight = $(this).parent().outerHeight();
			var pcPHeight = $(this).parent().find('.button-container').outerHeight() + $(this).parent().find('.comments_note').outerHeight() + $(this).parent().find('.functional-buttons').outerHeight();
			$(this).parent().addClass('hovered').css({'height':pcHeight + pcPHeight, 'margin-bottom':pcPHeight * (-1)});
			$(this).find('.button-container').show();
		}
	});

	$(document).off('mouseleave').on('mouseleave', '.product_list.grid li.ajax_block_product .product-container', function(e){
		if (screenLg)
		{
			$(this).parent().removeClass('hovered').css({'height':'auto', 'margin-bottom':'0'});
			$(this).find('.button-container').hide();
		}
	});
}

function quick_view()
{
	$(document).on('click', '.quick-view:visible, .quick-view-mobile:visible', function(e){
		e.preventDefault();
		var url = $(this).attr('data-rel');
		var anchor = '';

		if (url.indexOf('#') != -1)
		{
			anchor = url.substring(url.indexOf('#'), url.length);
			url = url.substring(0, url.indexOf('#'));
		}

		if (url.indexOf('?') != -1)
			url += '&';
		else
			url += '?';

		if (!!$.prototype.fancybox)
			$.fancybox({
				'padding':  0,
				'width':    1087,
				'height':   610,
				'fitToView'   : false,
				'autoSize'    : false,
				'type':     'iframe',
				'href':     url + 'content_only=1' + anchor
			});
	});
}

function bindGrid()
{
	var storage = false;
	if (typeof(getStorageAvailable) !== 'undefined') {
		storage = getStorageAvailable();
	}
	if (!storage) {
		return;
	}

	var view = $.totalStorage('display');

	if (!view && (typeof displayList != 'undefined') && displayList)
		view = 'list';

	if (view && view != 'grid')
		display(view);
	else
		$('.display').find('.show-grid').addClass('selected');

	$(document).on('click', '.show-grid', function(e){
		e.preventDefault();
		display('grid');
	});

	$(document).on('click', '.show-list', function(e){
		e.preventDefault();
		display('list');
	});
}

function display(view)
{
	if (view == 'list')
	{
		var list_col = $('.product_list').data('col');
		$('.product_list').removeClass(list_col).removeClass('row').addClass('product-list');
		var liwidth = $('.product_list').data('liwidth');
		/// list row
		$('.product_list .product-item').removeClass(liwidth).addClass('list');
		$('.product_list .product-item > .product-inner').addClass('row');
		$('.product_list .product-item > .product-inner > .product-thumb').addClass('col-sm-4');
		$('.product_list .product-item > .product-inner > .product-info').addClass('col-sm-8');
		$('.product_list .product-item').each(function(index, element) {
			$(element).find('.group-button').appendTo($(element).find('.product-info'));
			if ($(element).hasClass('style8')){
				$(element).find('.add_to_cart_button').appendTo($(element).find('.product-info'));
			}
			/*var html = '';
			 html = '<div class="product-container"><div class="row">';
			 html += '<div class="left-block col-xs-4 col-sm-5 col-md-4">' + $(element).find('.left-block').html() + '</div>';
			 html += '<div class="center-block col-xs-4 col-sm-7 col-md-4">';
			 html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';
			 html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
			 var hookReviews = $(element).find('.hook-reviews');
			 if (hookReviews.length) {
			 html += hookReviews.clone().wrap('<div>').parent().html();
			 }
			 html += '<p class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
			 var colorList = $(element).find('.color-list-container').html();
			 if (colorList != null) {
			 html += '<div class="color-list-container">'+ colorList +'</div>';
			 }
			 var availability = $(element).find('.availability').html();	// check : catalog mode is enabled
			 if (availability != null) {
			 html += '<span class="availability">'+ availability +'</span>';
			 }
			 html += '</div>';
			 html += '<div class="right-block col-xs-4 col-sm-12 col-md-4"><div class="right-block-content row">';
			 var price = $(element).find('.content_price').html();       // check : catalog mode is enabled
			 if (price != null) {
			 html += '<div class="content_price col-xs-5 col-md-12">'+ price + '</div>';
			 }
			 html += '<div class="button-container col-xs-7 col-md-12">'+ $(element).find('.button-container').html() +'</div>';
			 html += '<div class="functional-buttons clearfix col-sm-12">' + $(element).find('.functional-buttons').html() + '</div>';
			 html += '</div>';
			 html += '</div></div>';
			 $(element).html(html);*/
		});
		$('.display').find('.show-list').addClass('selected');
		$('.display').find('.show-grid').removeClass('selected');
		$.totalStorage('display', 'list');
	}
	else
	{
		var list_col = $('.product_list').data('col');
		$('.product_list').removeClass('product-list').addClass('row').addClass(list_col);
		//$('.product_list .product-item').removeClass('').addClass('col-xs-12 col-sm-6 col-md-4');
		var liwidth = $('.product_list').data('liwidth');
		$('.product_list .product-item').removeClass('list').addClass(liwidth);
		$('.product_list .product-item > .product-inner').removeClass('row');
		$('.product_list .product-item > .product-inner > .product-thumb').removeClass('col-sm-4');
		$('.product_list .product-item > .product-inner > .product-info').removeClass('col-sm-8');
		$('.product_list .product-item').each(function(index, element) {
			if ($(element).hasClass('style8')){
				$(element).find('.add_to_cart_button').appendTo($(element).find('.add-cart-wapper'));
			}
			$(element).find('.group-button').appendTo($(element).find('.product-thumb'));
			
			/*var html = '';
			 html += '<div class="product-container">';
			 html += '<div class="left-block">' + $(element).find('.left-block').html() + '</div>';
			 html += '<div class="right-block">';
			 html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';
			 html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
			 var hookReviews = $(element).find('.hook-reviews');
			 if (hookReviews.length) {
			 html += hookReviews.clone().wrap('<div>').parent().html();
			 }
			 html += '<p itemprop="description" class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
			 var price = $(element).find('.content_price').html(); // check : catalog mode is enabled
			 if (price != null) {
			 html += '<div class="content_price">'+ price + '</div>';
			 }
			 html += '<div itemprop="offers" itemscope itemtype="https://schema.org/Offer" class="button-container">'+ $(element).find('.button-container').html() +'</div>';
			 var colorList = $(element).find('.color-list-container').html();
			 if (colorList != null) {
			 html += '<div class="color-list-container">'+ colorList +'</div>';
			 }
			 var availability = $(element).find('.availability').html(); // check : catalog mode is enabled
			 if (availability != null) {
			 html += '<span class="availability">'+ availability +'</span>';
			 }
			 html += '</div>';
			 html += '<div class="functional-buttons clearfix">' + $(element).find('.functional-buttons').html() + '</div>';
			 html += '</div>';
			 $(element).html(html);*/
		});
		$('.display').find('.show-grid').addClass('selected');
		$('.display').find('.show-list').removeClass('selected');
		/*$('.display').find('li#grid').addClass('selected');
		 $('.display').find('li#list').removeAttr('class');*/
		$.totalStorage('display', 'grid');
	}
}

function dropDown()
{
	elementClick = '#header .current';
	elementSlide =  'ul.toogle_content';
	activeClass = 'active';

	$(elementClick).on('click', function(e){
		e.stopPropagation();
		var subUl = $(this).next(elementSlide);
		if(subUl.is(':hidden'))
		{
			subUl.slideDown();
			$(this).addClass(activeClass);
		}
		else
		{
			subUl.slideUp();
			$(this).removeClass(activeClass);
		}
		$(elementClick).not(this).next(elementSlide).slideUp();
		$(elementClick).not(this).removeClass(activeClass);
		e.preventDefault();
	});

	$(elementSlide).on('click', function(e){
		e.stopPropagation();
	});

	$(document).on('click', function(e){
		e.stopPropagation();
		var elementHide = $(elementClick).next(elementSlide);
		$(elementHide).slideUp();
		$(elementClick).removeClass('active');
	});
}

function accordionFooter(status)
{
	if(status == 'enable')
	{
		$('#footer .footer-block h4').on('click', function(e){
			$(this).toggleClass('active').parent().find('.toggle-footer').stop().slideToggle('medium');
			e.preventDefault();
		})
		$('#footer').addClass('accordion').find('.toggle-footer').slideUp('fast');
	}
	else
	{
		$('.footer-block h4').removeClass('active').off().parent().find('.toggle-footer').removeAttr('style').slideDown('fast');
		$('#footer').removeClass('accordion');
	}
}

function accordion(status)
{
	if(status == 'enable')
	{
		var accordion_selector = '#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4,' +
				'#left_column .shopping_cart > a:first-child, #right_column .shopping_cart > a:first-child';

		$(accordion_selector).on('click', function(e){
			$(this).toggleClass('active').parent().find('.block_content').stop().slideToggle('medium');
		});
		$('#right_column, #left_column').addClass('accordion').find('.block .block_content').slideUp('fast');
		if (typeof(ajaxCart) !== 'undefined')
			ajaxCart.collapse();
	}
	else
	{
		$('#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4').removeClass('active').off().parent().find('.block_content').removeAttr('style').slideDown('fast');
		$('#left_column, #right_column').removeClass('accordion');
	}
}

function bindUniform()
{
	if (!!$.prototype.uniform)
		$("select.form-control,input[type='radio'],input[type='checkbox']").not(".not_uniform").uniform();
}
/* ---------------------------------------------
 MENU REPONSIIVE
 --------------------------------------------- */
function init_menu_reposive(){
	var kt_is_mobile = (Modernizr.touch) ? true : false;
	if(kt_is_mobile === true){
		$(document).on('click', '.boutique-nav .menu-item-has-children > a', function(e){
			var licurrent = $(this).closest('li');
			var liItem = $('.boutique-nav .menu-item-has-children');
			if ( !licurrent.hasClass('show-submenu') ) {
				liItem.removeClass('show-submenu');
				licurrent.parents().each(function (){
					if($(this).hasClass('menu-item-has-children')){
						$(this).addClass('show-submenu');
					}
					if($(this).hasClass('main-menu')){
						return false;
					}
				})
				licurrent.addClass('show-submenu');
				// Close all child submenu if parent submenu is closed
				if ( !licurrent.hasClass('show-submenu') ) {
					licurrent.find('li').removeClass('show-submenu');
				}
				return false;
				e.preventDefault();
			}else{
				var href = $this.attr('href');
				if ( $.trim( href ) == '' || $.trim( href ) == '#' ) {
					licurrent.toggleClass('show-submenu');
				}
				else{
					window.location = href;
				}
			}
			// Close all child submenu if parent submenu is closed
			/*if ( !licurrent.hasClass('show-submenu') ) {
				//licurrent.find('li').removeClass('show-submenu');
			}*/
			e.stopPropagation();
		});
		$(document).on('click', function(e){
			var target = $( e.target );
			if ( !target.closest('.show-submenu').length || !target.closest('.boutique-nav').length ) {
				$('.show-submenu').removeClass('show-submenu');
			}
		});
		// On Desktop
	}else{
		$(document).on('mousemove','.boutique-nav .menu-item-has-children',function(){
			$(this).addClass('show-submenu');
		})
		$(document).on('mouseout','.boutique-nav .menu-item-has-children',function(){
			$(this).removeClass('show-submenu');
		})
	}
}
/* ---------------------------------------------
 Resize mega menu
 --------------------------------------------- */
function resizeTopmenu() {
	var screen_w = $(window).width() + scrollCompensate();
	if ( screen_w >= 767) {
		$(".megamenu").each(function (index) {
			//if (!$(this).closest('.main-menu').hasClass('vertical')) {
			var container_obj = $(this).closest('.main-menu-wapper');
			if (typeof(container_obj.offset()) == "undefined") {
				container_obj = $(this).closest('.container');
			}else{
				if (container_obj.children('.container').length >0)
					container_obj = container_obj.find('.container');
			}
			if (typeof(container_obj.offset()) == "undefined") {
				return;
			}
			var container_l = container_obj.offset().left,
					container_w = container_obj.outerWidth(),
					parent = $(this).parent(),
					parent_w = parent.outerWidth(),
					parent_l = parent.offset().left - container_l,
					parent_c = parent_l + (parent_w / 2),
					theWidth = $(this).outerWidth();
			$(this).css('max-width',container_w + "px");
			if (parent_c + theWidth / 2 > container_w) {
				//alert('111');
				var current_l = parseInt(parent_c + theWidth - container_w);
				if (current_l < parent_l)
					$(this).css("left", "-" + current_l + "px");
				else
					$(this).css("left", "-" + parseInt(parent_l) + "px");
			} else if (theWidth / 2 > parent_c) {
				//alert('222 VS '+parent_l);
				$(this).css("left", "-" + parseInt(parent_l) + "px");
			} else {
				//alert('333');
				var current_l = parseInt(theWidth / 2 - (parent_c - parent_l));
				$(this).css("left", "-" + current_l + "px");
			}
			//}
		});
	}
}
/* ---------------------------------------------
 OWL TAB EFFECT
 --------------------------------------------- */
function tab_owl_fade_effect(){
	// effect first tab
	var sleep = 0;
	$('.tab-owl-fade-effect .nav-tab>li.active a[data-toggle="tab"]').each(function(){
		var tabElement = $(this);
		setTimeout(function() {
			tabElement.trigger('click');
		}, sleep);
		sleep += 10000
	})
	// effect click
	$(document).on('click','.tab-owl-fade-effect a[data-toggle="tab"]',function(){
		var tab_id = $(this).attr('href');
		var tab_animated = $(this).data('animated');
		tab_animated = ( tab_animated == undefined || tab_animated =="" ) ? 'fadeInUp' : tab_animated;
		$(tab_id).find('.owl-item.active').each(function(i){
			var t = $(this);
			var style = $(this).attr("style");
			style     = ( style == undefined ) ? '' : style;
			var delay  = i * 400;
			t.attr("style", style +
				";-webkit-animation-delay:" + delay + "ms;"
				+ "-moz-animation-delay:" + delay + "ms;"
				+ "-o-animation-delay:" + delay + "ms;"
				+ "animation-delay:" + delay + "ms;"
			).addClass(tab_animated+' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				t.removeClass(tab_animated+' animated');
				t.attr("style", style);
			});
		})
	})
}
function tab_product_fade_effect(){
	// effect first tab
	var sleep = 0;
	$('.tab-product-fade-effect .nav-tab>li.active a[data-toggle="tab"]').each(function(){
		var tabElement = $(this);
		setTimeout(function() {
			tabElement.trigger('click');
		}, sleep);
		sleep += 10000
	})
	// effect click
	$(document).on('click','.tab-product-fade-effect a[data-toggle="tab"]',function(){
		var tab_id = $(this).attr('href');
		var tab_animated = $(this).data('animated');
		tab_animated = ( tab_animated == undefined || tab_animated =="" ) ? 'fadeInUp' : tab_animated;

		$(tab_id).find('.product-item').each(function(i){
			var t = $(this);
			var style = $(this).attr("style");
			style     = ( style == undefined ) ? '' : style;
			var delay  = i * 400;
			t.attr("style", style +
				";-webkit-animation-delay:" + delay + "ms;"
				+ "-moz-animation-delay:" + delay + "ms;"
				+ "-o-animation-delay:" + delay + "ms;"
				+ "animation-delay:" + delay + "ms;"
			).addClass(tab_animated+' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				t.removeClass(tab_animated+' animated');
				t.attr("style", style);
			});
		})
	})
}
$(window).bind("load", function() {
	clone_main_menu();
	//  Box mobile menu
	if($('#box-mobile-menu').length >0 ){
		$("#box-mobile-menu").mCustomScrollbar();
	}
	if($('.header-categoy-menu .inner').length >0 ){
	      $(".header-categoy-menu .inner").mCustomScrollbar();
	  }
	  positionFootersidebar();
		heightheader_categoy_menu();
	scrollbar_header_sidebar();
	init_carousel_mobile();
	resizeTopmenu();
});
function clone_main_menu(){
	if( $('.main-menu-wapper .clone-main-menu').length > 0 && $('#box-mobile-menu').length >0 && $('#box-mobile-menu .clone-main-menu').length <1){
		$( "#header >div:not(.sticky-wrapper) .main-menu-wapper .clone-main-menu" ).clone().appendTo( "#box-mobile-menu .box-inner" );
	}
}
function init_carousel_mobile(){

	$('.owl-carousel-mobile').each(function(){
		var owl = $(this);
		if( $(window).width()+scrollCompensate() < 768 ){
			//owl-carousel owl-theme owl-loaded
			if (!$(this).hasClass('owl-loaded')){
				var config = $(this).data();
				var animateOut = $(this).data('animateout');
				var animateIn = $(this).data('animatein');
				if(typeof animateOut != 'undefined' ){
					config.animateOut = animateOut;
				}
				if(typeof animateIn != 'undefined' ){
					config.animateIn = animateIn;
				}
				owl.owlCarousel(config);
			}
		}else {
			if(owl.hasClass('owl-loaded')) {
				owl.trigger('destroy.owl.carousel').removeClass('owl-carousel owl-loaded');
				owl.find('.owl-stage-outer').children().unwrap();
			}

		}
	});
}
function scrollbar_header_sidebar(){
	//  Scrollbar
	if($('.sidebar-menu').length >0 ){
		$(".sidebar-menu").mCustomScrollbar();
	}
	if($('.header-categoy-menu .inner').length >0 ){
		$(".header-categoy-menu .inner").mCustomScrollbar();
	}
}
function positionFootersidebar(){
	if ($('.header.sidebar').length > 0){
		var height2 = $('.header.sidebar').outerHeight(),
			height1 = (height2 - 45);
		$('.header.sidebar .sidebar-menu').css('height',height1+'px');
	}
}
function heightheader_categoy_menu(){
    var height2 = $('.header-categoy-menu').outerHeight(),
        height1 = (height2 -140);
    $('.header-categoy-menu .inner').css('height',height1+'px');
}