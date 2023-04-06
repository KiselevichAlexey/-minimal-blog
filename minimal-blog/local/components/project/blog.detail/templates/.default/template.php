<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var \BlogDetailComponent $component */
$this->setFrameMode(true);

use Bitrix\Main\Localization\Loc;
?>
<div class="post-meta">
    <span class="category"><?= $arResult['SECTION'] ?></span>
    <span class="mr-2"><?= $arResult['DATE'] ?> </span> &bullet;
    <span class="ml-2"><span class="fa fa-eye"></span> <?= $arResult['VIEWS'] ?></span>
</div>
<div class="post-content-body">
    <?= $arResult['TEXT'] ?>
</div>
<div class="pt-5">
    <p><?= Loc::getMessage('CATEGORIES'); ?>
        <?php
        $i = 1;
        foreach ($arResult['CATEGORIES'] as $category) { ?>
            <a
            href="<?= $category['SECTION_PAGE_URL'] ?>"><?= $category['NAME'] ?></a>
            <?php if ($i < count($arResult['CATEGORIES'])) {
                echo ', ';
            }
            $i++ ?>
        <?php } ?>
    </p>
</div>



