<?

use Bitrix\Main\Localization\Loc;

if(!defined("B_PROLOG_INCLUDED")||B_PROLOG_INCLUDED!==true)die();
/**
 * Bitrix vars
 *
 * @var array $arParams
 * @var array $arResult
 * @var CBitrixComponentTemplate $this
 * @global CMain $APPLICATION
 * @global CUser $USER
 */

?>

<? if(!empty($arResult["ERROR_MESSAGE"]))
{
	foreach($arResult["ERROR_MESSAGE"] as $v)
		ShowError($v);
}
if($arResult["OK_MESSAGE"] <> '')
{
	?><div class="mf-ok-text"><?=$arResult["OK_MESSAGE"]?></div><?
}
?>
	<form action="<?=POST_FORM_ACTION_URI?>" method="POST">
		<?=bitrix_sessid_post()?>
		<div class="row">
			<div class="col-md-4 form-group">
				<label for="name"><?=Loc::getMessage('MFT_NAME')?></label>
				<input type="text" id="name" name="user_name" value="<?=$arResult["AUTHOR_NAME"]?>" class="form-control ">
			</div>
			<div class="col-md-4 form-group">
				<label for="phone"><?=Loc::getMessage('MFT_PHONE')?></label>
				<input type="text" name="phone" id="phone" class="form-control"  placeholder="+7(000)000-00-00">
			</div>
			<div class="col-md-4 form-group">
				<label for="email"><?=Loc::getMessage('MFT_EMAIL')?></label>
				<input type="email" id="email" name="user_email" value="<?=$arResult["AUTHOR_EMAIL"]?>" class="form-control ">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 form-group">
				<label for="message"><?=Loc::getMessage('MFT_MESSAGE')?></label>
				<textarea name="MESSAGE" id="message" class="form-control " cols="30" rows="8"><?=$arResult["MESSAGE"]?><?=$arResult["OK_MESSAGE"]?></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 form-group">
				<input type="hidden" name="PARAMS_HASH" value="<?=$arResult["PARAMS_HASH"]?>">
				<input type="submit" name="submit" value="<?=GetMessage("MFT_SUBMIT")?>" class="btn btn-primary">
			</div>
		</div>
	</form>
