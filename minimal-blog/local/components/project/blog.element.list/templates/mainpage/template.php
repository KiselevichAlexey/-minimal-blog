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

<div class="col-md-12 col-lg-8 main-content">
    <div class="row">
        <?php foreach ($arResult['ITEMS'] as $element): ?>
            <div class="col-md-6">
                <a href="<?= $element['URL'] ?>" class="blog-entry element-animate" data-animate-effect="fadeIn">
                    <img src="<?= $element['PICTURE'] ?>" alt="Image placeholder">
                    <div class="blog-content-body">
                        <div class="post-meta">
                            <span class="category"><?= $element['SECTION'] ?></span>
                            <span class="mr-2"><?= $element['DATE'] ?></span> &bullet;
                            <span class="ml-2"><span class="fa fa-comments"></span> 3</span>
                        </div>
                        <h2><?= $element['NAME'] ?></h2>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <nav aria-label="Page navigation" class="text-center">
                <ul class="pagination">
                    <li class="page-item  active"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>