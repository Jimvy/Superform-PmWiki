<?php if (!defined('PmWiki')) exit();

$WikiTitle = "Wiki student INGI";

$AuthUser['myself'] = crypt('myself');
include_once("$FarmD/scripts/authuser.php");

$DefaultPasswords['edit'] = 'id:myself';

