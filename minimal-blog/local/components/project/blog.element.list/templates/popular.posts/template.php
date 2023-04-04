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
    <div class="sidebar-box">
        <h3 class="heading"><?= Loc::getMessage("POPULAR_POSTS") ?></h3>
        <div class="post-entry-sidebar">
            <ul>
                <?php foreach ($arResult['ITEMS'] as $element): ?>
                    <li>
                        <a href="<?= $element['URL'] ?>">
                            <img src="<?= $element['PICTURE'] ?>" alt="Image placeholder" class="mr-4">
                            <div class="text">
                                <h4><?= $element['NAME'] ?></h4>
                                <div class="post-meta">
                                    <span class="mr-2"><?= $element['DATE'] ?></span> •
                                    <span class="ml-2"><span class="fa fa-eye"></span> <?= $element['VIEWS'] ?></span>
                                </div>
                            </div>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
<?php endif; ?>
