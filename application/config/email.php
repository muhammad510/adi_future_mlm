<?php
/***************************************************************************************************
 * Copyright (c) 2020. by Camwel Corporate Solution PVT LTD
 * This project is developed and maintained by Camwel Corporate Solution PVT LTD.
 * Nobody is permitted to modify the source or any part of the project without permission.
 * Project Developer: Camwel Corporate Solution PVT LTD
 * Developed for: Camwel Corporate Solution PVT LTD
 **************************************************************************************************/


// Email Setting Start

$config['protocol'] = 'smtp';
$config['smtp_host'] = config_item('support_email');
$config['smtp_user'] = config_item('support_email');
$config['smtp_pass'] = 'Multi@1212#@#M';
$config['smtp_port'] = '465';
$config['smtp_crypto'] = 'ssl';
$config['mailtype'] = 'html';
            