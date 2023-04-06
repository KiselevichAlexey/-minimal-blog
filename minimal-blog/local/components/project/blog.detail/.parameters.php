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
        throw new Main\LoaderException(Loc::getMessage('BLOG_DETAIL_PARAMETERS_IBLOCK_MODULE_NOT_INSTALLED'));
    }

    $iblockTypes = CIBlockParameters::GetIBlockTypes(["-" => " "]);
    $iblocks = ParametersComponent::getIblocks($arCurrentValues['IBLOCK_TYPE']);

    $arComponentParameters = [
        'GROUPS' => [
        ],
        'PARAMETERS' => [
            'ELEMENT_CODE' => [
                'PARENT' => 'DATA_SOURCE',
                'NAME' => Loc::getMessage('BLOG_DETAIL_PARAMETERS_ELEMENT_CODE'),
                'TYPE' => 'STRING',
            ],
            'CACHE_TIME' => [
                'DEFAULT' => 3600,
            ],
        ],
    ];

    ParametersComponent::insertIblockTypeInParameters($arComponentParameters, $iblockTypes);
    ParametersComponent::insertIblockCodeInParameters($arComponentParameters, $iblocks['CODES']);

} catch (Main\LoaderException $e) {
    ShowError($e->getMessage());
}
