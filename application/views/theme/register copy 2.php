<style>
    .btn-primary:hover {
        color: #ffffff;
        background-color: #100f0f;
        border-color: #131313;
    }
</style>


<?php if (config_item('disable_registration') !== "Yes") { ?>
    <div class="container" style="background-color: white;">

        <?php echo form_open() ?>
        <h3 align="" style=" padding:10px 10px;">Member Registration</h3>

        <div id="load" style="display:none !important;" align="center">
            <img src="<?php echo site_url('uploads/load.gif') ?>">
            <h3 style="color:lightseagreen">Registering...</h3>
        </div>



        <div class="row" id="form" style=" padding:20px 5px; margin: 10px auto; background-color:white; box-shadow:1px 2px 2px 1px gray inset, 1px 2px 2px 1px gray  ">

            <div class="col-md-1"></div>

            <!-- start here -->
            <div class="col-md-10" >
                <div class="row">

                    <?php echo validation_errors('<div class="alert alert-danger">', '</div>') ?>
                    <?php echo $this->session->flashdata('site_flash') ?>

                   

                    <div class="col-md-12">
                        <div class="form-group ">
                          
                            <input type="text" class="form-control" id="name" name="name" value="<?php echo set_value('name') ?>" placeholder="Enter Name*">
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                           
                            <input type="text" class="form-control" value="<?php echo set_value('phone') ?>" id="phone" name="phone" placeholder="Enter Phone Number*">
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                          
                            <input type="email" class="form-control" value="<?php echo set_value('email') ?>" id="email" name="email" placeholder="Enter Email">
                        </div>
                    </div>

                  

                    <div class="col-md-12">
                        <div class="form-group">
                        
                            <input type="text" class="form-control" value="<?php echo set_value('address_1') ?>" id="address_1" name="address_1" placeholder="Enter Address1*">
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="form-group">
                          
                            <input type="text" class="form-control" value="<?php echo set_value('address_2') ?>" id="address_2" name="address_2" placeholder="Enter Address2">
                        </div>
                    </div>
                    <!-- ######################password######################### -->

                   

                  


                    <div class="col-md-12">
                        <div class="form-group">                          
                            <input type="text" class="form-control" onchange="get_user_name('#sponsor', '#spn_res')" value="<?php if ($this->uri->segment(3) !== "epin") {
                                                                                                            $uri4 = $this->uri->segment(4);
                                                                                                        };
                                                                                                        echo set_value('sponsor', $uri4) ?>" id="sponsor" name="sponsor" placeholder="sponsor Id*">
                            <span id="spn_res" style="color: red; font-weight: bold"></span>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <?php if (config_item('leg') !== "1" && config_item('show_placement_id') == "Yes" && config_item('autopool_registration') == "No") { ?>
                            <div class="form-group">
                                <label for="position" class="control-label">Placement ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="psn_res" style="color: red; font-weight: bold"></span></label>
                                <input type="text" class="form-control" onchange="get_user_name('#position', '#psn_res')" id="position" value="<?php if ($this->uri->segment(3) !== "epin") {
                                                                                                                                $uri4 = $this->uri->segment(4);
                                                                                                                            };
                                                                                                                            echo set_value('position', $uri4) ?>" name="position" id="position" placeholder="Where you want to place the ID">
                            </div>
                        <?php
                        } ?>
                    </div>


                    <div class="col-md-12" id="pos"  style="display: none;">
                        <?php if (config_item('leg') == "1") {
                            echo form_hidden('leg', 'A');
                        } else {
                            if (config_item('show_leg_choose') == "Yes" && config_item('autopool_registration') == "No") {
                        ?>
                                <div class="form-group">
                                    <label for="leg" class="control-label">Position<span class="text-danger">*</span></label>
                                    <select id="leg" name="leg" class="form-control">
                                        <option value="">Select One</option>
                                        <?php
                                        $lg = '';
                                        if (trim($this->uri->segment(3)) !== "" && trim($this->uri->segment(3)) !== "epin") {
                                            $lg = trim($this->uri->segment(3));
                                        }
                                        ?>
                                        <?php foreach ($leg as $key => $val) { ?>
                                            <option value="<?php echo $key; ?>" <?php echo ($lg == $key) ? "Selected" : " " ?>><?php echo $val; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                        <?php }
                        } ?>
                    </div>



                    <!-- <div class="col-md-12">
                        <?php //if (config_item('show_join_product') == "Yes") {
                        ?>
                        <div class="form-group">
                            <label for="product" class="control-label">Sign Up Product / Package</label>
                            <select id="product" name="product" class="form-control">
                                <?php foreach ($products as $val) {
                                    echo '<option value="' . $val['id'] . '">' . $val['prod_name'] . '. Price :' . config_item('currency') . number_format($val['prod_price'] + ($val['prod_price'] * $val['gst'] / 100), 2) . ' </option>';
                                } ?>

                            </select>
                        </div>
                        <?php
                        //} 
                        ?>
                    </div> -->

                    <input type="hidden" id="product" class="form-control" name="product" value="1">

                    <div class="col-md-12">
                        <?php if (config_item('enable_epin') == "Yes" && config_item('free_registration') == "No") {
                        ?>
                            <div class="form-group" id="e_pin">
                                <label for="epin" class="control-label">e-PIN</label>
                                <input type="text" class="form-control" value="<?php if (trim($this->uri->segment(3)) == "epin") {
                                                                echo set_value('epin', $this->uri->segment(4));
                                                            } ?>" id="epin" name="epin" placeholder="e-PIN*">
                            </div>
                        <?php } ?>
                    </div>

                    <div class="col-md-12">
                        <?php if (config_item('show_join_product') == "No" && config_item('free_registration') == "No") {
                        ?>
                            <div class="form-group" id="amt_to_pay">
                                <label for="amt_to_pay" class="control-label">Amount You Want to Pay ?</label>
                                <input type="text" class="form-control" required value="<?php echo set_value('amt_to_pay') ?>" id="amt_to_pay" name="amt_to_pay">
                            </div>
                        <?php } ?>
                    </div>

                    <div class="col-md-12">
                        <?php if (config_item('enable_pg') == "Yes" && config_item('free_registration') == "No") {
                        ?>
                            <div class="form-group">
                                <label for="epin" class="control-label" style="color: #3a80d7">Payment Gateway</label><br />
                                <input type="checkbox" class="form-control" value="yes" id="pg" name="pg" onclick="toogle_div('#e_pin', '#pg')"> I'll Pay
                                Using
                                Payment
                                Gateway.
                            </div>
                        <?php
                        }
                        ?>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <!-- <input type="submit" class="btn btn-primary btn-lg" value="Register" onclick="show()"> -->
                            <button class="btn btn-success btn-lg" type="submit" style="background-color: #056305;" onclick="show()">Register</button>
                        </div>
                    </div>







                </div>
            </div>
            <!-- end here -->

            <div class="col-md-1"></div>


        </div>

        <!-- row end here -->
        <?php echo form_close(); ?>
    </div>


