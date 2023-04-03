<?php

namespace App\Helpers;

use CIBlock;
use CIBlockProperty;
use CIBlockPropertyEnum;
use CIBlockSection;
use CIBlockSectionPropertyLink;

class ParametersComponent
{
    public static function getIblocks(?string $iblockType = ''): array
    {
        $result = [];

        $hasIblockType = !empty(trim($iblockType));

        $filter = ['ACTIVE' => 'Y'];
        if ($hasIblockType) {
            $filter['TYPE'] = $iblockType;
            $result = [
                'IDS' => [],
                'CODES' => [
                    '' => ' ',
                ]
            ];
        }

        $iterator = CIBlock::GetList(['SORT' => 'ASC'], $filter);
        while ($iblock = $iterator->GetNext()) {
            if ($hasIblockType) {
                $result['IDS'][$iblock['CODE']] = $iblock['ID'];
                $result['CODES'][$iblock['CODE']] = $iblock['NAME'];
            } else {
                if (!isset($result[$iblock['IBLOCK_TYPE_ID']])) {
                    $result[$iblock['IBLOCK_TYPE_ID']] = [
                        'IDS' => [],
                        'CODES' => [
                            '' => ' ',
                        ]
                    ];
                }
                $result[$iblock['IBLOCK_TYPE_ID']]['IDS'][$iblock['CODE']] = $iblock['ID'];
                $result[$iblock['IBLOCK_TYPE_ID']]['CODES'][$iblock['CODE']] = $iblock['NAME'];
            }
        }

        return $result;
    }

    public static function getSections(?string $iblockType, ?string $iblockCode): array
    {
        $sections = ['' => ' - '];

        if (empty($iblockCode)) { return $sections;  }

        $arFilterSection = [
            'SECTION_ID' => false, // только корневые разделы
            'ACTIVE' => 'Y', // только активные разделы
        ];
        // если уже выбран тип инфоблока, выбираем разделы, принадлежащие инфоблокам выбранного типа
        if (!empty($iblockType)) {
            $arFilterSection['IBLOCK_TYPE'] = $iblockType;
        }
        // если уже выбран инфоблок, выбираем разделы только этого инфоблока
        $arFilterSection['IBLOCK_CODE'] = $iblockCode;

        $sectionList = CIBlockSection::GetList([], $arFilterSection, true);
        while ($section = $sectionList->GetNext()) {
            $sections[$section['CODE']] = $section['NAME'];
        }

        return $sections;
    }

    public static function getRootSectionsByIblockId(?int $iblockId): array
    {
        $result = [
            '' => ' - ',
        ];

        $rs = CIBlockSection::GetList(
            ['NAME' => 'ASC', 'SORT' => 'ASC'],
            ['IBLOCK_ID' => $iblockId, 'SECTION_ID' => false, 'ACTIVE' => 'Y'],
            false,
            ['NAME', 'CODE']
        );
        while ($ob = $rs->Fetch()) {
            $result[$ob['CODE']] = $ob['NAME'];
        }

        return $result;
    }

    public static function getSortFields(): array
    {
        return [
            'ID' => 'ID',
            'NAME' => 'Название',
            'ACTIVE_FROM' => 'Дата начала активности',
            'SORT' => 'Индекс сортировки',
            'SHOW_COUNTER' => 'Количество просмотров',
            'RAND' => 'Рандомно',
        ];
    }

    public static function getSortDirection(): array
    {
        return [
            'ASC' => 'По возрастанию',
            'DESC' => 'По убыванию',
        ];
    }

