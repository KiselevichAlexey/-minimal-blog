<?php
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) {
    die();
}

/**
 * variables
 * @var array $arResult
 * @var array $arParams
 * @var \BlogSectionListComponent $component
 */

use Bitrix\Main\Localization\Loc as Loc;

Loc::loadMessages(__FILE__);
?>
<?php if ($arResult['ITEMS']): ?>
        <div class="sidebar-box">
            <h3 class="heading"><?= Loc::getMessage('CATEGORIES') ?></h3>
            <ul class="categories">
                <?php foreach ($arResult['ITEMS'] as $element): ?>
                    <li><a href="<?= $element['URL'] ?>"><?= $element['NAME'] ?>
                            <span>(<?= $element['CNT'] ?>)</span></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
<?php endif; ?>