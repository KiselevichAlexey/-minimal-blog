<?php
/**
 * @global $APPLICATION ;
 */
if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}
?>
</div>
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

    <?php $APPLICATION->IncludeComponent(
        "bitrix:main.include",
        ".default",
        [
            "AREA_FILE_SHOW" => "file",
            "AREA_FILE_SUFFIX" => "inc",
            "EDIT_TEMPLATE" => "",
            "COMPONENT_TEMPLATE" => ".default",
            "PATH" => "/local/include_areas/template/bio.php",
        ],
        false,
    ); ?>


    <?php
    $APPLICATION->IncludeComponent(
        "project:blog.element.list",
        "popular.posts",
        [
            "COMPONENT_TEMPLATE" => "popular.posts",
            "IBLOCK_TYPE" => "blog",
            "IBLOCK_CODE" => "Posts",
            "COUNT" => "3",
            "SORT_FIELD1" => "SHOW_COUNTER",
            "SORT_DIRECTION1" => "DESC",
            "SORT_FIELD2" => "SORT",
            "SORT_DIRECTION2" => "DESC",
            "CACHE_TYPE" => "A",
            "CACHE_TIME" => "3600",
            "SECTION_CODE" => "",
            "SHOW_NAV" => "N",
        ],
        false
    ); ?>

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

</div>
</div>
</section>
<?php $APPLICATION->ShowViewContent('blog_detail'); ?>
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