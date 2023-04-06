<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/**
 * variables
 * @var array $arResult
 * @var array $arParams
 * @var \BlogRelatedListComponent $component
 */

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);
?>
<?php if ($arResult['ITEMS']): ?>
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="mb-3 "><?= Loc::getMessage('BLOCK_TITLE') ?></h2>
                </div>
            </div>
            <div class="row">
                <?php foreach ($arResult['ITEMS'] as $element): ?>
                    <div class="col-md-6 col-lg-4">
                        <a href="<?= $element['URL'] ?>" class="a-block d-flex align-items-center height-md"
                           style="background-image: url('<?= $element['PICTURE'] ?>'); ">
                            <div class="text">
                                <div class="post-meta">
                                    <span class="category"><?= $element['SECTION'] ?></span>
                                    <span class="mr-2"><?= $element['DATE'] ?> </span> •
                                    <span class="ml-2"><span class="fa fa-eye"></span> <?= $element['VIEWS'] ?></span>
                                </div>
                                <h3><?= $element['NAME'] ?></h3>
                            </div>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </section>
<?php endif; ?>
