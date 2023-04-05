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

?>

<?php $res = $APPLICATION->IncludeComponent(
    "project:blog.element.list",
    "horizontal.list",
    [
        "CACHE_TIME" => $arParams["CACHE_TIME"],
        "CACHE_TYPE" => $arParams["CACHE_TYPE"],
        "COMPONENT_TEMPLATE" => "mainpage",
        "COUNT" => $arParams["COUNT"],
        "IBLOCK_CODE" => $arParams["IBLOCK_CODE"],
        "IBLOCK_TYPE" => $arParams["IBLOCK_TYPE"],
        "SECTION_CODE" => $arResult["VARIABLES"]["SECTION_CODE"],
        "SHOW_NAV" => $arParams["SHOW_NAV"],
        "SORT_DIRECTION1" => $arParams["SORT_DIRECTION1"],
        "SORT_DIRECTION2" => $arParams["SORT_DIRECTION2"],
        "SORT_FIELD1" => $arParams["SORT_FIELD2"],
        "SORT_FIELD2" => $arParams["SORT_FIELD1"],
        "PAGER_TEMPLATE" => "project.main",
    ], $component
); ?>
<?php $APPLICATION->SetTitle(Loc::getMessage('CATEGORY') . $res['TITLE']); ?>
