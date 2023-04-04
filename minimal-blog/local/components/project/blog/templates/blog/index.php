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
    ], $component
); ?>

