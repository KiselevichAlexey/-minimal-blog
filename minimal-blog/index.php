<?php
require($_SERVER['DOCUMENT_ROOT'] . '/bitrix/header.php');
/** @global $APPLICATION */
?>
<?php $res = $APPLICATION->IncludeComponent(
	"project:blog.element.list", 
	"mainpage", 
	array(
		"CACHE_TIME" => "3600",
		"CACHE_TYPE" => "A",
		"COMPONENT_TEMPLATE" => "mainpage",
		"COUNT" => "6",
		"IBLOCK_CODE" => "Posts",
		"IBLOCK_TYPE" => "blog",
		"SECTION_CODE" => "lifestyle",
		"SHOW_NAV" => "Y",
		"SORT_DIRECTION1" => "ASC",
		"SORT_DIRECTION2" => "ASC",
		"SORT_FIELD1" => "ACTIVE_FROM",
		"SORT_FIELD2" => "SORT",
		"PAGER_TEMPLATE" => "project.main",
		"DISPLAY_TOP_PAGER" => "N",
		"DISPLAY_BOTTOM_PAGER" => "N",
		"PAGER_TITLE" => "Навигация",
		"PAGER_SHOW_ALWAYS" => "N",
		"PAGER_DESC_NUMBERING" => "N",
		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000"
	),
	false
); ?>
<?php
$APPLICATION->SetTitle($res['TITLE']);
require($_SERVER['DOCUMENT_ROOT'] . '/bitrix/footer.php');
?>