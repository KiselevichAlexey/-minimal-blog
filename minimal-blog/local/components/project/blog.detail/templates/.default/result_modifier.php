<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/** @var array $arParams */
/** @var array $arResult */

$arResult['TEXT'] = preForTemplate(array_chunk($arResult['IMAGES_BLOCKS'], 3), $arResult['TEXT']);
function preForTemplate(array $imagesBlock, string $text): string
{
    foreach ($imagesBlock as $key => $element) {

        $elementHTML = array_reduce(
            array_map('getlistElement', array_keys($element), $element),
            fn($carry, $item) => $carry .= $item,
            ''
        );

        $html = '<div class="row mb-5">' . $elementHTML . '</div>';
        $text = preg_replace('/#IMAGE_BLOCK' . $key + 1 . '#/', $html, $text);
    }

    return $text;
}

function getlistElement($key, $image): string
{
    $path = CFile::GetPath($image);
    $md = $key == 0 ? 12 : 6;
    return '<div class="col-md-' . $md . ' mb-4 element-animate">
                <img src="' . $path . '" alt="Image placeholder" class="img-fluid">
            </div>';
}