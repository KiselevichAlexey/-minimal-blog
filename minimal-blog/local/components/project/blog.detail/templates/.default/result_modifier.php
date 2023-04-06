<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/** @var array $arParams */
/** @var array $arResult */

$arResult['TEXT'] = prepaForTemplate($arResult['IMAGES_BLOCKS'], $arResult['TEXT']);
function prepaForTemplate($mageId, $text)
{

    $block = 0;
    $count = 0;
    $arImageBlocks = [];

    foreach ($mageId as  $image) {
        $path = CFile::GetPath($image);
        $md = $count == 0 ? 12 : 6;
        $arImageBlocks[$block] .= '<div class="col-md-' . $md . ' mb-4 element-animate">
                                        <img src="' . $path . '" alt="Image placeholder" class="img-fluid">
                                    </div>';
        $count++;
        if ($count == 3) {
            $block++;
            $count = 0;
        }
    }

    foreach ($arImageBlocks as $key => $element){
        $html = '<div class="row mb-5">'.$element.'</div>';
        $text =  preg_replace('/#IMAGE_BLOCK' . $key+1 . '#/', $html, $text);
    }
return $text;
}