<?php
if (! defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}

use Bitrix\Main;
use Bitrix\Main\Localization\Loc as Loc;
use WheatleyWL\BXIBlockHelpers\IBlockHelper;

class StandardElementListComponent extends CBitrixComponent
{
    /**
     * кешируемые ключи arResult
     * @var array()
     */
    protected $cacheKeys = [];

    /**
     * дополнительные параметры, от которых должен зависеть кеш
     * @var array
     */
    protected $cacheAddon = [];

    /**
     * парамтеры постраничной навигации
     * @var array
     */
    protected $navParams = [];

    /**
     * вохвращаемые значения
     * @var mixed
     */
    protected $returned;

    /**
     * тегированный кеш
     * @var mixed
     */
    protected $tagCache;

    protected $page = '';

    /**
     * подключает языковые файлы
     */
    public function onIncludeComponentLang()
    {
        $this->includeComponentLang(basename(__FILE__));
        Loc::loadMessages(__FILE__);
    }

    /**
     * подготавливает входные параметры
     * @param array $params
     * @return array
     */
    public function onPrepareComponentParams($params): array
    {
        $result = [];

        if (isset($params['IBLOCK_TYPE'])) {
            $result['IBLOCK_TYPE'] = trim($params['IBLOCK_TYPE']);
        }
        if (isset($params['IBLOCK_CODE'])) {
            $result['IBLOCK_CODE'] = trim($params['IBLOCK_CODE']);
        }
        if (isset($params['SECTION_CODE'])) {
            $result['SECTION_CODE'] = trim($params['SECTION_CODE']);
        }
        if (isset($params['SHOW_NAV'])) {
            $result['SHOW_NAV'] = $params['SHOW_NAV'] === 'Y' ? 'Y' : 'N';
        }
        if (isset($params['COUNT'])) {
            $result['COUNT'] = max(intval($params['COUNT']), 0);
        }
        if (isset($params['SORT_FIELD1'])) {
            $result['SORT_FIELD1'] = trim($params['SORT_FIELD1']) ?: 'ID';
        }
        if (isset($params['SORT_DIRECTION1'])) {
            $result['SORT_DIRECTION1'] = $params['SORT_DIRECTION1'] === 'ASC' ? 'ASC' : 'DESC';
        }
        if (isset($params['SORT_FIELD2'])) {
            $result['SORT_FIELD2'] = trim($params['SORT_FIELD2']) ?: 'ID';
        }
        if (isset($params['SORT_DIRECTION2'])) {
            $result['SORT_DIRECTION2'] = $params['SORT_DIRECTION2'] === 'ASC' ? 'ASC' : 'DESC';
        }
        if (isset($params['CACHE_TIME'])) {
            $result['CACHE_TYPE'] = in_array($params['CACHE_TYPE'], ['Y', 'A', 'N']) ? $params['CACHE_TYPE'] : 'N';
            $result['CACHE_TIME'] = intval($params['CACHE_TIME']) > 0 ? intval($params['CACHE_TIME']) : 3600;
            $result['CACHE_TAG_OFF'] = $params['CACHE_TAG_OFF'] === 'Y';
        }
        if (isset($params['AJAX'])) {
            $params['AJAX_KEY'] = trim($params['AJAX_KEY']) ?: 'AJAX';
            $result['AJAX'] = $params['AJAX'] === 'Y' && $this->request->get($params['AJAX_KEY']) === 'Y' ? 'Y' : 'N';
        }
        if (isset($params['MODAL_ID'])) {
            $result['MODAL_ID'] = $params['MODAL_ID'];
        }
        if (isset($params['PAGER_TEMPLATE'])) {
            $result['PAGER_TEMPLATE'] = $params['PAGER_TEMPLATE'];
        }
        if (isset($params['PAGER_TITLE'])) {
            $result['PAGER_TITLE'] = $params['PAGER_TITLE'];
        }
        if (isset($params['PAGER_SHOW_ALWAYS'])) {
            $result['PAGER_SHOW_ALWAYS'] = $params['PAGER_SHOW_ALWAYS'];
        }
        if (isset($params['PAGER_DESC_NUMBERING_CACHE_TIME'])) {
            $result['PAGER_DESC_NUMBERING_CACHE_TIME'] = $params['PAGER_DESC_NUMBERING_CACHE_TIME'];
        }


        return $result;
    }

