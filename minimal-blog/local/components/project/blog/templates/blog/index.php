<?php use Bitrix\Main\Localization\Loc;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}
/**
 * @global $APPLICATION
 * @var array $arParams
 * @var array $arResult
 * @var \BlogComponent $component
 */
Loc::loadMessages(__FILE__);
?><?php $APPLICATION->IncludeComponent(
    "project:blog.element.list",
    "horizontal.list",
    [
        "CACHE_TIME" => $arParams['CACHE_TIME'],
        "CACHE_TYPE" => $arParams['CACHE_TYPE'],
        "COMPONENT_TEMPLATE" => "horizontal.list",
        "COUNT" => $arParams['COUNT'],
        "IBLOCK_CODE" => $arParams['IBLOCK_CODE'],
        "IBLOCK_TYPE" => $arParams['IBLOCK_TYPE'],
        "SHOW_NAV" => $arParams['SHOW_NAV'],
        "SORT_DIRECTION1" => $arParams['SORT_DIRECTION1'],
        "SORT_DIRECTION2" => $arParams['SORT_DIRECTION2'],
        "SORT_FIELD1" => $arParams['SORT_FIELD1'],
        "SORT_FIELD2" => $arParams['SORT_FIELD2'],
        "PAGER_TEMPLATE" => "project.main",
        "PAGER_TITLE" => "Навигация",
        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
    ], $component
); ?>

