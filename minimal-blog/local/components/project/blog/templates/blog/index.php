<?php use Bitrix\Main\Localization\Loc;

if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
/**
 * @global $APPLICATION
 * @var array $arParams
 * @var array $arResult
 * @var \BlogComponent $component
 */
Loc::loadMessages(__FILE__);
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
        "SHOW_NAV" => "Y",
        "SORT_DIRECTION1" => "ASC",
        "SORT_DIRECTION2" => "ASC",
        "SORT_FIELD1" => "ACTIVE_FROM",
        "SORT_FIELD2" => "SORT",
        "PAGER_TEMPLATE" => "project.main",
        "DISPLAY_TOP_PAGER" => "N",
        "DISPLAY_BOTTOM_PAGER" => "N",
        "PAGER_TITLE" => "Навигация",
        "PAGER_SHOW_ALWAYS" => "Y",
        "PAGER_DESC_NUMBERING" => "N",
        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
    ], $component
); ?>