    /**
     * определяет читать данные из кеша или нет
     * @return bool
     */
    protected function readDataFromCache(): bool
    {
        global $USER;
        if ($this->arParams['CACHE_TYPE'] == 'N') {
            return false;
        }

        if (is_array($this->cacheAddon)) {
            $this->cacheAddon[] = $USER->GetUserGroupArray();
        } else {
            $this->cacheAddon = [$USER->GetUserGroupArray()];
        }

        return ! ($this->startResultCache(false, $this->cacheAddon, md5(serialize($this->arParams))));
    }

    /**
     * кеширует ключи массива arResult
     */
    protected function putDataToCache()
    {
        if (is_array($this->cacheKeys) && sizeof($this->cacheKeys) > 0) {
            $this->SetResultCacheKeys($this->cacheKeys);
        }
    }

    /**
     * прерывает кеширование
     */
    protected function abortDataCache()
    {
        $this->AbortResultCache();
    }

    /**
     * завершает кеширование
     * @return bool
     */
    protected function endCache(): bool
    {
        if ($this->arParams['CACHE_TYPE'] == 'N') {
            return false;
        }

        $this->endResultCache();
        return true;
    }

    /**
     * проверяет подключение необходиимых модулей
     * @throws Main\LoaderException
     */
    protected function checkModules()
    {
        if (!Main\Loader::includeModule('iblock')) {
            throw new Main\LoaderException(Loc::getMessage('STANDARD_ELEMENTS_LIST_CLASS_IBLOCK_MODULE_NOT_INSTALLED'));
        }
    }

    /**
     * проверяет заполнение обязательных параметров
     * @throws \Bitrix\Main\ArgumentNullException
     */
    protected function checkParams()
    {
        if (!strlen($this->arParams['IBLOCK_TYPE'])) {
            throw new Main\ArgumentNullException('IBLOCK_TYPE');
        }
        if (!strlen($this->arParams['IBLOCK_CODE'])) {
            throw new Main\ArgumentNullException('IBLOCK_CODE');
        }
    }

    /**
     * выполяет действия перед кешированием
     */
    protected function executeProlog()
    {
        if ($this->arParams['COUNT'] > 0) {
            if ($this->arParams['SHOW_NAV'] == 'Y') {
                CPageOption::SetOptionString('main', 'nav_page_in_session', 'N');
                $this->navParams = [
                    'nPageSize' => $this->arParams['COUNT'],
                ];
                $arNavigation = CDBResult::GetNavParams($this->navParams);
                $this->cacheAddon = [$arNavigation];
            } else {
                $this->navParams = [
                    'nTopCount' => $this->arParams['COUNT'],
                ];
            }
        } else {
            $this->navParams = false;
        }
    }

    /**
     * Определяет ID инфоблока по коду, если не был задан
     * @throws \Bitrix\Main\ArgumentNullException
     */
    protected function getIblockId()
    {
        try {
            if (!$this->arParams['IBLOCK_TYPE'] || !$this->arParams['IBLOCK_CODE']) {
                throw new Main\ArgumentNullException('IBLOCK_CODE');
            }

            $this->arParams['IBLOCK_ID'] = IBlockHelper::getIBlockIdByCode(
                $this->arParams['IBLOCK_CODE'],
                $this->arParams['IBLOCK_TYPE']
            );

            if ($this->arParams['IBLOCK_ID'] && $this->arParams['CACHE_TAG_OFF']) {
                CIBlock::disableTagCache($this->arParams['IBLOCK_ID']);
            }
        } catch (Throwable $throwable) {
            $this->abortDataCache();
            throw new Main\ArgumentNullException('IBLOCK_ID');
        }

        $this->arResult['IBLOCK_ID'] = $this->arParams['IBLOCK_ID'];
        $this->cacheKeys[] = 'IBLOCK_ID';
    }

