<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);

$arComponentDescription = [
    "NAME" => Loc::getMessage('BLOG_DESCRIPTION_NAME'),
    "DESCRIPTION" => Loc::getMessage('BLOG_DESCRIPTION_DESCRIPTION'),
    "ICON" => '/images/icon.gif',
    "SORT" => 1,
    "PATH" => [
        "ID" => 'project',
        "NAME" => Loc::getMessage('BLOG_DESCRIPTION_GROUP'),
        "SORT" => 10,
        "CHILD" => [
            "ID" => 'blog',
            "NAME" => Loc::getMessage('BLOG_DESCRIPTION_DIR'),
            "SORT" => 10,
        ],
    ],
];
