<?php
/***************************************************************************************************
 * Copyright (c) 2020. by Camwel Corporate Solution PVT LTD
 * This project is developed and maintained by Camwel Corporate Solution PVT LTD.
 * Nobody is permitted to modify the source or any part of the project without permission.
 * Project Developer: Bidush Sarkar
 * Developed for: Camwel Corporate Solution PVT LTD
 **************************************************************************************************/
?><?php echo form_open() ?>
    <div class="row">
        <div class="form-group">
            <div class="col-sm-6">
                <label>To User ID <span class="text-danger">*</span></label>
                <input placeholder="Whom to transfer epins" value="<?php echo set_value('to') ?>" class="form-control"
                       name="to">
            </div>
            <div class="col-sm-6">
                <label>Amount <span class="text-danger">*</span></label>
                <select name="amount" id="amount" class="form-control">
                <option value="7000"><?php  echo number_format(7000,2)?></option>
                <option value="13000"><?php  echo number_format(13000,2)?></option>
                <option value="19000"><?php  echo number_format(19000,2)?></option>
                <option value="25000"><?php  echo number_format(25000,2)?></option>
                <option value="40000"><?php  echo number_format(40000,2)?></option>
                <option value="60000"><?php  echo number_format(60000,2)?></option>
            </select>
            </div>
            <div class="col-sm-6">
                <label>Number of Pins <span class="text-danger">*</span></label>
                <input placeholder="How many epin to transfer" value="<?php echo set_value('qty') ?>"
                       class="form-control" name="qty">
            </div>
            <div class="col-sm-6">
                <br/>
                <input type="submit" class="btn btn-primary" value="Transfer" onclick="this.value='Transferring..'">
            </div>
        </div>
    </div><p>&nbsp;</p>
<?php echo form_close() ?>