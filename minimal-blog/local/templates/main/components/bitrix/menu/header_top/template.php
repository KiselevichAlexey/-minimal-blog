<?php

use App\Helpers\Misc;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}
/** @var array $arParams */
/** @var array $arResult */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
$arResult = Misc::convertMenuToTree($arResult);
?>

<?php if ($arResult) : ?>
    <nav class="navbar navbar-expand-md  navbar-light bg-light">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarMenu">

                <ul class="navbar-nav mx-auto">
                    <?php foreach ($arResult as $arItem) : ?>
                        <?php if ($arItem['ITEMS']) : ?>
                            <li class="nav-item dropdown <?= $arItem['SELECTED'] ? ' active' : '' ?>">
                                <a class="nav-link dropdown-toggle" href="<?= $arItem["LINK"] ?>" id="dropdown05"
                                   data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false"><?= $arItem["TEXT"] ?></a>
                                <div class="dropdown-menu" aria-labelledby="dropdown05">
                                    <?php foreach ($arItem['ITEMS'] as $childItem) : ?>
                                        <a class="dropdown-item"
                                           href="<?= $childItem["LINK"] ?>"><?= $childItem["TEXT"] ?></a>
                                    <?php endforeach; ?>
                                </div>

                            </li>
                        <?php else: ?>
                            <li class="nav-item">
                                <a class="nav-link<?= $arItem['SELECTED'] ? ' active' : '' ?>"
                                   href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a>
                            </li>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </ul>

            </div>
        </div
    </nav>
<?php endif; ?>