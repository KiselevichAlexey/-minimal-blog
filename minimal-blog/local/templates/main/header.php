<?php

use Bitrix\Main\Page\Asset;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/**
 * @global $APPLICATION
 */

$asset = Asset::getInstance();
$asset->addString("<link href='https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700' rel='stylesheet'>");
$asset->addCss(MARKUP_PATH . "css/bootstrap.css");
$asset->addCss(MARKUP_PATH . "css/animate.css");
$asset->addCss(MARKUP_PATH . "css/owl.carousel.min.css");
$asset->addCss(MARKUP_PATH . "fonts/fontawesome/css/font-awesome.min.css");
$asset->addCss(MARKUP_PATH . "fonts/flaticon/font/flaticon.css");
$asset->addCss(MARKUP_PATH . "css/style.css");

$asset->addJs(MARKUP_PATH . "js/jquery-3.2.1.min.js");
$asset->addJs(MARKUP_PATH . "js/jquery-migrate-3.0.0.js");
$asset->addJs(MARKUP_PATH . "js/popper.min.js");
$asset->addJs(MARKUP_PATH . "js/bootstrap.min.js");
$asset->addJs(MARKUP_PATH . "js/owl.carousel.min.js");
$asset->addJs(MARKUP_PATH . "js/jquery.waypoints.min.js");
$asset->addJs(MARKUP_PATH . "js/jquery.stellar.min.js");
$asset->addJs(MARKUP_PATH . "js/main.js");
?>

<!doctype html>
<html lang="<?= LANGUAGE_ID ?>">
<head>
    <title><?php $APPLICATION->ShowTitle(); ?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php $APPLICATION->ShowHead(); ?>
</head>
<?php $APPLICATION->ShowPanel(); ?>

<body>

<header role="banner">
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <?php $APPLICATION->IncludeComponent(
                    "project:social",
                    "header",
                    [
                        "CACHE_TIME" => "3600",
                        "CACHE_TYPE" => "A",
                    ]
                ); ?>
                <div class="col-3 search-top">
                    <!-- <a href="#"><span class="fa fa-search"></span></a> -->
                    <form action="#" class="search-top-form">
                        <span class="icon fa fa-search"></span>
                        <input type="text" id="s" placeholder="Type keyword to search...">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container logo-wrap">
        <div class="row pt-5">
            <div class="col-12 text-center">
                <a class="absolute-toggle d-block d-md-none" data-toggle="collapse" href="#navbarMenu" role="button"
                   aria-expanded="false" aria-controls="navbarMenu"><span class="burger-lines"></span></a>
                <h1 class="site-logo"><a href="/">
                        <?php $APPLICATION->IncludeComponent(
                            "bitrix:main.include",
                            ".default",
                            [
                                "AREA_FILE_SHOW" => "file",
                                "AREA_FILE_SUFFIX" => "inc",
                                "EDIT_TEMPLATE" => "",
                                "COMPONENT_TEMPLATE" => ".default",
                                "PATH" => "/local/include_areas/template/title.php",
                            ],
                            false,
                        ); ?></a></h1>
            </div>
        </div>
    </div>
    <?php
    $APPLICATION->IncludeComponent(
        "bitrix:menu",
        "header_top",
        [
            "ALLOW_MULTI_SELECT" => "N",
            "CHILD_MENU_TYPE" => "left",
            "DELAY" => "N",
            "MAX_LEVEL" => "2",
            "MENU_CACHE_GET_VARS" => [
            ],
            "MENU_CACHE_TIME" => "3600",
            "MENU_CACHE_TYPE" => "A",
            "MENU_CACHE_USE_GROUPS" => "Y",
            "ROOT_MENU_TYPE" => "top",
            "USE_EXT" => "Y",
            "COMPONENT_TEMPLATE" => "header_top",
        ],
        false
    ); ?>
</header>
<?php if ($APPLICATION->GetCurPage() === '/'): ?>
<?php
$APPLICATION->IncludeComponent(
    "project:main.slider",
    "mainpage",
    [
        "COMPONENT_TEMPLATE" => "mainpage",
        "IBLOCK_TYPE" => "blog",
        "IBLOCK_CODE" => "Posts",
        "COUNT" => "8",
        "SORT_FIELD1" => "SORT",
        "SORT_DIRECTION1" => "ASC",
        "SORT_FIELD2" => "SHOW_COUNTER",
        "SORT_DIRECTION2" => "ASC",
        "CACHE_TYPE" => "A",
        "CACHE_TIME" => "3600",
    ],
    false
); ?>
<section class="site-section py-sm">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="mb-4"><?php $APPLICATION->ShowTitle(false) ?></h2>
            </div>
        </div>
        <?php else: ?>
        <section class="site-section">
            <div class="container">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <h1><?php $APPLICATION->ShowTitle(false) ?></h1>
                    </div>
                </div>
                <?php endif; ?>
                <div class="row blog-entries">
                    <div class="col-md-12 col-lg-8 main-content">
						