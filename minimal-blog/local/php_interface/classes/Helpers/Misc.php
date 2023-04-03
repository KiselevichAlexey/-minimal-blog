<?php

namespace App\Helpers;

use Carbon\Carbon;

class Misc
{
    /**
     * @param array $menus
     * @return array
     */
    public static function convertMenuToTree(array $menus): array
    {
        $newMenus = ['ITEMS' => []];
        $curItems = &$newMenus['ITEMS'];
        $curDepthLevel = 1;
        $stack = [];
        foreach ($menus as $item) {
            if ($item['DEPTH_LEVEL'] - $curDepthLevel >= 2) {
                continue;
            }

            if ($curDepthLevel < $item['DEPTH_LEVEL']) {
                $stack[$curDepthLevel][] = &$curItems;
                $curDepthLevel = $item['DEPTH_LEVEL'];
                $curItems = &$curItems[(is_countable($curItems) ? count($curItems) : 0) - 1]['ITEMS'];
            }

            if ($curDepthLevel > $item['DEPTH_LEVEL']) {
                $curDepthLevel = $item['DEPTH_LEVEL'];
                $curItems = &$stack[$curDepthLevel][count($stack[$curDepthLevel]) - 1];
            }

            $item['ITEMS'] = [];
            $curItems[] = $item;
        }

        $newMenus = $newMenus['ITEMS'];

        unset($curItems);
        unset($stack);

        return $newMenus;
    }

    /**
     * @param string $date
     * @return string
     */
    public static function changeDateFromFormat(string $date): string
    {
        Carbon::setLocale('en');
        $formatDate = Carbon::createFromTimestamp(strtotime($date));

        return $formatDate->translatedFormat('F j, Y');
    }
}