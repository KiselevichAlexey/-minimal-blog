<?php
require($_SERVER['DOCUMENT_ROOT'] . '/bitrix/header.php');
/** @global $APPLICATION */
?>
<?php $res = $APPLICATION->IncludeComponent(
    "project:blog.element.list",
    "mainpage",
    [
        "CACHE_TIME" => "3600",
        "CACHE_TYPE" => "A",
        "COMPONENT_TEMPLATE" => "mainpage",
        "COUNT" => "5",
        "IBLOCK_CODE" => "Posts",
        "IBLOCK_TYPE" => "blog",
        "SECTION_CODE" => "lifestyle",
        "SHOW_NAV" => "Y",
        "SORT_DIRECTION1" => "ASC",
        "SORT_DIRECTION2" => "ASC",
        "SORT_FIELD1" => "ACTIVE_FROM",
        "SORT_FIELD2" => "SORT",
    ]
); ?>
<?php
$APPLICATION->SetTitle($res['TITLE']);
require($_SERVER['DOCUMENT_ROOT'] . '/bitrix/footer.php');
?>