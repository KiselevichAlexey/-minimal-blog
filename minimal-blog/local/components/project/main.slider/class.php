<?php

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('project:blog.element.list');

class MainSliderComponent extends BlogElementListComponent
{

    /**
     * @throws \WheatleyWL\BXIBlockHelpers\Exceptions\IBlockHelperException
     */
    protected function getFilter(): array
    {
        return [
            'IBLOCK_TYPE' => $this->arParams['IBLOCK_TYPE'],
            'IBLOCK_ID' => $this->arParams['IBLOCK_ID'],
            'PROPERTY_VIEW_MAINPAGE_SLIDER' => true,
            'ACTIVE' => 'Y',
        ];
    }

    protected function getItems(array $element): array
    {
        return [...parent::getItems($element), ...['TEXT' => $element['PREVIEW_TEXT']]];
    }

    protected function getSelect(): array
    {
        return [...parent::getSelect(), 'PREVIEW_TEXT'];
    }
}