    /**
     * получение результатов
     */
    protected function getResult()
    {
        $iterator = $this->getIterator();
        while ($element = $iterator->GetNext()) {
            $this->arResult['ITEMS'][] = $this->getItems($element);
        }
        if ($this->arParams['SHOW_NAV'] == 'Y' && $this->arParams['COUNT'] > 0) {
            $this->arResult['NAV_STRING'] = $iterator->GetPageNavString($this->arParams['PAGER_TITLE'],
                $this->arParams['PAGER_TEMPLATE'], $this->arParams['PAGER_SHOW_ALWAYS']);
        }
    }

    /**
     * @return CIBlockResult|int
     */
    protected function getIterator(): int|CIBlockResult
    {
        return CIBlockElement::GetList(
            $this->getOrder(),
            $this->getFilter(),
            false,
            $this->navParams,
            $this->getSelect()
        );
    }

    /**
     * @param array $element
     * @return array
     */
    protected function getItems(array $element): array
    {
        return [
            'ID' => $element['ID'],
            'NAME' => $element['NAME'],
            'DATE' => $element['ACTIVE_FROM'],
            'URL' => $element['DETAIL_PAGE_URL'],
            'TEXT' => $element['PREVIEW_TEXT'],
            'PICTURE' => $element['PREVIEW_PICTURE'],
        ];
    }

    /**
     * сортировка по умолчанию
     * @return array
     */
    protected function getOrder(): array
    {
        return [
            $this->arParams['SORT_FIELD1'] => $this->arParams['SORT_DIRECTION1'],
            $this->arParams['SORT_FIELD2'] => $this->arParams['SORT_DIRECTION2'],
        ];
    }

    /**
     * Фильтрация по умолчанию
     * @return array
     */
    protected function getFilter(): array
    {
        return [
            'IBLOCK_TYPE' => $this->arParams['IBLOCK_TYPE'],
            'IBLOCK_ID' => $this->arParams['IBLOCK_ID'],
            'ACTIVE' => 'Y',
        ];
    }

    /**
     * выборка по умолчанию
     * @return array
     */
    protected function getSelect(): array
    {
        return [
            'ID',
            'NAME',
            'DATE_ACTIVE_FROM',
            'DETAIL_PAGE_URL',
            'PREVIEW_TEXT',
            'PREVIEW_TEXT_TYPE',
        ];
    }

    /**
     * выполняет действия после выполения компонента, например установка заголовков из кеша
     */
    protected function executeEpilog()
    {
        if ($this->arResult['IBLOCK_ID'] && $this->arParams['CACHE_TAG_OFF']) {
            CIBlock::enableTagCache($this->arResult['IBLOCK_ID']);
        }
    }

    /**
     * выполняет логику работы компонента
     */
    public function executeComponent()
    {
        global $APPLICATION;
        try {
            $this->checkModules();
            $this->checkParams();
            $this->executeProlog();
            if ($this->arParams['AJAX'] == 'Y') {
                $APPLICATION->RestartBuffer();
            }
            if (! $this->readDataFromCache()) {
                $this->getIblockId();
                $this->getResult();
                $this->putDataToCache();
                $this->includeComponentTemplate($this->page);
            }
            $this->executeEpilog();

            if ($this->arParams['AJAX'] == 'Y') {
                die();
            }

            return $this->returned;
        } catch (Exception $e) {
            $this->abortDataCache();
            ShowError($e->getMessage());
        }

        return [];
    }
}
