<?php

use App\Helpers\Misc;
use WheatleyWL\BXIBlockHelpers\Exceptions\IBlockHelperException;
use WheatleyWL\BXIBlockHelpers\IBlockHelper;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('system:standard.elements.list');

class BlogElementListComponent extends StandardElementListComponent
{

    protected array $sectionList = [];
    /**
     * @throws IBlockHelperException
     */
    protected function getResult(): void
    {
        $this->sectionList = $this->getSectionName();
        if ($this->arParams['SECTION_CODE']) {
            $sectionId = IBlockHelper::getSectionIdByCode($this->arParams['SECTION_CODE'],
                $this->arParams['IBLOCK_ID']);
            $this->arResult['SECTION_NAME'] = $this->sectionList[$sectionId];
        }

        parent::getResult();
        $this->setResultCacheKeys([
                'SECTION_NAME',
            ]
        );
    }

    /**
     * @return array
     */
    protected function getSectionName(): array
    {
        $arFilterSection = [
            'ACTIVE' => 'Y',
            '>ELEMENT_CNT' => 0,
        ];

        if (!empty($this->arParams['IBLOCK_TYPE'])) {
            $arFilterSection['IBLOCK_TYPE'] = $this->arParams['IBLOCK_TYPE'];
        }
        if (!empty($this->arParams['IBLOCK_CODE'])) {
            $arFilterSection['IBLOCK_CODE'] = $this->arParams['IBLOCK_CODE'];
        }
        if (!empty($this->arParams['SECTION_CODE'])) {
            $arFilterSection['CODE'] = $this->arParams['SECTION_CODE'];
        }

        $sections = [];

        $rsSections = CIBlockSection::GetList([], $arFilterSection, true, ['NAME', 'ID']);
        while ($arSection = $rsSections->GetNext()) {
            $sections[$arSection['ID']] = $arSection['NAME'];
        }

        return $sections;
    }

    /**
     * @param array $element
     * @return array
     */
    protected function getItems(array $element): array
    {
        return [
            'NAME' => $element['NAME'],
            'DATE' => Misc::changeDateFromFormat($element['ACTIVE_FROM']),
            'URL' => $element['DETAIL_PAGE_URL'],
            'PICTURE' => CFile::GetPath($element['PREVIEW_PICTURE']),
            'SECTION' => $this->sectionList[$element['IBLOCK_SECTION_ID']],
            'VIEWS' => $element['SHOW_COUNTER'] ?: 0,
        ];
    }


    protected function getFilter(): array
    {
        $parent = parent::getFilter();
        if ($this->arParams['SECTION_CODE']) {
            $parent['SECTION_CODE'] = $this->arParams['SECTION_CODE'];
        }
        return $parent;
    }

    /**
     * @return string[]
     */
    protected function getSelect(): array
    {
        return [
            'NAME',
            'ACTIVE_FROM',
            'DETAIL_PAGE_URL',
            'PREVIEW_PICTURE',
            'IBLOCK_SECTION_ID',
            'SHOW_COUNTER',
        ];
    }

    protected function executeEpilog(): void
    {
        parent::executeEpilog();
        $this->returned = [
            'TITLE' => $this->arResult['SECTION_NAME'],
        ];
    }
}