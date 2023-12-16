
<div class="main_contact_area pt-80 bg_color2 pb-90">
	<div class="container" style="background-color:rgb(177,177,177,0.3); width:400px!important; height:auto; margin:auto; padding:44px;border-radius:8px;">
		<div class="row" style="width:400px!important; height:auto; margin:auto;">
			<div class="col-lg-12" style="margin-left:-56px">
				<div class="section_title text_center mb-55">

					<div class="section_main_title">
						<h1 style="color:#0c5adb;"><span style="color:#0c5adb;">Login</span> </h1>

					</div>
					<div class="em_bar">
						<div class="em_bar_bg"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="">
			<div class="col-xl-12">
				<div class="contact_from">
					<form action="<?php echo base_url()?>Site/login" method="post">

						<div class="row">

							<div class="col-lg-12">
								<div class="form_box">
									<label for="user" class="control-label">ID / Username</label>
									<input type="text" required class="form-control" id="user" name="username">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form_box ">
									<label for="password" class="control-label">Password*</label>
									<input type="password" required class="form-control" id="password" name="password">
								</div>
							</div>
							<div class="">
								<p style="padding-left:18px;">Create a new account. <span style="padding-left:64px;"><a href="<?php echo base_url()?>Site/register">Sign Up</a></span></p>
							</div>

							<div class="col-lg-12">

								<div class="quote_btn text_center">
									<button class="btn" type="submit" name="submit">Login</button>
								</div>
							</div>
						</div>
					</form>
					<div id="status"></div>
				</div>
			</div>
		</div>
	</div>
</div>