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
    <div class="col-md-12 col-lg-8 main-content">
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

<?php endif; ?>