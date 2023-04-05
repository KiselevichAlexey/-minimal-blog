<?php

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}
/**
 * @global $APPLICATION
 * @var array $arParams
 * @var array $arResult
 * @var \BlogComponent $component
 */
?>
<?php $APPLICATION->IncludeComponent(
    "project:blog.detail",
    "",
    [
        'IBLOCK_TYPE' => $arParams['IBLOCK_TYPE'],
        'IBLOCK_CODE' => $arParams['IBLOCK_CODE'],
        'CACHE_TYPE' => $arParams['CACHE_TYPE'],
        'CACHE_TIME' => $arParams['CACHE_TIME'],
        'SECTION_CODE' => $arResult['VARIABLES']['SECTION_CODE'],
        'ELEMENT_CODE' => $arResult['VARIABLES']['ELEMENT_CODE'],
    ],
    $component
);