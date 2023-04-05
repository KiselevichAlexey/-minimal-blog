<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/**
 * variables
 * @var array $arResult
 * @var array $arParams
 * @var \BlogElementListComponent $component
 */

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);
?>
<?php if ($arResult['ITEMS']): ?>

    <div class="row">
        <?php foreach ($arResult['ITEMS'] as $element): ?>
            <div class="col-md-6">
                <a href="<?= $element['URL'] ?>" class="blog-entry element-animate" data-animate-effect="fadeIn">
                    <img src="<?= $element['PICTURE'] ?>" alt="Image placeholder">
                    <div class="blog-content-body">
                        <div class="post-meta">
                            <span class="category"><?= $element['SECTION'] ?></span>
                            <span class="mr-2"><?= $element['DATE'] ?></span> &bullet;
                            <span class="ml-2"><span class="fa fa-eye"></span> <?= $element['VIEWS'] ?></span>
                        </div>
                        <h2><?= $element['NAME'] ?></h2>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
    <?=$arResult["NAV_STRING"]?>

<?php endif;?>
