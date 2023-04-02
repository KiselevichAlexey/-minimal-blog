<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);

$arComponentDescription = [
    "NAME" => Loc::getMessage('SOCIAL_NETWORK_DESCRIPTION_NAME'),
    "DESCRIPTION" => Loc::getMessage('SOCIAL_NETWORK_DESCRIPTION_DESCRIPTION'),
    "ICON" => '/images/icon.gif',
    "SORT" => 10,
    "PATH" => [
        "ID" => 'project',
        "NAME" => Loc::getMessage('SOCIAL_NETWORK_DESCRIPTION_GROUP'),
        "SORT" => 10,
        "CHILD" => [
            "ID" => 'common',
            "NAME" => Loc::getMessage('SOCIAL_NETWORK_DESCRIPTION_DIR'),
            "SORT" => 10,
        ],
    ],
];
