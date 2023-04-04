<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

use App\Helpers\ParametersComponent;
use Bitrix\Main;
use Bitrix\Main\Localization\Loc as Loc;

/** @var array $arCurrentValues */

Loc::loadMessages(__FILE__);

try {
    if (!Main\Loader::includeModule('iblock')) {
        throw new Main\LoaderException(Loc::getMessage('BLOG_LIST_PARAMETERS_IBLOCK_MODULE_NOT_INSTALLED'));
    }

    $iblockTypes = CIBlockParameters::GetIBlockTypes(["-" => " "]);
    $iblocks = ParametersComponent::getIblocks($arCurrentValues['IBLOCK_TYPE']);

    $arComponentParameters = [
        'GROUPS' => [
        ],
        'PARAMETERS' => [
            'CACHE_TIME' => [
                'DEFAULT' => 3600,
            ],
        ],
    ];

    ParametersComponent::insertIblockTypeInParameters($arComponentParameters, $iblockTypes);
    ParametersComponent::insertIblockCodeInParameters($arComponentParameters, $iblocks['CODES']);
    ParametersComponent::insertCountInParameters($arComponentParameters);
    ParametersComponent::insertSortInParameters($arComponentParameters);

} catch (Main\LoaderException $e) {
    ShowError($e->getMessage());
}
