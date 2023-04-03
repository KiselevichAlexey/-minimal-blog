<?php

use App\Helpers\Misc;
use WheatleyWL\BXIBlockHelpers\IBlockHelper;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('system:standard.elements.list');

class BlogSectionListComponent extends StandardElementListComponent
{
    /**
     * @param array $element
     * @return array
     */
    protected function getItems(array $element): array
    {
        return [
            'NAME' => $element['NAME'],
            'URL' => $element['SECTION_PAGE_URL'],
            'CNT' => $element['ELEMENT_CNT'],
        ];
    }

    /**
     * @return int|CIBlockResult
     */
    protected function getIterator(): int|CIBlockResult
    {
        return CIBlockSection::GetList(
            $this->getOrder(),
            $this->getFilter(),
            true,
            $this->getSelect(),
            $this->navParams,
        );
    }

    /**
     * @return array
     */
    protected function getFilter(): array
    {
        return [...parent::getFilter(), ...['CNT_ACTIVE' => 'Y']];
    }

    /**
     * @return string[]
     */
    protected
    function getSelect(): array
    {
        return ["NAME", "ELEMENT_CNT", "SECTION_PAGE_URL",];
    }
}