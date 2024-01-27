
	
	<!-- ============================================================== -->
	<!-- Start adi_future Breatcome Area -->
	<!-- ============================================================== -->
	<div class="breatcome_area d-flex align-items-center" style="height:300px; background:url(<?php echo base_url()?>theme_assets/images/slider/slider-10.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breatcome_title">
						<div class="breatcome_title_inner pb-2">
							<h2>Contact Us </h2>
						</div>
						<div class="breatcome_content">
							<ul>
								<li><a href="<?php echo base_url();?>">Home</a>  <i class="fa fa-angle-right"></i> <span>Contact Us</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End adi_future Breatcome Area -->
	<!-- ============================================================== -->
	
	<div class="contact_address_area pt-80 pb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title text_center mb-55">
						<div class="section_sub_title uppercase mb-3">
							<h6>CONTACT US</h6>
						</div>
						<div class="section_main_title">
							<h1>We Are Here For You</h1>
						</div>
						<div class="em_bar">
							<div class="em_bar_bg"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="single_contact_address text_center mb-30">
						<div class="contact_address_icon pb-3">
							<i class="fa fa-map-o"></i>
						</div>
						<div class="contact_address_title pb-2">
							<h4>Address</h4>
						</div>
						<div class="contact_address_text">
							<p><?php echo config_item('company_address')?></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="single_contact_address text_center mb-30">
						<div class="contact_address_icon pb-3">
							<i class="fa fa-phone"></i>
						</div>
						<div class="contact_address_title pb-2">
							<h4>Call Us</h4><br>
						</div>
						<div class="contact_address_text">
							<a href="tel:<?php echo config_item('mobile')?>">
								<p>+91-<?php echo config_item('mobile')?></p>
							</a>
						</div><br>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="single_contact_address text_center mb-30">
						<div class="contact_address_icon pb-3">
							<i class="fa fa-envelope"></i>
						</div>
						<div class="contact_address_title pb-2">
							<h4>Mail Us</h4>
						</div><br>
						<div class="contact_address_text">
							<a href="mail:<?php echo config_item('info_email')?>">
								<p><?php echo config_item('support_email')?></p>

							</a>
						</div><br>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<!--==================================================-->
	<!----- Start adi_future Contact Area ----->
	<!--==================================================-->
	<div class="main_contact_area pt-80 bg_color2 pb-90">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title text_center mb-55">
						<div class="section_sub_title uppercase mb-3">
							<h6>CONTACT US</h6>
						</div>
						<div class="section_main_title">
							<h1> Contact Us Now</h1>
						
						</div>
						<div class="em_bar">
							<div class="em_bar_bg"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<div class="contact_from">
						<form action="<?php echo base_url()?>Site/mail_us" method="post">
						
							<div class="row">
								<div class="col-lg-6">
									<div class="form_box mb-30">
										<input type="text" name="name"  placeholder="Name" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form_box mb-30">
										<input type="email" name="email" placeholder="Email Address" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form_box mb-30">
										<input type="text" name="mobile" placeholder="Phone Number" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form_box mb-30">
										<input type="text" name="address" placeholder="Address" required>
									</div>
								</div>
								
								<div class="col-lg-12">
									<div class="form_box mb-30">
										<textarea name="message" id="message" cols="30" rows="10" placeholder="Write a Message" required></textarea>
									</div>
									<div class="quote_btn text_center">
										<button class="btn" type="submit" name="submit">Send Message</button>
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
	<!--==================================================-->
	<!----- End adi_future Contact Area ----->
	<!--==================================================-->
	
	<!--==================================================-->
	<!----- End adi_future Map Area ----->
	<!--==================================================-->
	<div class="google_map_area container">
		<div class="row-fluid">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="google_map_area">
				<iframe src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d876.6423510663305!2d77.31011099584019!3d28.492511614360666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2s!5e0!3m2!1sen!2sin!4v1702557204714!5m2!1sen!2sin" width="100%" height="500px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>				
		</div>
	</div>
	<!--==================================================-->
	<!----- End adi_future Map Area ----->
	<!--==================================================-->
