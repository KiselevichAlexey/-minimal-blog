<?php
/**
 * @global $APPLICATION ;
 */
if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}
?>
<div class="col-md-12 col-lg-4 sidebar">
    <div class="sidebar-box search-form-wrap">
        <form action="#" class="search-form">
            <div class="form-group">
                <span class="icon fa fa-search"></span>
                <input type="text" class="form-control" id="s" placeholder="Type a keyword and hit enter">
            </div>
        </form>
    </div>
    <!-- END sidebar-box -->
    <div class="sidebar-box">
        <div class="bio text-center">
            <img src="<?= MARKUP_PATH ?>images/person_1.jpg" alt="Image Placeholder" class="img-fluid">
            <div class="bio-body">
                <h2>Meagan Smith</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt
                    repellendus
                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>
                <p><a href="/about" class="btn btn-primary btn-sm">Read my bio</a></p>
                <?php $APPLICATION->IncludeComponent(
                    "project:social",
                    "sidebar",
                    [
                        "CACHE_TIME" => "3600",
                        "CACHE_TYPE" => "A",
                        "COMPONENT_TEMPLATE" => "sidebar",
                    ],
                    false
                ); ?>
            </div>
        </div>
    </div>
    <!-- END sidebar-box -->
    <div class="sidebar-box">
        <h3 class="heading">Popular Posts</h3>
        <div class="post-entry-sidebar">
            <ul>
                <li>
                    <a href="">
                        <img src="images/img_2.jpg" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
                            <div class="post-meta">
                                <span class="mr-2">March 15, 2018 </span> •
                                <span class="ml-2"><span class="fa fa-comments"></span> 3</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="images/img_4.jpg" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
                            <div class="post-meta">
                                <span class="mr-2">March 15, 2018 </span> •
                                <span class="ml-2"><span class="fa fa-comments"></span> 3</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="images/img_12.jpg" alt="Image placeholder" class="mr-4">
                        <div class="text">
                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
                            <div class="post-meta">
                                <span class="mr-2">March 15, 2018 </span> •
                                <span class="ml-2"><span class="fa fa-comments"></span> 3</span>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- END sidebar-box -->

    <?php
    $APPLICATION->IncludeComponent(
        "project:blog.section.list",
        "sidebar.list",
        [
            "COMPONENT_TEMPLATE" => "sidebar.list",
            "IBLOCK_TYPE" => "blog",
            "IBLOCK_CODE" => "Posts",
            "COUNT" => "5",
            "SORT_FIELD1" => "SHOW_COUNTER",
            "SORT_DIRECTION1" => "DESC",
            "SORT_FIELD2" => "SORT",
            "SORT_DIRECTION2" => "DESC",
            "CACHE_TYPE" => "A",
            "CACHE_TIME" => "3600",
        ],
        false
    ); ?>
    <!-- END sidebar-box -->

</div>
</div>
</section>
<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<?= date('Y') ?>
                All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a
                    href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
    </div>
</footer>
<div id="loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#f4b214"/>
    </svg>
</div>
</body>
</html>