<?php
function pre($var)
{
    global $USER;
    if ($USER->IsAdmin()) {
        echo '<pre>';
        print_r($var);
        echo '</pre>';
    }
}
