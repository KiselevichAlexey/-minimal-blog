<?php
require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php");

/**
 * @global $APPLICATION
 */
$APPLICATION->SetTitle("My Blog");
?>
<?php $APPLICATION->IncludeComponent(
	"project:blog", 
	"blog", 
	array(
		"COMPONENT_TEMPLATE" => "blog",
		"IBLOCK_TYPE" => "blog",
		"IBLOCK_CODE" => "Posts",
		"SORT_FIELD1" => "ACTIVE_FROM",
		"SORT_DIRECTION1" => "DESC",
		"SORT_FIELD2" => "SORT",
		"SORT_DIRECTION2" => "ASC",
		"COUNT" => "10",
		"SHOW_NAV" => "Y",
		"SEF_MODE" => "Y",
		"SEF_FOLDER" => "/categories/",
		"AJAX" => "Y",
		"AJAX_KEY" => "AJAX",
		"CACHE_TYPE" => "A",
		"CACHE_TIME" => "3600",
		"SEF_URL_TEMPLATES" => array(
			"index" => "index.php",
			"section" => "#SECTION_CODE#/",
			"detail" => "#SECTION_CODE#/#ELEMENT_CODE#/",
		)
	),
	false
); ?>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>