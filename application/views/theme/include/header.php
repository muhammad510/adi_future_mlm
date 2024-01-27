	<!--==================================================-->
	<!-- Start	Adi Future Header Top Menu Area Css -->
	<!--==================================================-->
	<div class="header_top_menu pt-2 pb-2 bg_color">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-sm-8">
					<div class="header_top_menu_address">
						<div class="header_top_menu_address_inner">
							<ul>
								<li><a href="mailto:<?php echo config_item('info_email')?>"><i class="fa fa-envelope-o"></i><?php echo config_item('info_email')?></a></li>

								<li><a href="tel:<?php echo config_item('mobile')?>"><i class="fa fa-phone"></i><?php echo config_item('mobile')?></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-4">
					<div class="header_top_menu_icon">
						<div class="header_top_menu_icon_inner">
							<ul>
								<li><a href="<?php echo config_item('facebook')?>" target="_blank"><i class="fa fa-facebook"></i></a></li>
								<li><a href="<?php echo config_item('twitter')?>" target="_blank"><i class="fa fa-twitter"></i></a></li>
								<li><a href="<?php echo config_item('pinterest')?>" target="_blank"><i class="fa fa-pinterest"></i></a></li>
								<li><a href="<?php echo config_item('linkedin')?>" target="_blank"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="<?php echo config_item('instagram')?>" target="_blank"><i class="fa fa-instagram"></i></a></li>
								<li><a href="<?php echo config_item('youtube')?>" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--==================================================-->
	<!-- End	Adi Future Header Top Menu Area Css -->
	<!--===================================================-->

	<!--==================================================-->
	<!-- Start Adi Future Main Menu Area -->
	<!--==================================================-->
	<div id="sticky-header" style="background: #add5f9;" class="Adi Future_nav_manu d-md-none d-lg-block d-sm-none d-none">
		<div class="container">
			<div class="row align-items-center">
				<div class="menu">
					<a href="<?php echo base_url() ?>" class="logo"><img class="down" src="<?php echo base_url() ?>uploads/logo.png" alt="" style="height:36px;width:156px;"> <img class="main_sticky" src="<?php echo base_url() ?>uploads/logo.png" style="height:36px;width:156px;" alt=""></a>
					<ul class="clearfix">
						<li><a href="<?php echo base_url() ?>site/index">Home</a></li>
						<li><a href="<?php echo base_url() ?>site/about">About Us</a></li>
						<li><a href="javaScript:void(0);">Gallery</a>
							<ul>
								<li><a href="<?php echo base_url() ?>site/documents">Documents</a></li>
								<li><a href="<?php echo base_url() ?>site/business_plan">Business Plan</a></li>
								<li><a href="<?php echo base_url() ?>site/event"> Event</a></li>
							</ul>
						</li>
						<li><a href="<?php echo base_url() ?>site/agent">Agent</a></li>
						<li><a href="<?php echo base_url() ?>site/contact">Contact us</a></li>
						<li>
							<a href="<?php echo base_url() ?>Site/register">Join Us</a>
						</li>
						<div class="donate-btn-header">
							<a class="dtbtn" href="<?php echo base_url() ?>site/login">Login</a>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</div>



	<!-- Adi Future Mobile Menu Area -->
	<div class="mobile-menu-area d-sm-block d-md-block d-lg-none">
		<div class="mobile-menu">
			<nav class="Adi Future_menu">
				<ul class="clearfix">
					<li><a href="<?php echo base_url() ?>site/index">Home</a></li>
					<li><a href="<?php echo base_url() ?>site/about">About Us</a></li>
					<li><a href="javaScript:void(0);">Gallery</a>
						<ul>
							<li><a href="<?php echo base_url() ?>site/business_plan">Business Plan</a></li>
							<li><a href="<?php echo base_url() ?>site/event"> Event</a></li>
						</ul>
					</li>
					<li><a href="javaScript:void(0);">Agent</a></li>
					<li><a href="<?php echo base_url() ?>site/contact">Contact us</a></li>
					<li>
						<a href="<?php echo base_url() ?>Site/register">Join Us</a>
					</li>
					<li>
						<a class="dtbtn" href="<?php echo base_url() ?>site/login">Login</a>
					</li>
			</nav>
		</div>
	</div>
	<!--==================================================-->
	<!-- End Adi Future Main Menu Area -->
	<!--==================================================-->