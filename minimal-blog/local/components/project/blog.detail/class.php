<?php

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('project:blog.element.list');

class BlogDetailComponent extends BlogElementListComponent
{
    public function onPrepareComponentParams($arParam): array
    {
        $result = parent::onPrepareComponentParams($arParam);
        $result['ELEMENT_CODE'] = trim($arParam['ELEMENT_CODE']);

        return $result;
    }

    protected function getFilter(): array
    {
        return [...parent::getFilter(), ...['CODE' => $this->arParams['ELEMENT_CODE']]];
    }

    protected function getSelect(): array
    {
        return [...parent::getSelect(), ...['ID','DETAIL_TEXT', 'PROPERTY_RELATED_POST']];
    }


    protected function getItems(array $element): array
    {
        $item = [
            'RELATED_POST' => $element['PROPERTY_RELATED_POST_VALUE'],
            'ID' => $element['ID'],
            'TEXT' => $element['DETAIL_TEXT'],
        ];

        return [...parent::getItems($element), ...$item];
    }

    /**
     * @return void
     */
    protected function getResult(): void
    {
        $iterator = $this->getIterator();
        if ($element = $iterator->GetNext()) {
            $this->arResult = $this->getItems($element);

            $rsSection = CIBlockElement::GetElementGroups($element['ID'], false, ['NAME', 'ID', 'SECTION_PAGE_URL']);
            while ($arSection = $rsSection->GetNext()) {
                $this->arResult['CATEGORIES'][$arSection['ID']] = [
                    'NAME' => $arSection['NAME'],
                    'SECTION_PAGE_URL' => $arSection['SECTION_PAGE_URL'],
                ];
            }

            $this->arResult['SECTION'] = $this->arResult['CATEGORIES'][$element['IBLOCK_SECTION_ID']]['NAME'];
        }
        if ($this->arParams['SHOW_NAV'] == 'Y' && $this->arParams['COUNT'] > 0) {
            $this->arResult['NAV_STRING'] = $iterator->GetPageNavString($this->arParams['PAGER_TITLE'],
                $this->arParams['PAGER_TEMPLATE'], $this->arParams['PAGER_SHOW_ALWAYS']);
        }

        $this->setResultCacheKeys(['ID', 'NAME', 'RELATED_POST']);
    }

    protected function executeEpilog(): void
    {
        parent::executeEpilog();
        if (CModule::IncludeModule("iblock")) {
            CIBlockElement::CounterInc($this->arResult['ID']);
        }
        $this->returned = [
            'ID' => $this->arResult['ID'],
            'NAME' => $this->arResult['NAME'],
            'RELATED_POST' => $this->arResult['RELATED_POST'],
        ];
    }

}
