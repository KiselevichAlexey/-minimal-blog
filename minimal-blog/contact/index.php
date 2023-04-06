<?php
require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php");
/**
 * @global $APPLICATION
 */
$APPLICATION->SetTitle("Contact");
?>

<?php $APPLICATION->IncludeComponent(
    "bitrix:main.feedback",
    ".default",
    [
        "COMPONENT_TEMPLATE" => ".default",
        "EMAIL_TO" => "my@email.com",
        "EVENT_MESSAGE_ID" => [0 => "7",],
        "OK_TEXT" => "Спасибо, ваше сообщение принято.",
        "REQUIRED_FIELDS" => [0 => "NAME", 1 => "EMAIL",],
        "USE_CAPTCHA" => "N",
    ]
); ?><?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>