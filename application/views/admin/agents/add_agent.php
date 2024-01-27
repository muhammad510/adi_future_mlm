<div class="row">
    <div class="col-md-12">
        <div id="load" style="display:none !important;" align="center">
            <img src="<?php echo site_url('uploads/load.gif') ?>">
            <h3 style="color:lightseagreen">Registering...</h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <hr>
        <form id="form" action="<?php echo base_url()?>Agent/add_agent" method="post">
            <div class="row">

                <div class=" col-sm-6">
                    <div class="form-group">
                        <label for="name" class="control-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<?php echo set_value('name')?>" placeholder="Agent name">
                    </div>
                </div>

                <div class=" col-sm-6">
                    <div class="form-group">
                        <label for="phone" class="control-label">Phone*</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="<?php echo set_value('phone')?>" placeholder="phone number">
                    </div>
                </div>

                <div class=" col-sm-6">
                    <div class="form-group">
                        <label for="email" class="control-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<?php echo set_value('email')?>" placeholder="Enter Email">
                    </div>
                </div>
                <div class=" col-sm-6">
                    <div class="form-group">
                        <label for="address_1" class="control-label">Address</label>
                        <input type="text" class="form-control" id="address_1" name="address_1" value="<?php echo set_value('address_1')?>" placeholder="Enter Address 1">
                    </div>
                </div>
                <div class=" col-sm-12">
                    <button type="submit" class="btn btn-primary" onclick="show()" style="float:right">Submit</button>

                </div>



            </div>
        </form>
    </div>
</div>


<script>
      function show() {
        $('#form').hide('slow');
        $('#load').show('slow');
    }
</script>