    <!-- MODULE Block ovictestimonial -->
    <div class="head">
        <h3 class="title">{$TESTIMONIAL_TITLE}</h3>
        <span class="sub-title">{$TESTIMONIAL_SUBTITLE}</span>
    </div>
    <div class="row">
        <div class="col-lg-offset-2 col-sm-12 col-lg-8">
            <div class="testimonials style2 owl-carousel nav-style2 nav-center-center" data-autoplay="true" data-items="1" data-nav="true" data-dots="false">
                {foreach from=$testimonials item=info}
                    <div class="testimonial">
                        <div class="avatar">
                            <img src="{$module_dir}img/{$info.file_name}" alt="{$info.name|escape:html:'UTF-8'}">
                        </div>
                        <div class="inner">
                            <p class="text-in">{$info.text}</p>
                            <h6>{$info.name}</h6>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
    {*{$info.company}*}
<!-- /MODULE Block ovictestimonial -->