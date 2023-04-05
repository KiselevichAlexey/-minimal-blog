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
        <div class="row mb-5 mt-5">
            <div class="col-md-12">
                <?php foreach ($arResult['ITEMS'] as $element): ?>
                    <div class="post-entry-horzontal">
                        <a href="<?= $element['URL'] ?>">
                            <div class="image element-animate" data-animate-effect="fadeIn"
                                 style="background-image: url(<?= $element['PICTURE'] ?>);"></div>
                            <span class="text">
                      <div class="post-meta">
                        <span class="category"><?= $element['SECTION'] ?></span>
                        <span class="mr-2"><?= $element['DATE'] ?> </span> &bullet;
                        <span class="ml-2"><span class="fa fa-eye"></span> <?= $element['VIEWS'] ?></span>
                      </div>
                      <h2><?= $element['NAME'] ?></h2>
                    </span>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?=$arResult["NAV_STRING"]?>
<?php endif; ?>