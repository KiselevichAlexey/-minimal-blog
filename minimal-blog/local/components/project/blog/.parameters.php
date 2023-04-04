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
        throw new Main\LoaderException(Loc::getMessage('BLOG_PARAMETERS_IBLOCK_MODULE_NOT_INSTALLED'));
    }

    $iblockTypes = CIBlockParameters::GetIBlockTypes(["-" => " "]);
    $iblocks = ParametersComponent::getIblocks($arCurrentValues['IBLOCK_TYPE']);

    $arComponentParameters = [
        'PARAMETERS' => [
            'SEF_MODE' => [
                'index' => [
                    'NAME' => Loc::getMessage('BLOG_PARAMETERS_INDEX_PAGE'),
                    'DEFAULT' => 'index.php',
                    'VARIABLES' => [],
                ],
                'section' => [
                    "NAME" => Loc::getMessage('BLOG_PARAMETERS_SECTION_PAGE'),
                    "DEFAULT" => '#SECTION_CODE#/',
                    "VARIABLES" => ['SECTION_CODE'],
                ],
                'detail' => [
                    "NAME" => Loc::getMessage('BLOG_PARAMETERS_DETAIL_PAGE'),
                    "DEFAULT" => '#ELEMENT_CODE#/',
                    "VARIABLES" => ['ELEMENT_CODE'],
                ],
            ],
            'CACHE_TIME' => [
                'DEFAULT' => 3600,
            ],
        ],
    ];

    ParametersComponent::insertIblockTypeInParameters($arComponentParameters, $iblockTypes);
    ParametersComponent::insertIblockCodeInParameters($arComponentParameters, $iblocks['CODES']);
    ParametersComponent::insertSortInParameters($arComponentParameters);
    ParametersComponent::insertAjaxSettingsInParameters($arComponentParameters);
    ParametersComponent::insertCountInParameters($arComponentParameters);
    ParametersComponent::insertShowNavInParameters($arComponentParameters);

} catch (Main\LoaderException $e) {
    ShowError($e->getMessage());
}
