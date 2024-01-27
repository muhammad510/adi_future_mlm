<?php
/***************************************************************************************************
 * Copyright (c) 2020. by Camwel Corporate Solution PVT LTD
 * This project is developed and maintained by Camwel Corporate Solution PVT LTD.
 * Nobody is permitted to modify the source or any part of the project without permission.
 * Project Developer: Bidush Sarkar
 * Developed for: Camwel Corporate Solution PVT LTD
 **************************************************************************************************/
?>
<div class="row">
    <?php echo form_open('users/search_topup_list') ?>
    <div class="alert alert-info">Fill any or all fields as per your need.</div>
    <div class="col-sm-6">
        <label>Topup By User ID</label>
        <input type="text" class="form-control" id="userid" name="userid">
    </div>
    <div class="col-sm-6">
        <label>Topup Amount</label>
        <select name="amt" id="amt"class="form-control">
            <option value="">Select</option>
            <?php foreach($amount as $am):?>
            <option value="<?php echo number_format($am['prod_price'],2); ?>"> ₹ <?php echo number_format($am['prod_price'],2) ;?></option>
            <?php endforeach;?>
            
        </select>
    </div>
    <div class="col-sm-6">
        <label>Topup Start Date</label>
        <input type="text" class="form-control datepicker" readonly id="startdate" name="startdate">
    </div>
    <div class="col-sm-6">
        <label>Topup End Date</label>
        <input type="text" class="form-control datepicker" readonly id="enddate" name="enddate">
    </div>
    <div class="col-sm-6"><br/>
        <input type="submit" class="btn btn-success" value="Search" onclick="this.value='Searching..'">

        <a href="<?php echo site_url('admin') ?>" class="btn btn-danger">&larr; Go Back</a>
    </div>
    <?php echo form_close() ?>
</div>
