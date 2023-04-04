<?php
/**
 * @var $aMenuLinks
 */


use WheatleyWL\BXIBlockHelpers\IBlockHelper;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

global $APPLICATION;


$aMenuLinksExt = $APPLICATION->IncludeComponent(
    "bitrix:menu.sections",
    "",
    [
        "ID" => $_REQUEST["ELEMENT_ID"],
        "IBLOCK_TYPE" => B_BLOG_TYPE,
        "IBLOCK_ID" => IBlockHelper::getIBlockIdByCode(IB_POSTS_CODE),
        "SECTION_URL" => "/categories/#SECTION_CODE#/",
        "CACHE_TYPE" => "A",
        "CACHE_TIME" => "3600",
    ]
);


$aMenuLinks = [...$aMenuLinks, ...$aMenuLinksExt];
?>
