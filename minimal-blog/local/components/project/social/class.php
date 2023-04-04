<?php

use Bitrix\Main;
use Bitrix\Main\Loader;
use Bitrix\Main\Localization\Loc;
use WheatleyWL\BXIBlockHelpers\Exceptions\HLHelperException;
use WheatleyWL\BXIBlockHelpers\HLHelper;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

CBitrixComponent::includeComponentClass('system:standard.elements.list');

class SocialNetworkComponent extends StandardElementListComponent
{
    protected array $dictSocials = [
        'youtube' => [
            'CLASS' => 'fa-youtube-play',
        ],
        'instagram' => [
            'CLASS' => 'fa-instagram',
        ],
        'facebook' => [
            'CLASS' => 'fa-facebook',
        ],
        'twitter' => [
            'CLASS' => 'fa-twitter',
        ],
        'vimeo' => [
            'CLASS' => 'fa-vimeo',
        ],
        'snapchat' => [
            'CLASS' => 'fa-snapchat',
        ],
    ];

    /**
     * @param $params
     * @return array
     */
    public function onPrepareComponentParams($params): array {
        $result = parent::onPrepareComponentParams($params);
        $result ['HL_NAME'] = HL_SOCIAL_NETWORK;

        return $result;
    }

    /**
     * @throws Main\LoaderException
     */
    protected function checkModules() {
        if (!Loader::includeModule('highloadblock')) {
            throw new Main\LoaderException(
                Loc::getMessage('SOCIAL_NETWORK_CLASS_HIGHLOADBLOCK_MODULE_NOT_INSTALLED')
            );
        }
    }

    protected function checkParams() {
    }

    protected function getIblockId() {
    }

    /**
     * @throws Main\ArgumentException
     * @throws Main\ObjectPropertyException
     * @throws Main\SystemException
     * @throws HLHelperException
     */
    protected function getResult() {
        $this->arResult['ITEMS'] = [];

        $edc = HLHelper::getClassByName($this->arParams['HL_NAME']);

        $rs = $edc::getList([
            'order' => ['UF_SORT' => 'ASC'],
            'filter' => ['UF_ACTIVE' => 1],
            'select' => ['UF_CODE', 'UF_LINK'],
        ]);
        while ($ob = $rs->fetch()) {
            $this->arResult['ITEMS'][] = [
                'LINK' => $ob['UF_LINK'],
                'CODE' => $ob['UF_CODE'],
            ];
        }

        if ($this->arParams['CACHE_TYPE'] === 'A') {
            Main\Application::getInstance()->getTaggedCache()->registerTag($this->arParams['HL_NAME']);
        }
    }

    /**
     * @param array $result
     * @return array
     */
    public function prepareClassForIcon(array $result): array {
        foreach ($result['ITEMS'] as $key => $item) {
            if (!isset($this->dictSocials[$item['CODE']])) {
                unset($result['ITEMS'][$key]);
            }

            $result['ITEMS'][$key] = array_merge($result['ITEMS'][$key], $this->dictSocials[$item['CODE']]);
        }

        return $result;
    }
}