<?php } else {
    echo "<h3 align='center' style='margin: 10%'> Registration is disabled for maintanance. Please come later.</h3>";
} ?>



<script type="text/javascript">
    function toogle_div(id1, id2) {
        if ($(id2).prop("checked") == true) {
            $(id1).hide('slow');
        } else {
            $(id1).show('slow');
        }
    }

    function show() {
        $('#form').hide('slow');
        $('#load').show('slow');
    }

    // function get_user_name(id, result) {
    //     var id = $(id).val();
    //     $.get("<?php echo site_url('site/get_user_name/') ?>" + id, function(data) {
    //         // $(result).html(data);
    //         console.log(data)
    //     });
    // }

    function get_user_name(id,result)
    {
       
        var id = $(id).val();
        $.ajax({
            url:"<?php echo site_url('site/get_user_name') ?>",
            type:"post",
            data:{"id":id},
            dataType:"json",
            success:function(data)
            {
                if(data.rank=="master_agent" || data.rank=="Agent")
                {
                   
                      $(result).html(data.name+'<i class="text-dark">('+data.rank+')</i>');
                      $("#pos").hide('slow');
                }
                else{
                    $(result).html(data.name+'<i class="text-dark">('+data.rank+')</i>');
                    $("#pos").show('slow');
                }
            }
        })

    } 
</script>