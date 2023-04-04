<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/**
 * variables
 * @var array $arResult
 * @var array $arParams
 * @var \MainSliderComponent $component
 */

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);
?>
<?php if ($arResult['ITEMS']): ?>
    <section class="site-section pt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme home-slider">
                        <?php foreach ($arResult['ITEMS'] as $element): ?>
                            <div>
                                <a href="<?= $element['URL'] ?>" class="a-block d-flex align-items-center height-lg"
                                   style="background-image: url('<?= $element['PICTURE'] ?>'); ">
                                    <div class="text half-to-full">
                                        <div class="post-meta">
                                            <span class="category"><?= $element['SECTION'] ?></span>
                                            <span class="mr-2"><?= $element['DATE'] ?></span> &bullet;
                                            <span class="ml-2"><span class="fa fa-eye"></span> <?= $element['VIEWS'] ?></span>
                                        </div>
                                        <h3><?= $element['NAME'] ?></h3>
                                        <p><?= $element["TEXT"] ?></p>
                                    </div>
                                </a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
<?php endif; ?>