    public static function insertSortInParameters(&$componentParameter, $countSort = 2, $sortFields = [])
    {
        $sortFields = $sortFields ?: self::getSortFields();
        $sortParameters = [
            'SORT_FIELD1' => [
                'PARENT' => 'VISUAL',
                'NAME' => 'Поле первой сортировки',
                'TYPE' => 'LIST',
                'VALUES' => $sortFields,
                'ADDITIONAL_VALUES' => 'Y',
            ],
            'SORT_DIRECTION1' => [
                'PARENT' => 'VISUAL',
                'NAME' => 'Направление первой сортировки',
                'TYPE' => 'LIST',
                'VALUES' => self::getSortDirection(),
                'ADDITIONAL_VALUES' => 'Y',
            ],
            'SORT_FIELD2' => [
                'PARENT' => 'VISUAL',
                'NAME' => 'Поле второй сортировки',
                'TYPE' => 'LIST',
                'VALUES' => $sortFields,
                'ADDITIONAL_VALUES' => 'Y',
            ],
            'SORT_DIRECTION2' => [
                'PARENT' => 'VISUAL',
                'NAME' => 'Направление второй сортировки',
                'TYPE' => 'LIST',
                'VALUES' => self::getSortDirection(),
                'ADDITIONAL_VALUES' => 'Y',
            ],
        ];
        if ($countSort === 1) {
            unset($sortParameters['SORT_FIELD2']);
            unset($sortParameters['SORT_DIRECTION2']);
        }

        $componentParameter['PARAMETERS'] = array_merge($componentParameter['PARAMETERS'], $sortParameters);
    }

    public static function insertAjaxSettingsInParameters(&$componentParameter)
    {
        $componentParameter['GROUPS']['AJAX_SETTINGS'] = [
            'NAME' => 'Управление режимом AJAX',
            'SORT' => 550,
        ];
        $componentParameter['PARAMETERS']['AJAX'] = [
            'PARENT' => 'AJAX_SETTINGS',
            'NAME' => 'Включить подгрузку ajax\'ом',
            'TYPE' => 'CHECKBOX',
            'DEFAULT' => 'N',
        ];
        $componentParameter['PARAMETERS']['AJAX_KEY'] = [
            'PARENT' => 'AJAX_SETTINGS',
            'NAME' => 'Ключ get-параметра ajax',
            'TYPE' => 'STRING',
            'DEFAULT' => 'AJAX',
        ];
    }

    public static function insertShowNavInParameters(&$componentParameter)
    {
        $componentParameter['PARAMETERS']['SHOW_NAV'] = [
            'PARENT' => 'VISUAL',
            'NAME' => 'Постраничная навигация',
            'TYPE' => 'CHECKBOX',
            'DEFAULT' => 'N',
        ];
    }

    public static function insertCountInParameters(&$componentParameter)
    {
        $componentParameter['PARAMETERS']['COUNT'] = [
            'PARENT' => 'VISUAL',
            'NAME' => 'Количество элементов',
            'TYPE' => 'STRING',
            'DEFAULT' => '0',
        ];
    }

    public static function insertIblockTypeInParameters(
        &$componentParameter,
        $values,
        $keyParameter = 'IBLOCK_TYPE',
        $needRefresh = true,
        $name = ''
    ) {
        $componentParameter['PARAMETERS'][$keyParameter] = [
            'PARENT' => 'DATA_SOURCE',
            'NAME' => $name ?: 'Тип инфоблока',
            'TYPE' => 'LIST',
            'VALUES' => $values,
            'DEFAULT' => '',
            'REFRESH' => $needRefresh ? 'Y' : 'N',
            'ADDITIONAL_VALUES' => 'Y',
        ];
    }
    public static function insertIblockCodeInParameters(
        &$componentParameter,
        $values,
        $keyParameter = 'IBLOCK_CODE',
        $needRefresh = true,
        $name = ''
    ) {
        $componentParameter['PARAMETERS'][$keyParameter] = [
            'PARENT' => 'DATA_SOURCE',
            'NAME' => $name ?: 'Код Инфоблока',
            'TYPE' => 'LIST',
            'VALUES' => $values,
            'REFRESH' => $needRefresh ? 'Y' : 'N',
            'ADDITIONAL_VALUES' => 'Y',
        ];
    }
}