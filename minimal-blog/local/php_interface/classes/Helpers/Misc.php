<?php
namespace App\Helpers;
class Misc
{
    public static function convertMenuToTree(array $menus): array
    {
        $newMenus = ['ITEMS' => []];
        $curItems = &$newMenus['ITEMS'];
        $curDepthLevel = 1;
        $stack = [];
        foreach($menus as $item) {
            if ($item['DEPTH_LEVEL'] - $curDepthLevel >= 2  ){
                continue;
            }

            if ($curDepthLevel < $item['DEPTH_LEVEL']) {
                $stack[$curDepthLevel][] = &$curItems;
                $curDepthLevel = $item['DEPTH_LEVEL'];
                $curItems = &$curItems[count($curItems) - 1]['ITEMS'];
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
}