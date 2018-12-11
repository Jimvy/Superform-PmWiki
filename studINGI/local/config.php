<?php if (!defined('PmWiki')) exit();

$WikiTitle = "Wiki student INGI";
$AuthUser['myself'] = crypt('myself');
$DefaultPasswords['edit'] = 'id:myself';
include_once("$FarmD/scripts/authuser.php");
