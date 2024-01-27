<div class="main_contact_area pt-80 bg_color2 pb-90">
	<div class="container" style="background-color:rgb(177,177,177,0.3); width:400px!important; height:auto; margin:auto; padding:44px;border-radius:8px;">
		<div class="row" style="width:400px!important; height:auto; margin:auto;">
			<div class="col-lg-12" style="margin-left:-56px">
				<div class="section_title text_center mb-55">

					<div class="section_main_title">
						<h3 style="color:#0c5adb;"><span style="color:#0c5adb;">Password Recovery</span> </h3>

					</div>
					<div class="em_bar">
						<div class="em_bar_bg"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="">
			<div class="col-xl-12">
				<div id="password_recovery_form">
					<form id="password_recovery" method="post">

						<div class="row">

							<div class="col-lg-12">
								<div class="form_box">
									<label for="mobile" class="control-label">Enter Mobile Number<i class="text-danger">*</i></label>
									<input type="text" required class="form-control" id="mobile" name="mobile">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form_box ">
									<label for="email" class="control-label">Enter Email Address</label>
									<input type="email"  class="form-control" id="password" name="email" required>
								</div>
							</div>


							<div class="col-lg-12 py-3">

								<div class="quote_btn text_center">
									<button class="btn" type="submit" id="submit" name="submit" >Submit</button>
								</div>
							</div>

						</div>
					</form>

					
				</div>
				<div id="status"></div>
				<div>
						<!-- <p style="padding-left:18px;"><a href="<?php echo base_url() ?>/site/forget_password">Forgot password</a> <span style="padding-left:64px;"><a href="<?php echo base_url() ?>Site/register">Sign Up</a></span></p> -->

						<!-- <span style="float: left;"><a href="<?php echo base_url() ?>site/forget_password">Forgot password</a></span> -->
						<span style="float: right;"> <a href="<?php echo base_url() ?>Site/login">Login</a></span>
					</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>

$(document).on('submit', '#password_recovery', function(e) {
    e.preventDefault();

    $.ajax({
        type: 'post',
        url: '<?php echo base_url()?>site/recovery_pass',
        data: new FormData(this),
        contentType: false,
        processData: false,
		dataType:'json',
        beforeSend: function() {
            $('#submit').val('submitting ............');

        },  // Add a comma here
        success: function(data) {
			if(data.icon=='success')
			{
				$('#password_recovery_form').hide();
				$('#status').html('<p class="text-success text-center">'+data.text+'</p>');

			}
			else{

				$('#password_recovery_form').hide();
				$('#status').html('<p class="text-danger text-center">'+data.text+'</p>');

			}
            
        }
    });
});

</script>