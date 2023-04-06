<?php

use App\Helpers\Misc;
use WheatleyWL\BXIBlockHelpers\Exceptions\IBlockHelperException;
use WheatleyWL\BXIBlockHelpers\IBlockHelper;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('project:blog.element.list');

class BlogRelatedListComponent extends BlogElementListComponent
{
    public function onPrepareComponentParams($arParams): array
    {

        $result = parent::onPrepareComponentParams($arParams);
        if (isset($arParams['RELATED_POST'])) {
            $result['RELATED_POST'] = $arParams['RELATED_POST'];
        } else {
            $result['SECTION_CODE'] = $arParams['SECTION_CODE'];
        }
        return $result;
    }

    protected function getFilter(): array
    {
        $result = [
            'IBLOCK_TYPE' => $this->arParams['IBLOCK_TYPE'],
            'IBLOCK_ID' => $this->arParams['IBLOCK_ID'],
            'ACTIVE' => 'Y',
        ];
        if ($this->arParams['RELATED_POST']) {
            $result['ID'] = $this->arParams['RELATED_POST'];
        } else {
            $result['SECTION_CODE'] = $this->arParams['SECTION_CODE'];
        }

        return $result;
    }

}