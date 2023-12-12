<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><?php echo $title;?> || <?php echo config_item('company_name');?></title>
    <meta name="description" content="<?php echo $description;?>">
    <meta name="keyword" content="<?php echo $keyword;?>">
  
    <meta name="viewport" content="">
    <?php
    $this->load->view('theme/include/css'); ?>
    <style>
        .font {
            font-size: 14px;
        }
    </style>

</head>

<body>
    <?php
    $this->load->view('theme/include/header');
    ?>

    <?php if (trim($layout) == "") { ?>
        <div style="margin: 10%">
            <h2 align="center">Welcome to <?php echo config_item('company_name') ?></h2>
            <div align="center">Please click above to login or sign up</div>
        </div>
    <?php } else {
        include_once(APPPATH . "views/theme/" . $layout);
    } ?>


    <?php
    $this->load->view('theme/include/footer');
    $this->load->view('theme/include/js');
    ?>



</body>

</html>