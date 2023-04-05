<?php use Bitrix\Main\Localization\Loc;

if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
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
/** @var CBitrixComponent $component */

$this->setFrameMode(true);
Loc::loadMessages(__FILE__);
if (!$arResult['NavShowAlways']) {
    if ($arResult['NavRecordCount'] == 0 || ($arResult['NavPageCount'] == 1 && $arResult['NavShowAll'] == false)) {
        return;
    }
}

$arResult['NavQueryString'] = preg_replace('/\&amp;?AJAX=Y/', '', $arResult['NavQueryString']);

$strNavQueryString = ($arResult['NavQueryString'] != '' ? $arResult['NavQueryString'] . '&amp;' : '');
$strNavQueryStringFull = ($arResult['NavQueryString'] != '' ? '?' . $arResult['NavQueryString'] : '');

$linkOnFirstPage = $arResult['sUrlPath'] . $strNavQueryStringFull;
$linkOnPageBy = $arResult['sUrlPath'] . '?' . $strNavQueryString . 'PAGEN_' . $arResult['NavNum'] . '=';

if ($arResult['nEndPage'] - $arResult['nStartPage'] == 1 && $arResult['NavPageCount'] > 2) {
    $arResult['nStartPage']++;
    $arResult['nEndPage']++;
}
?>
<div class="row">
    <div class="col-md-12 text-center">
        <nav aria-label="Page navigation" class="text-center">
            <ul class="pagination">
                <?php if ($arResult['NavPageNomer'] > 1) { ?>
                    <?php
                    $url = $arResult['NavPageNomer'] == 2 ? $linkOnFirstPage : $linkOnPageBy . ($arResult['NavPageNomer'] - 1);
                    ?>
                    <li class="page-item"><a class="page-link" href="<?= $url ?>"><?= Loc::getMessage('PREV') ?></a>
                    </li>
                <?php } ?>
                <?php if ($arResult['nStartPage'] > 1) { ?>
                    <li class="page-item"><a class="page-link" href="<?= $linkOnFirstPage ?>">1</a>
                    </li>
                <?php } ?>
                <?php if ($arResult['nStartPage'] > 2) { ?>
                    <li class="page-item"><a class="page-link" href="#">...</a>
                    </li>
                <?php } ?>

                <?php while ($arResult['nStartPage'] <= $arResult['nEndPage']) { ?>
                    <?php
                    $isActive = $arResult['NavPageNomer'] == $arResult['nStartPage'];
                    $url = $arResult['nStartPage'] == 1 ? $linkOnFirstPage : $linkOnPageBy . $arResult['nStartPage'];
                    ?>
                    <li class="page-item<?= $isActive ? ' active' : '' ?>">
                        <a class="page-link" href="<?= $url ?>">
                            <?= $arResult['nStartPage'] ?>
                        </a>
                    </li>
                    <?php $arResult['nStartPage']++; ?>
                <?php } ?>

                <?php if ($arResult['nEndPage'] + 1 < $arResult['NavPageCount']) { ?>
                    <li class="page-item"><a class="page-link" href="#">...</a>
                    </li>
                <?php } ?>
                <?php if ($arResult['nEndPage'] < $arResult['NavPageCount']) { ?>
                    <li class="page-item"><a class="page-link"
                                             href="<?= $linkOnPageBy . $arResult['NavPageCount'] ?>">
                            <?= $arResult['NavPageCount'] ?>
                        </a>
                    </li>
                <?php } ?>
                <?php if ($arResult['NavPageNomer'] < $arResult['NavPageCount']) { ?>
                    <li class="page-item"><a class="page-link"
                                             href="<?= $linkOnPageBy . ($arResult['NavPageNomer'] + 1) ?>"><?= Loc::getMessage('NEXT') ?></a>
                    </li>
                <?php } ?>
            </ul>
        </nav>
    </div>
</div>