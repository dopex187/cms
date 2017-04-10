function ScrollerChangeFirst()
{
    NewsController.scroller.append(NewsController.scrollItems.eq(0).remove()).css('margin-left', 0);
    NewsController.scrollTicker();
}

var NewsController = 
{
    scrollSpeed: 5,
    scrollerWidth: 0,
    scroller: undefined,
    scrollItems: undefined,
    scrollMargin: 0,
    
    /**
     * Inits scroller and sets onclick events
     */
    init: function()
    {
        this.initScroller();
        
        jQuery("#news_slider > li").click(function() {
            console.log("Object: "+ JSON.stringify(jQuery(this).attr("id")));
        });
        
        $('.news_content').slimscroll({
            height: '200px'
        })
    },
    
    /**
     * Inits scroller
     */
    initScroller: function()
    {
        this.scroller = jQuery('#news_slider');

        this.scroller.children().each(function() {
            NewsController.scrollerWidth += jQuery(this).outerWidth(true);
        });
        this.scrollerWidth = this.scroller.outerWidth();

        this.scrollTicker();

        this.scroller.mouseover(function() {
            NewsController.scroller.stop();
        });
        this.scroller.mouseout(function() {
            NewsController.scrollMargin = parseInt(NewsController.scroller.css('margin-left').replace(/px/, ''));
            NewsController.scrollTicker();
        });
    },
    
    /**
     * Scrolls news
     */
    scrollTicker: function()
    {
        this.scrollItems  = this.scroller.children();
        var scrollWidth   = this.scrollItems.eq(0).outerWidth(true);
        var scrollMargin  = this.scrollMargin;
        this.scrollMargin = 0;

        this.scroller.animate({
                'margin-left': (scrollWidth * -1) + scrollMargin
            },
            scrollWidth * 100 / this.scrollSpeed,
            'linear',
            ScrollerChangeFirst
        );
    },
    
    /**
     * Prompts a certain new
     * 
     * @param int id News ID
     */
    promptNews: function(id)
    {
        jQuery.ajax({
            url: "/Ajax/Internal",
            method: "POST",
            data: {
                action: "getNews",
                params: [id]
            },
            
            success: function(data)
            {
                swal({
                    title: data.title,
                    text:  '<div class="scroll_content">'+ data.text +'</div>',
                    html:  true
                });
                
                $(".scroll_content").slimscroll({
                    height: "200px"
                });
            }
        });
    }
}