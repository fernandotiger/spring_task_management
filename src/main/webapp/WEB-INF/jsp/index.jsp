
<%@ include file="header.jsp" %>
    <!--Slider-->
    <section id="slide-show">
        <div id="slider" class="sl-slider-wrapper">
            <!--Slider Items-->    
            <div class="sl-slider">
                <!--Slider Item1-->
                <div class="sl-slide item1" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                    <div class="sl-slide-inner">
                        <div class="container">
                            <img class="pull-right" src="images/sample/slider/img1.png" alt="" />
                            <h2>BB Neque porro quisquam est qui dolorem</h2>
                            <h3 class="gap">Praesent consectetur est diam</h3>
                            
                        </div>
                    </div>
                </div>
                <!--/Slider Item1-->
                <!--Slider Item2-->
                <div class="sl-slide item2" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                    <div class="sl-slide-inner">
                        <div class="container">
                            <img class="pull-right" src="images/sample/slider/img2.png" alt="" />
                            <h2>Aliquam tincidunt ornare placerat</h2>
                            <h3 class="gap">Aenean tincidunt posuere orci</h3>
                            
                        </div>
                    </div>
                </div>
                <!--Slider Item2-->
                <!--Slider Item3-->
                <div class="sl-slide item3" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                    <div class="sl-slide-inner">
                        <div class="container">
                            <img class="pull-right" src="images/sample/slider/img3.png" alt="" />
                            <h2>Pellentesque eu libero diam, etiam bibendum</h2>
                            <h3 class="gap">Mauris feugiat est vitae malesuada pharetra</h3>
                            
                        </div>
                    </div>
                </div>
                <!--Slider Item3-->
            </div>
            <!--/Slider Items-->
            <!--Slider Next Prev button-->
            <nav id="nav-arrows" class="nav-arrows">
                <span class="nav-arrow-prev"><i class="icon-angle-left"></i></span>
                <span class="nav-arrow-next"><i class="icon-angle-right"></i></span> 
            </nav>
            <!--/Slider Next Prev button-->
        </div>
        <!-- /slider-wrapper -->           
    </section>
    <!--/Slider-->


 <%@ include file="footer.jsp" %>

    <script src="js/vendor/jquery-1.9.1.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/jquery.ba-cond.min.js"></script>
    <script src="js/jquery.slitslider.js"></script>
    <!-- Slider -->
    <script type="text/javascript"> 
    $(function() {
        var Page = (function() {
            var $navArrows = $( '#nav-arrows' ),
            slitslider = $( '#slider' ).slitslider( {
                autoplay : true
            } ),
            init = function() {
                initEvents();
            },
            initEvents = function() {
                $navArrows.children( ':last' ).on( 'click', function() {
                    slitslider.next();
                    return false;
                });
                $navArrows.children( ':first' ).on( 'click', function() {
                    slitslider.previous();
                    return false;
                });
            };
            return { init : init };
        })();
        Page.init();
    });
    </script>
    <!-- /Slider -->
</body>
</html>
<!--
Template bootstrap https://bootswatch.com
Template bootstrap https://www.free-css.com/free-css-templates/page238/hr1 
JSTL https://www.tutorialspoint.com/jsp/jstl_core_url_tag.htm
-->
