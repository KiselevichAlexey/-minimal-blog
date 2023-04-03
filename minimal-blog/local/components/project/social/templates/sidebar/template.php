<?php if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var SocialNetworkComponent $component */
$this->setFrameMode(true);

$arResult = $component->prepareClassForIcon($arResult);
?>
<div class="social">
    <?php foreach ($arResult['ITEMS'] as $item) : ?>
        <a href="<?=$item['LINK']?>" class="p-2"><span class="fa <?=$item['CLASS']?>"></span></a>
    <?php endforeach; ?>
</div>

