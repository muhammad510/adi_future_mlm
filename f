[1mdiff --git a/1/ci_sessionqnsr6n4cot1o974s7d1c9ggp7aqb8frp b/1/ci_sessionqnsr6n4cot1o974s7d1c9ggp7aqb8frp[m
[1mdeleted file mode 100644[m
[1mindex d2b9cde..0000000[m
[1m--- a/1/ci_sessionqnsr6n4cot1o974s7d1c9ggp7aqb8frp[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-__ci_last_regenerate|i:1702356943;gehfgejh|b:1;[m
\ No newline at end of file[m
[1mdiff --git a/application/controllers/Agent.php b/application/controllers/Agent.php[m
[1mindex 775523b..70bb402 100644[m
[1m--- a/application/controllers/Agent.php[m
[1m+++ b/application/controllers/Agent.php[m
[36m@@ -57,8 +57,7 @@[m [mclass Agent extends CI_Controller[m
 [m
         $this->db->select('id, name, phone, sponsor, topup, join_time, total_a, total_b, total_c, total_d, total_e,rank')[m
                  ->from('member')->where('rank','Agent');[m
[31m-[m
[31m-        $this->db->limit($config['per_page'], $page)->ORDER_BY('secret','DESC'); [m
[32m+[m[32m        $this->db->limit($config['per_page'], $page)->ORDER_BY('secret','DESC');[m
 [m
         $data['members'] = $this->db->get()->result_array();[m
 [m
[1mdiff --git a/application/controllers/Site.php b/application/controllers/Site.php[m
[1mindex cac0227..090cfb6 100644[m
[1m--- a/application/controllers/Site.php[m
[1m+++ b/application/controllers/Site.php[m
[36m@@ -358,12 +358,21 @@[m [mclass Site extends CI_Controller[m
             if ($sponsor == 1001 || $sps['rank'] == 'Agent') {[m
 [m
                 $rank = ($sps['id'] == 1001) ? 'Agent' : "sub_agent";[m
[32m+[m[32m                if($rank=="Agent")[m
[32m+[m[32m                {[m
[32m+[m[32m                    $prefix='ADIFA';[m[41m [m
[32m+[m[32m                }[m
[32m+[m[32m                else{[m
[32m+[m[32m                    $prefix='ADIFS';[m[41m [m
[32m+[m
[32m+[m[32m                }[m
 [m
                 $data = array([m
                     'id' => $id,[m
                     'name' => $name,[m
                     'email' => $email,[m
                     'phone' => $phone,[m
[32m+[m[32m                    'prefix'=>$prefix,[m
                     'username' => $username,[m
                     'password' => $password,[m
                     'show_password' => $this->input->post('password'),[m
[36m@@ -405,6 +414,7 @@[m [mclass Site extends CI_Controller[m
                 $data = array([m
                     'id' => $id,[m
                     'name' => $name,[m
[32m+[m[32m                    'prefix'=>"ADIFM",[m
                     'email' => $email,[m
                     'phone' => $phone,[m
                     'username' => $username,[m
[36m@@ -566,7 +576,7 @@[m [mclass Site extends CI_Controller[m
             # important Data with session.[m
             #[m
             ##########################################################################[m
[31m-            $md=$this->db->select('rank')->where('id',$user_id)->from('member')->get()->row();[m
[32m+[m[32m            $md=$this->db->select('rank,prefix')->where('id',$user_id)->from('member')->get()->row();[m
 [m
             $this->session->set_userdata('_user_id_', $user_id);[m
             $this->session->set_userdata('_user_id_', $user_id);[m
[36m@@ -582,6 +592,7 @@[m [mclass Site extends CI_Controller[m
             $this->session->set_userdata('_product_', $product);[m
             $this->session->set_userdata('_price_', $prod_price);[m
             $this->session->set_userdata('_rank_', $md->rank);[m
[32m+[m[32m            $this->session->set_userdata('_prefix_', $md->prefix);[m
             if ($divert_pg == TRUE) :[m
                 redirect(site_url('gateway/registration_form'));[m
             else :[m
[36m@@ -758,12 +769,14 @@[m [mclass Site extends CI_Controller[m
         $this->form_validation->set_rules('username', 'Username', 'trim|required');[m
         $this->form_validation->set_rules('password', 'Password', 'trim|required');[m
         if ($this->form_validation->run() == FALSE) {[m
[32m+[m
[32m+[m[32m            $layout['title'] = "Login";[m
             $layout['layout'] = "login.php";[m
             $this->load->view('theme/default/base', $layout);[m
         } else {[m
             $user = $this->common_model->filter($this->input->post('username'));[m
             $password = $this->input->post('password');[m
[31m-            $data = $this->db_model->select_multi("id, name, password, email, last_login_ip, last_login, status", 'member', array('id' => $user));[m
[32m+[m[32m            $data = $this->db_model->select_multi("id, name,prefix,password, email, last_login_ip, last_login, status", 'member', array('id' => $user));[m
 [m
             if ($data->status !== "Active") {[m
                 $this->session->set_flashdata('site_flash', '<div class="alert alert-danger">Login is invalid or Your account is not active. Account status is: ' . ($data->status ? $data->status : 'N/A') . '.</div>');[m
[36m@@ -777,6 +790,7 @@[m [mclass Site extends CI_Controller[m
                     'user_id' => $data->id,[m
                     'email' => $data->email,[m
                     'name' => $data->name,[m
[32m+[m[32m                    'prefix' => $data->prefix,[m
                     'ip' => $data->last_login_ip,[m
                     'last_login' => $data->last_login,[m
                     'session' => $session,[m
[1mdiff --git a/application/views/admin/base.php b/application/views/admin/base.php[m
[1mindex 5530933..5e0d819 100644[m
[1m--- a/application/views/admin/base.php[m
[1m+++ b/application/views/admin/base.php[m
[36m@@ -20,7 +20,7 @@[m [mif ($this->login->check_session() == FALSE) {[m
     <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/css/bootstrap2/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />[m
     <link href="<?php echo base_url('axxets/admin/theme.css') ?>" rel="stylesheet" id="rt_style_components" type="text/css" />[m
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/eggplant/jquery-ui.css">[m
[31m-    <link rel="shortcut icon" href="<?php echo base_url('uploads/favicon.ico') ?>" />[m
[32m+[m[32m    <link rel="shortcut icon" href="<?php echo base_url('uploads/favicon.png') ?>" />[m
 [m
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>[m
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>[m
[1mdiff --git a/application/views/admin/member/list_member.php b/application/views/admin/member/list_member.php[m
[1mindex ccbe92a..dc62b3d 100644[m
[1m--- a/application/views/admin/member/list_member.php[m
[1m+++ b/application/views/admin/member/list_member.php[m
[36m@@ -33,9 +33,9 @@[m
             foreach ($members as $e) { ?>[m
                 <tr>[m
                     <td><?php echo $sn++; ?></td>[m
[31m-                    <td><a href="<?php echo site_url('users/user_detail/' . $e['id']) ?>" target="_blank"><?php echo config_item('ID_EXT') . $e['id']; ?></a></td>[m
[32m+[m[32m                    <td><a href="<?php echo site_url('users/user_detail/' . $e['id']) ?>" target="_blank"><?php echo $e['prefix']. $e['id']; ?></a></td>[m
                     <td><?php echo $e['name']; ?></td>[m
[31m-                    <td><a href="<?php echo site_url('users/user_detail/' . $e['sponsor']) ?>" target="_blank"><?php echo $e['sponsor'] ? config_item('ID_EXT') . $e['sponsor'] : ''; ?></td>[m
[32m+[m[32m                    <td><a href="<?php echo site_url('users/user_detail/' . $e['sponsor']) ?>" target="_blank"><?php echo $e['sponsor'] ?  $e['prefix'] . $e['sponsor'] : ''; ?></td>[m
                     <td><?php echo '₹ ' . number_format($this->db_model->select('balance', 'wallet', array('userid' => $e['id'])), 2); ?></td>[m
                     <td><?php echo $e['phone']; ?></td>[m
                     <?php if (config_item('enable_investment') == "Yes") {[m
[1mdiff --git a/application/views/admin/member/view_detail.php b/application/views/admin/member/view_detail.php[m
[1mindex 6ef7cdd..0f5bb19 100644[m
[1m--- a/application/views/admin/member/view_detail.php[m
[1m+++ b/application/views/admin/member/view_detail.php[m
[36m@@ -14,12 +14,12 @@[m
 </div>[m
 <div class="row view">[m
     <div class="col-sm-6"><strong>Member Name: </strong> <?php echo $data->name ?></div>[m
[31m-    <div class="col-sm-6"><strong>Member ID: </strong> <?php echo config_item('ID_EXT') . $data->id ?>[m
[32m+[m[32m    <div class="col-sm-6"><strong>Member ID: </strong> <?php echo  $data->prefix . $data->id ?>[m
     </div>[m
     <div class="col-sm-6"><strong>Email ID: </strong> <?php echo $data->email ?></div>[m
     <div class="col-sm-6"><strong>Phone No: </strong> <?php echo $data->phone ?></div>[m
[31m-    <div class="col-sm-6"><strong>Sponsor ID: </strong> <?php echo config_item('ID_EXT') . $data->sponsor ?></div>[m
[31m-    <div class="col-sm-6"><strong>Position ID: </strong> <?php echo config_item('ID_EXT') . $data->position ?></div>[m
[32m+[m[32m    <div class="col-sm-6"><strong>Sponsor ID: </strong> <?php echo  $data->sponsor ?></div>[m
[32m+[m[32m    <div class="col-sm-6"><strong>Position ID: </strong> <?php echo  $data->position ?></div>[m
 </div>[m
 <p class="hr_divider">&nbsp;</p>[m
 <div class="row view">[m
[1mdiff --git a/application/views/member/base.php b/application/views/member/base.php[m
[1mindex 0335875..7eec77d 100644[m
[1m--- a/application/views/member/base.php[m
[1m+++ b/application/views/member/base.php[m
[36m@@ -15,13 +15,15 @@[m
     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" type="text/css">[m
     <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css" type="text/css">[m
     <!-- favicon -->[m
[31m-    <link rel="shortcut icon" href="<?php echo base_url('uploads/favicon.ico') ?>" />[m
[32m+[m[32m    <link rel="shortcut icon" href="<?php echo base_url('uploads/favicon.png') ?>" />[m
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>[m
     <link rel="stylesheet" href="<?php echo base_url() ?>axxets/select2/select2.min.css">[m
 [m
     <?php $tax_percent = config_item('payout_tax') + config_item('payout_admin_tax'); ?>[m
 </head>[m
 [m
[32m+[m
[32m+[m
 <body>[m
 [m
     <div id="ui" class="ui">[m
[36m@@ -47,14 +49,14 @@[m
                         </a>[m
                     </li>[m
                     <li>[m
[31m-                        <a style="padding-left:120px !important;" href="<?php echo base_url('member') ?>">Welcome, <?php echo $this->session->name ?>(<?php echo config_item('IT_EXT') . $this->session->user_id ?>)</a>[m
[32m+[m[32m                        <a style="padding-left:120px !important;" href="<?php echo base_url('member') ?>">Welcome, <?php echo $this->session->name ?>(<?php echo $this->session->prefix . $this->session->user_id ?>)</a>[m
                     </li>[m
                     <li>[m
[31m-    <?php  $member_rank = $this->db->select('signup_package,re_topup')->where('id',$this->session->user_id)->get('member')->row();  ?>[m
[32m+[m[32m                        <?php $member_rank = $this->db->select('signup_package,re_topup,rank')->where('id', $this->session->user_id)->get('member')->row();  ?>[m
 [m
[31m-                        <?php if($member_rank->signup_package!=0 && $member_rank->re_topup==0 ):?>[m
[31m-                            <a class="text-danger " style="  background-color:yellow !important; text-align:center !important;">Re-topup  For Next Level</a>[m
[31m-                            <?php endif;?>[m
[32m+[m[32m                        <?php if ($member_rank->signup_package != 0 && $member_rank->re_topup == 0) : ?>[m
[32m+[m[32m                            <a class="text-danger " style="  background-color:yellow !important; text-align:center !important;">Re-topup For Next Level</a>[m
[32m+[m[32m                        <?php endif; ?>[m
                     </li>[m
 [m
                 </ul>[m
[36m@@ -103,183 +105,529 @@[m
         </header>[m
         <!--header end-->[m
 [m
[31m-        <!--sidebar start-->[m
[32m+[m[32m        <!--#####################sidebar start########################################-->[m
         <aside id="aside" class="ui-aside">[m
             <ul class="nav" ui-nav>[m
                 <li class="active">[m
                     <a href="<?php echo base_url('member') ?>">Hi, <?php echo $this->session->name ?><br />([m
                         My ID[m
[31m-                        : <?php echo config_item('IT_EXT') . $this->session->user_id ?>)[m
[32m+[m[32m                        : <?php echo $this->session->prefix . $this->session->user_id ?>)[m
                     </a>[m
                 </li>[m
[31m-                <li>[m
[31m-                    <a href="<?php echo site_url('member') ?>"><i class="fa fa-home"></i><span>Dashboard</span></a>[m
[31m-                </li>[m
[31m-                <li>[m
[31m-                    <a href="<?php echo site_url('member/welcome-letter') ?>"><i class="fa fa-file-text-o"></i><span> Welcome Letter</span></a>[m
[31m-                </li>[m
[31m-                <li>[m
[31m-                    <a href="<?php echo site_url('member/business') ?>"><i class="fa fa-file-text-o"></i><span> Business Plan</span></a>[m
[31m-                </li>[m
[31m-                <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[31m-                    <!-- <li>[m
[32m+[m
[32m+[m[32m                <?php if ($member_rank->rank == "Agent") : ?>[m
[32m+[m[32m                    <!-- ################### agent section start ###############################-->[m
[32m+[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member') ?>"><i class="fa fa-home"></i><span>Dashboard</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/welcome-letter') ?>"><i class="fa fa-file-text-o"></i><span> Welcome Letter</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/business') ?>"><i class="fa fa-file-text-o"></i><span> Business Plan</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <!-- <li>[m
                         <a href="<?php echo site_url('member/my-invoices') ?>"><i class="fa fa-print"></i><span> My Invoices</span></a>[m
                     </li> -->[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_epin') == "Yes") { ?>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_epin') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>My e-PINs</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/unused-epin') ?>"><span>Un-Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/used-epin') ?>"><span>Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/transfer-epin') ?>"><span>Transfer e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/generate-epin') ?>"><span>Generate e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('member/requestfor-epin') ?>"><i class="fa fa-key"></i><span>Request for e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_topup') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>Upgrade</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_member') ?>"><span>Topup Member</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_list') ?>"><span>Topup List</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-money"></i><span>My Earnings</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/view-earning') ?>"><span>My Earnings</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/search-earning') ?>"><span>Search Earnings</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('enable_reward') == "Yes") { ?>[m
[32m+[m[32m                                    <li><a href="<?php echo site_url('member/my-rewards') ?>"><span>My Rewards</span></a></li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('wallet/transfer-balance') ?>"><span>Transfer Fund</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('user_withdraw') == "Yes") { ?>[m
[32m+[m[32m                                    <li>[m
[32m+[m[32m                                        <a href="<?php echo site_url('wallet/withdraw-payouts') ?>"><span>Withdraw Payouts</span></a>[m
[32m+[m[32m                                    </li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/withdrawal-list') ?>"><span>Payout Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/balance-transfer-list') ?>"><span>Balance Transfer Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
                     <li>[m
[31m-                        <a href="#"><i class="fa fa-xing-square"></i><span>My e-PINs</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class="fa fa-sitemap"></i><span>Tree & Downline</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('member/unused-epin') ?>"><span>Un-Used e-PINs</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('member/used-epin') ?>"><span>Used e-PINs</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('member/transfer-epin') ?>"><span>Transfer e-PIN</span></a>[m
[31m-                            </li>[m
[31m-                            <li><a href="<?php echo site_url('member/generate-epin') ?>"><span>Generate e-PIN</span></a>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/genealogy') ?>"><span>My Genealogy</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/my-tree') ?>"><span>My Downline Tree</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/alldownline') ?>"><span>All Downline List</span></a>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/directlist') ?>"><span>Direct Referrer List</span></a>[m
                             </li>[m
                             <li>[m
[31m-                        <a href="<?php echo site_url('member/requestfor-epin') ?>"><i class="fa fa-key"></i><span>Request for e-PIN</span></a>[m
[31m-                    </li>[m
[32m+[m[32m                                <a target="_blank" href="<?php echo site_url('site/register/A/' . $this->session->user_id) ?>"><span>Add Member</span></a>[m
[32m+[m[32m                            </li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_topup') == "Yes") { ?>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-gift"></i><span>My Donations</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/sent-donation') ?>"><span>Sent History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/received-donation') ?>"><span>Received History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_repurchase') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-shopping-cart"></i><span>My Purchases</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/new-purchase') ?>"><span>New Purchase</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/old-purchase') ?>"><span>Old Purchases</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/pre-checkout') ?>"><span>My Cart</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_recharge') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-mobile-phone"></i><span>Recharge Zone</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/new-recharge') ?>"><span>New Recharge</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/old-recharges') ?>"><span>Old Recharges</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m
[32m+[m[32m                    <?php if (config_item('enable_coupon') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-code"></i><span>My Coupons</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/unused') ?>"><span>Un Used Coupons</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/used') ?>"><span>Used Coupons</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_ad_incm') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bullhorn"></i><span>Advertisements</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('ads/myads') ?>"><span>My Ads</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_investment') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bitcoin"></i><span>My Investments</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('investments/new_invest') ?>"><span>New Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/recent_investment') ?>"><span>Recent Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/expired_investment') ?>"><span>Expired Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_survey') == "Yes") { ?>[m
[32m+[m
[32m+[m[32m                        <li><a href="<?php echo site_url('survey/mysurveys') ?>"><i class="fa fa-list"></i>[m
[32m+[m[32m                                <span>My Surveys</span></a>[m
[32m+[m[32m                        </li>[m
[32m+[m
[32m+[m[32m                    <?php } ?>[m
                     <li>[m
[31m-                        <a href="#"><i class="fa fa-xing-square"></i><span>Upgrade</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class="fa fa-question"></i><span>My Support</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('member/topup_member') ?>"><span>Topup Member</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('member/topup_list') ?>"><span>Topup List</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/new-ticket') ?>"><span>New Support Request</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/old-Supports') ?>"><span>List Tickets</span></a></li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-money"></i><span>My Earnings</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class=" fa fa-cog" aria-hidden="true"></i><span>My Profile & Setting</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('member/view-earning') ?>"><span>My Earnings</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('member/search-earning') ?>"><span>Search Earnings</span></a>[m
[31m-                            </li>[m
[31m-                            <?php if (config_item('enable_reward') == "Yes") { ?>[m
[31m-                                <li><a href="<?php echo site_url('member/my-rewards') ?>"><span>My Rewards</span></a></li>[m
[31m-                            <?php } ?>[m
[31m-                            <li><a href="<?php echo site_url('wallet/transfer-balance') ?>"><span>Transfer Fund</span></a>[m
[31m-                            </li>[m
[31m-                            <?php if (config_item('user_withdraw') == "Yes") { ?>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/proile') ?>"><span>My Profile</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/settings') ?>"><span>Setting & Password</span></a></li>[m
[32m+[m[32m                        </ul>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li><a href="<?php echo site_url('member/logout') ?>"><i class="fa fa-sign-out"></i> Log Out</a></li>[m
[32m+[m[32m                    </li>[m
[32m+[m
[32m+[m[32m                    <!-- ########################################agent panel End ######################################-->[m
[32m+[m[32m                    <!-- ######################################## Sub agent panel start ######################################-->[m
[32m+[m[32m                <?php elseif ($member_rank->rank == "sub_agent") : ?>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member') ?>"><i class="fa fa-home"></i><span>Dashboard</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/welcome-letter') ?>"><i class="fa fa-file-text-o"></i><span> Welcome Letter</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/business') ?>"><i class="fa fa-file-text-o"></i><span> Business Plan</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <!-- <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/my-invoices') ?>"><i class="fa fa-print"></i><span> My Invoices</span></a>[m
[32m+[m[32m                    </li> -->[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_epin') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>My e-PINs</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/unused-epin') ?>"><span>Un-Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/used-epin') ?>"><span>Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/transfer-epin') ?>"><span>Transfer e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/generate-epin') ?>"><span>Generate e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
                                 <li>[m
[31m-                                    <a href="<?php echo site_url('wallet/withdraw-payouts') ?>"><span>Withdraw Payouts</span></a>[m
[32m+[m[32m                                    <a href="<?php echo site_url('member/requestfor-epin') ?>"><i class="fa fa-key"></i><span>Request for e-PIN</span></a>[m
                                 </li>[m
[31m-                            <?php } ?>[m
[31m-                            <li>[m
[31m-                                <a href="<?php echo site_url('wallet/withdrawal-list') ?>"><span>Payout Report</span></a>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_topup') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>Upgrade</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_member') ?>"><span>Topup Member</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_list') ?>"><span>Topup List</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-money"></i><span>My Earnings</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/view-earning') ?>"><span>My Earnings</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/search-earning') ?>"><span>Search Earnings</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('enable_reward') == "Yes") { ?>[m
[32m+[m[32m                                    <li><a href="<?php echo site_url('member/my-rewards') ?>"><span>My Rewards</span></a></li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('wallet/transfer-balance') ?>"><span>Transfer Fund</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('user_withdraw') == "Yes") { ?>[m
[32m+[m[32m                                    <li>[m
[32m+[m[32m                                        <a href="<?php echo site_url('wallet/withdraw-payouts') ?>"><span>Withdraw Payouts</span></a>[m
[32m+[m[32m                                    </li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/withdrawal-list') ?>"><span>Payout Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/balance-transfer-list') ?>"><span>Balance Transfer Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href=""><i class="fa fa-sitemap"></i><span>Tree & Downline</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <ul class="nav nav-sub">[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/genealogy') ?>"><span>My Genealogy</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/my-tree') ?>"><span>My Downline Tree</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/alldownline') ?>"><span>All Downline List</span></a>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/directlist') ?>"><span>Direct Referrer List</span></a>[m
                             </li>[m
                             <li>[m
[31m-                                <a href="<?php echo site_url('wallet/balance-transfer-list') ?>"><span>Balance Transfer Report</span></a>[m
[32m+[m[32m                                <a target="_blank" href="<?php echo site_url('site/register/A/' . $this->session->user_id) ?>"><span>Add Member</span></a>[m
                             </li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <li>[m
[31m-                    <a href=""><i class="fa fa-sitemap"></i><span>Tree & Downline</span><i class="fa fa-angle-right pull-right"></i></a>[m
[31m-                    <ul class="nav nav-sub">[m
[31m-                        <li><a href="<?php echo site_url('tree/genealogy') ?>"><span>My Genealogy</span></a></li>[m
[31m-                        <li><a href="<?php echo site_url('tree/my-tree') ?>"><span>My Downline Tree</span></a></li>[m
[31m-                        <li><a href="<?php echo site_url('tree/alldownline') ?>"><span>All Downline List</span></a>[m
[31m-                        <li><a href="<?php echo site_url('tree/directlist') ?>"><span>Direct Referrer List</span></a>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-gift"></i><span>My Donations</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/sent-donation') ?>"><span>Sent History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/received-donation') ?>"><span>Received History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
                         </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_repurchase') == "Yes") { ?>[m
                         <li>[m
[31m-                            <a target="_blank" href="<?php echo site_url('site/register/A/' . $this->session->user_id) ?>"><span>Add Member</span></a>[m
[32m+[m[32m                            <a href=""><i class="fa fa-shopping-cart"></i><span>My Purchases</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/new-purchase') ?>"><span>New Purchase</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/old-purchase') ?>"><span>Old Purchases</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/pre-checkout') ?>"><span>My Cart</span></a></li>[m
[32m+[m[32m                            </ul>[m
                         </li>[m
[31m-                    </ul>[m
[31m-                </li>[m
[31m-                <?php if (config_item('enable_help_plan') == "Yes") { ?>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_recharge') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-mobile-phone"></i><span>Recharge Zone</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/new-recharge') ?>"><span>New Recharge</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/old-recharges') ?>"><span>Old Recharges</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m
[32m+[m[32m                    <?php if (config_item('enable_coupon') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-code"></i><span>My Coupons</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/unused') ?>"><span>Un Used Coupons</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/used') ?>"><span>Used Coupons</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_ad_incm') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bullhorn"></i><span>Advertisements</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('ads/myads') ?>"><span>My Ads</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_investment') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bitcoin"></i><span>My Investments</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('investments/new_invest') ?>"><span>New Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/recent_investment') ?>"><span>Recent Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/expired_investment') ?>"><span>Expired Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_survey') == "Yes") { ?>[m
[32m+[m
[32m+[m[32m                        <li><a href="<?php echo site_url('survey/mysurveys') ?>"><i class="fa fa-list"></i>[m
[32m+[m[32m                                <span>My Surveys</span></a>[m
[32m+[m[32m                        </li>[m
[32m+[m
[32m+[m[32m                    <?php } ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-gift"></i><span>My Donations</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class="fa fa-question"></i><span>My Support</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('donation/sent-donation') ?>"><span>Sent History</span></a>[m
[31m-                            </li>[m
[31m-                            <li><a href="<?php echo site_url('donation/received-donation') ?>"><span>Received History</span></a>[m
[31m-                            </li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/new-ticket') ?>"><span>New Support Request</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/old-Supports') ?>"><span>List Tickets</span></a></li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_repurchase') == "Yes") { ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-shopping-cart"></i><span>My Purchases</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class=" fa fa-cog" aria-hidden="true"></i><span>My Profile & Setting</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('cart/new-purchase') ?>"><span>New Purchase</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('cart/old-purchase') ?>"><span>Old Purchases</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('cart/pre-checkout') ?>"><span>My Cart</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/proile') ?>"><span>My Profile</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/settings') ?>"><span>Setting & Password</span></a></li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_recharge') == "Yes") { ?>[m
[32m+[m[32m                    <li><a href="<?php echo site_url('member/logout') ?>"><i class="fa fa-sign-out"></i> Log Out</a></li>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <!-- ########################################sub agent panel End ######################################-->[m
[32m+[m
[32m+[m[32m                    <!-- ################################## Member panel Start ###########################-->[m
[32m+[m[32m                <?php else : ?>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member') ?>"><i class="fa fa-home"></i><span>Dashboard</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/welcome-letter') ?>"><i class="fa fa-file-text-o"></i><span> Welcome Letter</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/business') ?>"><i class="fa fa-file-text-o"></i><span> Business Plan</span></a>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <!-- <li>[m
[32m+[m[32m                        <a href="<?php echo site_url('member/my-invoices') ?>"><i class="fa fa-print"></i><span> My Invoices</span></a>[m
[32m+[m[32m                    </li> -->[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_epin') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>My e-PINs</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/unused-epin') ?>"><span>Un-Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/used-epin') ?>"><span>Used e-PINs</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/transfer-epin') ?>"><span>Transfer e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/generate-epin') ?>"><span>Generate e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('member/requestfor-epin') ?>"><i class="fa fa-key"></i><span>Request for e-PIN</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_topup') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href="#"><i class="fa fa-xing-square"></i><span>Upgrade</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_member') ?>"><span>Topup Member</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/topup_list') ?>"><span>Topup List</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') !== "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-money"></i><span>My Earnings</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/view-earning') ?>"><span>My Earnings</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('member/search-earning') ?>"><span>Search Earnings</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('enable_reward') == "Yes") { ?>[m
[32m+[m[32m                                    <li><a href="<?php echo site_url('member/my-rewards') ?>"><span>My Rewards</span></a></li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('wallet/transfer-balance') ?>"><span>Transfer Fund</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <?php if (config_item('user_withdraw') == "Yes") { ?>[m
[32m+[m[32m                                    <li>[m
[32m+[m[32m                                        <a href="<?php echo site_url('wallet/withdraw-payouts') ?>"><span>Withdraw Payouts</span></a>[m
[32m+[m[32m                                    </li>[m
[32m+[m[32m                                <?php } ?>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/withdrawal-list') ?>"><span>Payout Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('wallet/balance-transfer-list') ?>"><span>Balance Transfer Report</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-mobile-phone"></i><span>Recharge Zone</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class="fa fa-sitemap"></i><span>Tree & Downline</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('recharge/new-recharge') ?>"><span>New Recharge</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('recharge/old-recharges') ?>"><span>Old Recharges</span></a>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/genealogy') ?>"><span>My Genealogy</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/my-tree') ?>"><span>My Downline Tree</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/alldownline') ?>"><span>All Downline List</span></a>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('tree/directlist') ?>"><span>Direct Referrer List</span></a>[m
[32m+[m[32m                            </li>[m
[32m+[m[32m                            <li>[m
[32m+[m[32m                                <a target="_blank" href="<?php echo site_url('site/register/A/' . $this->session->user_id) ?>"><span>Add Member</span></a>[m
                             </li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_help_plan') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-gift"></i><span>My Donations</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/sent-donation') ?>"><span>Sent History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('donation/received-donation') ?>"><span>Received History</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_repurchase') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-shopping-cart"></i><span>My Purchases</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/new-purchase') ?>"><span>New Purchase</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/old-purchase') ?>"><span>Old Purchases</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('cart/pre-checkout') ?>"><span>My Cart</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_recharge') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-mobile-phone"></i><span>Recharge Zone</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/new-recharge') ?>"><span>New Recharge</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('recharge/old-recharges') ?>"><span>Old Recharges</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
 [m
[31m-                <?php if (config_item('enable_coupon') == "Yes") { ?>[m
[32m+[m[32m                    <?php if (config_item('enable_coupon') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-code"></i><span>My Coupons</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/unused') ?>"><span>Un Used Coupons</span></a></li>[m
[32m+[m[32m                                <li><a href="<?php echo site_url('coupon/used') ?>"><span>Used Coupons</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_ad_incm') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bullhorn"></i><span>Advertisements</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('ads/myads') ?>"><span>My Ads</span></a></li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_investment') == "Yes") { ?>[m
[32m+[m[32m                        <li>[m
[32m+[m[32m                            <a href=""><i class="fa fa-bitcoin"></i><span>My Investments</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                            <ul class="nav nav-sub">[m
[32m+[m[32m                                <li><a href="<?php echo site_url('investments/new_invest') ?>"><span>New Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/recent_investment') ?>"><span>Recent Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                                <li>[m
[32m+[m[32m                                    <a href="<?php echo site_url('investments/expired_investment') ?>"><span>Expired Investments</span></a>[m
[32m+[m[32m                                </li>[m
[32m+[m[32m                            </ul>[m
[32m+[m[32m                        </li>[m
[32m+[m[32m                    <?php } ?>[m
[32m+[m[32m                    <?php if (config_item('enable_survey') == "Yes") { ?>[m
[32m+[m
[32m+[m[32m                        <li><a href="<?php echo site_url('survey/mysurveys') ?>"><i class="fa fa-list"></i>[m
[32m+[m[32m                                <span>My Surveys</span></a>[m
[32m+[m[32m                        </li>[m
[32m+[m
[32m+[m[32m                    <?php } ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-code"></i><span>My Coupons</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class="fa fa-question"></i><span>My Support</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('coupon/unused') ?>"><span>Un Used Coupons</span></a></li>[m
[31m-                            <li><a href="<?php echo site_url('coupon/used') ?>"><span>Used Coupons</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/new-ticket') ?>"><span>New Support Request</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('ticket/old-Supports') ?>"><span>List Tickets</span></a></li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_ad_incm') == "Yes") { ?>[m
                     <li>[m
[31m-                        <a href=""><i class="fa fa-bullhorn"></i><span>Advertisements</span><i class="fa fa-angle-right pull-right"></i></a>[m
[32m+[m[32m                        <a href=""><i class=" fa fa-cog" aria-hidden="true"></i><span>My Profile & Setting</span><i class="fa fa-angle-right pull-right"></i></a>[m
                         <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('ads/myads') ?>"><span>My Ads</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/proile') ?>"><span>My Profile</span></a></li>[m
[32m+[m[32m                            <li><a href="<?php echo site_url('member/settings') ?>"><span>Setting & Password</span></a></li>[m
                         </ul>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_investment') == "Yes") { ?>[m
[31m-                    <li>[m
[31m-                        <a href=""><i class="fa fa-bitcoin"></i><span>My Investments</span><i class="fa fa-angle-right pull-right"></i></a>[m
[31m-                        <ul class="nav nav-sub">[m
[31m-                            <li><a href="<?php echo site_url('investments/new_invest') ?>"><span>New Investments</span></a>[m
[31m-                            </li>[m
[31m-                            <li>[m
[31m-                                <a href="<?php echo site_url('investments/recent_investment') ?>"><span>Recent Investments</span></a>[m
[31m-                            </li>[m
[31m-                            <li>[m
[31m-                                <a href="<?php echo site_url('investments/expired_investment') ?>"><span>Expired Investments</span></a>[m
[31m-                            </li>[m
[31m-                        </ul>[m
[32m+[m[32m                    <li><a href="<?php echo site_url('member/logout') ?>"><i class="fa fa-sign-out"></i> Log Out</a></li>[m
                     </li>[m
[31m-                <?php } ?>[m
[31m-                <?php if (config_item('enable_survey') == "Yes") { ?>[m
 [m
[31m-                    <li><a href="<?php echo site_url('survey/mysurveys') ?>"><i class="fa fa-list"></i>[m
[31m-                            <span>My Surveys</span></a>[m
[31m-                    </li>[m
[32m+[m[32m                    <!-- ##########################Member panel End ###################################################-->[m
[32m+[m[32m                <?php endif; ?>[m
 [m
[31m-                <?php } ?>[m
[31m-                <li>[m
[31m-                    <a href=""><i class="fa fa-question"></i><span>My Support</span><i class="fa fa-angle-right pull-right"></i></a>[m
[31m-                    <ul class="nav nav-sub">[m
[31m-                        <li><a href="<?php echo site_url('ticket/new-ticket') ?>"><span>New Support Request</span></a></li>[m
[31m-                        <li><a href="<?php echo site_url('ticket/old-Supports') ?>"><span>List Tickets</span></a></li>[m
[31m-                    </ul>[m
[31m-                </li>[m
[31m-                <li>[m
[31m-                    <a href=""><i class=" fa fa-cog" aria-hidden="true"></i><span>My Profile & Setting</span><i class="fa fa-angle-right pull-right"></i></a>[m
[31m-                    <ul class="nav nav-sub">[m
[31m-                        <li><a href="<?php echo site_url('member/proile') ?>"><span>My Profile</span></a></li>[m
[31m-                        <li><a href="<?php echo site_url('member/settings') ?>"><span>Setting & Password</span></a></li>[m
[31m-                    </ul>[m
[31m-                </li>[m
[31m-                <li><a href="<?php echo site_url('member/logout') ?>"><i class="fa fa-sign-out"></i> Log Out</a></li>[m
[31m-                </li>[m
             </ul>[m
         </aside>[m
[31m-        <!--sidebar end-->[m
[32m+[m[32m        <!--##############################sidebar end##########################-->[m
 [m
         <!--main content start-->[m
         <div id="content" class="ui-content ui-content-aside-overlay">[m
[36m@@ -495,6 +843,9 @@[m
                             <?php } else { ?>[m
 [m
                                 <!--task states start-->[m
[32m+[m
[32m+[m
[32m+[m
                                 <div class="col-md-6 col-sm-6">[m
                                     <div class="panel">[m
                                         <header class="panel-heading">[m
[36m@@ -504,125 +855,124 @@[m
                                                 <a class="close-box fa fa-times" href="javascript:;"></a>[m
                                             </span>[m
                                         </header>[m
[31m-                                        <div class="panel-body">[m
[31m-                                            <div class="row w-states">[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-primary btn-block">[m
[31m-                                                        <span class="value">[m
[31m-                                                            <?php echo $detail->total_a + $detail->total_b + $detail->total_c + $detail->total_d + $detail->total_e ?>[m
[31m-                                                        </span>[m
[31m-                                                        <span class="info">Total Downline</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <!--<div class="col-xs-6">-->[m
[31m-                                                <!--    <a href="#" class="btn btn-info btn-block">-->[m
[31m-                                                <!--        <span class="value"><//?php-->[m
[31m-[m
[31m-                                                <!--                            //echo $this->db_model->count_all('member', array('sponsor' => $this->session->user_id));-->[m
[31m-                                                <!--                            ?></span>-->[m
[31m-                                                <!--        <span class="info">Direct Referred</span>-->[m
[31m-                                                <!--    </a>-->[m
[31m-                                                <!--</div>-->[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-primary btn-block">[m
[31m-                                                        <span class="value">[m
[31m-                                                            <?php $left = $this->db->select('total_a')->where('id', $this->session->user_id)->get('member')->result_array();[m
[31m-                                                            echo $left[0]['total_a']; ?>[m
[31m-                                                        </span>[m
[31m-                                                        <span class="info">Total Left</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-info btn-block">[m
[31m-                                                        <span class="value"><?php $right = $this->db->select('total_b')->where('id', $this->session->user_id)->get('member')->result_array();[m
[31m-                                                                            echo $right[0]['total_b']; ?></span>[m
[31m-                                                        <span class="info">Total Right</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6 ">[m
[31m-                                                    <a href="#" class="btn btn-info btn-block">[m
[31m-                                                        <span class="value"><?php $match = $this->db->select('SUM(pair_match) as total')->where('userid', $this->session->user_id)->get('earning')->result_array();[m
[31m-                                                                            echo empty($match[0]['total'])? "0" : $match[0]['total'];?></span>[m
[31m-                                                        <span class="info">Total Matching</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6 ">[m
[31m-                                                    <a href="#" class="btn btn-info btn-block">[m
[31m-                                                        <span class="value"><?php $match = $this->db->select('SUM(amount) as total')->where(array('userid' => $this->session->user_id, 'type' => 'Matching Income'))->get('earning')->result_array();[m
[31m-                                                                            echo empty($match[0]['total'])? "0" : $match[0]['total'];?></span>[m
[31m-                                                        <span class="info">Total Matching Income</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <!--<div class="col-xs-6 ">-->[m
[31m-                                                <!--    <a href="#" class="btn btn-info btn-block">-->[m
[31m-                                                <!--        <span class="value"><//?php $match = $this->db->select('SUM(amount) as total')->where(array('userid' => $this->session->user_id, 'type' => 'Sponsor Matching Income'))->get('earning')->result_array();-->[m
[31m-                                                <!--                            echo empty($match[0]['total'])? "0" : $match[0]['total'];?></span>-->[m
[31m-                                                <!--        <span class="info">Total Sponsor Matching Income</span>-->[m
[31m-                                                <!--    </a>-->[m
[31m-                                                <!--</div>-->[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-success btn-block">[m
[31m-                                                        <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[31m-                                                                            if ($data <= "0") {[m
[31m-                                                                                echo config_item('currency') . '0';[m
[31m-                                                                            } else {[m
[31m-                                                                                echo config_item('currency') . $data;[m
[31m-                                                                            } ?></span>[m
[31m-                                                        <span class="info">Total Earned</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-success btn-block">[m
[31m-                                                        <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[31m-                                                                            $tax = (($data * $tax_percent)/ 100);[m
[31m-                                                                            $amt = $data - $tax;[m
[31m-                                                                            if ($data <= "0") {[m
[31m-                                                                                echo config_item('currency') . '0';[m
[31m-                                                                            } else {[m
[31m-                                                                                echo config_item('currency') . $amt;[m
[31m-                                                                            } ?></span>[m
[31m-                                                        <span class="info">Total After Tax Deduction</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-danger btn-block">[m
[31m-                                                        <span class="value"><?php echo config_item('currency') . $this->db_model->select('balance', 'wallet', array('userid' => $this->session->user_id)); ?></span>[m
[31m-                                                        <span class="info">Wallet Balance</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-default btn-block margin0">[m
[31m-                                                        <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[31m-                                                                                'userid' => $this->session->user_id,[m
[31m-                                                                                'status' => 'Paid',[m
[31m-                                                                            ));[m
[31m-                                                                            if ($data == "") {[m
[31m-                                                                                echo config_item('currency') . '0';[m
[31m-                                                                            } else {[m
[31m-                                                                                echo config_item('currency') . $data;[m
[31m-                                                                            }[m
[31m-                                                                            ?></span>[m
[31m-                                                        <span class="info">Paid Payout</span>[m
[31m-                                                    </a>[m
[31m-                                                </div>[m
[31m-                                                <div class="col-xs-6">[m
[31m-                                                    <a href="#" class="btn btn-default btn-block margin0">[m
[31m-                                                        <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[31m-                                                                                'userid' => $this->session->user_id,[m
[31m-                                                                                'status' => 'Un-Paid',[m
[31m-                                                                            ));[m
[31m-                                                                            if ($data == "") {[m
[31m-                                                                                echo config_item('currency') . '0';[m
[31m-                                                                            } else {[m
[31m-                                                                                echo config_item('currency') . $data;[m
[31m-                                                                            }[m
[31m-                                                                            ?></span>[m
[31m-                                                        <span class="info">Pending Payout</span>[m
[31m-                                                    </a>[m
[32m+[m
[32m+[m[32m <!-- ##################################### AGENT START ############################### -->[m
[32m+[m[32m                                        <?php if ($member_rank->rank == "Agent") : ?>[m
[32m+[m
[32m+[m
[32m+[m[32m                                            <div class="panel-body">[m
[32m+[m[32m                                                <div class="row w-states">[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-primary btn-block">[m
[32m+[m[32m                                                            <span class="value">[m
[32m+[m[32m                                                                <?php echo $detail->total_a + $detail->total_b + $detail->total_c + $detail->total_d + $detail->total_e ?>[m
[32m+[m[32m                                                            </span>[m
[32m+[m[32m                                                            <span class="info">Total Downline</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m[32m                                                    <!--<div class="col-xs-6">-->[m
[32m+[m[32m                                                    <!--    <a href="#" class="btn btn-info btn-block">-->[m
[32m+[m[32m                                                    <!--        <span class="value"><//?php-->[m
[32m+[m
[32m+[m[32m                                                    <!--                            //echo $this->db_model->count_all('member', array('sponsor' => $this->session->user_id));-->[m
[32m+[m[32m                                                    <!--                            ?></span>-->[m
[32m+[m[32m                                                    <!--        <span class="info">Direct Referred</span>-->[m
[32m+[m[32m                                                    <!--    </a>-->[m
[32m+[m[32m                                                    <!--</div>-->[m
[32m+[m
[32m+[m[41m                                                 [m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[41m                                                   [m
[32m+[m
[32m+[m
[32m+[m[41m                                                   [m
[32m+[m
[32m+[m[32m                                                    <!--<div class="col-xs-6 ">-->[m
[32m+[m[32m                                                    <!--    <a href="#" class="btn btn-info btn-block">-->[m
[32m+[m[32m                                                    <!--        <span class="value"><//?php $match = $this->db->select('SUM(amount) as total')->where(array('userid' => $this->session->user_id, 'type' => 'Sponsor Matching Income'))->get('earning')->result_array();-->[m
[32m+[m[32m                                                    <!--                            echo empty($match[0]['total'])? "0" : $match[0]['total'];?></span>-->[m
[32m+[m[32m                                                    <!--        <span class="info">Total Sponsor Matching Income</span>-->[m
[32m+[m[32m                                                    <!--    </a>-->[m
[32m+[m[32m                                                    <!--</div>-->[m
[32m+[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                                            <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                                                if ($data <= "0") {[m
[32m+[m[32m                                                                                    echo config_item('currency') . '0';[m
[32m+[m[32m                                                                                } else {[m
[32m+[m[32m                                                                                    echo config_item('currency') . $data;[m
[32m+[m[32m                                                                                } ?></span>[m
[32m+[m[32m                                                            <span class="info">Total Earned</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                                            <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                                                $tax = (($data * $tax_percent) / 100);[m
[32m+[m[32m                                                                                $amt = $data - $tax;[m
[32m+[m[32m                                                                                if ($data <= "0") {[m
[32m+[m[32m                                                                                    echo config_item('currency') . '0';[m
[32m+[m[32m                                                                                } else {[m
[32m+[m[32m                                                                                    echo config_item('currency') . $amt;[m
[32m+[m[32m                                                                                } ?></span>[m
[32m+[m[32m                                                            <span class="info">Total After Tax Deduction</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-danger btn-block">[m
[32m+[m[32m                                                            <span class="value"><?php echo config_item('currency') . $this->db_model->select('balance', 'wallet', array('userid' => $this->session->user_id)); ?></span>[m
[32m+[m[32m                                                            <span class="info">Wallet Balance</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                                            <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                                                    'userid' => $this->session->user_id,[m
[32m+[m[32m                                                                                    'status' => 'Paid',[m
[32m+[m[32m                                                                                ));[m
[32m+[m[32m                                                                                if ($data == "") {[m
[32m+[m[32m                                                                                    echo config_item('currency') . '0';[m
[32m+[m[32m                                                                                } else {[m
[32m+[m[32m                                                                                    echo config_item('currency') . $data;[m
[32m+[m[32m                                                                                }[m
[32m+[m[32m                                                                                ?></span>[m
[32m+[m[32m                                                            <span class="info">Paid Payout</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                                    <div class="col-xs-6">[m
[32m+[m[32m                                                        <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                                            <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                                                    'userid' => $this->session->user_id,[m
[32m+[m[32m                                                                                    'status' => 'Un-Paid',[m
[32m+[m[32m                                                                                ));[m
[32m+[m[32m                                                                                if ($data == "") {[m
[32m+[m[32m                                                                                    echo config_item('currency') . '0';[m
[32m+[m[32m                                                                                } else {[m
[32m+[m[32m                                                                                    echo config_item('currency') . $data;[m
[32m+[m[32m                                                                                }[m
[32m+[m[32m                                                                                ?></span>[m
[32m+[m[32m                                                            <span class="info">Pending Payout</span>[m
[32m+[m[32m                                                        </a>[m
[32m+[m[32m                                                    </div>[m
[32m+[m
[32m+[m
                                                 </div>[m
                                             </div>[m
[31m-                                        </div>[m
[31m-                                        <!-- <p align="center">[m
[32m+[m[32m                                            <!-- <p align="center">[m
                                 <a href="<?php echo site_url('member/topup-wallet') ?>"[m
                                    class="btn btn-lg btn-primary"><span class="fa fa-usd"></span> Top[m
                                     Up Wallet &rarr;</a>[m
[36m@@ -674,7 +1024,7 @@[m
                                                         <thead>[m
                                                             <tr style="font-weight: 700">[m
                                                                 <td>Income Name</td>[m
[31m-                                                                <td>TDS + Admin(<?php echo $tax_percent;?>%)</td>[m
[32m+[m[32m                                                                <td>TDS + Admin(<?php echo $tax_percent; ?>%)</td>[m
                                                                 <td>Amount</td>[m
                                                                 <td>Date</td>[m
                                                             </tr>[m
[36m@@ -687,7 +1037,7 @@[m
 [m
                                                         ?>[m
                                                         <tbody>[m
[31m-                                                            <?php foreach ($inc as $e) :$tax = (($e->amount * 15 )/100); ?>[m
[32m+[m[32m                                                            <?php foreach ($inc as $e) : $tax = (($e->amount * 15) / 100); ?>[m
                                                                 <tr>[m
                                                                     <td><?php echo $e->type ?></td>[m
                                                                     <td><?php echo  config_item('currency') . $tax ?></td>[m
[36m@@ -708,79 +1058,453 @@[m
                                         </div>[m
                                     </div>[m
                                 </div>[m
[32m+[m
[32m+[m[32m                                <!-- #############  AGENT END ############# -->[m
[32m+[m[32m                                <!-- ############# SUB AGENT START ############# -->[m
[32m+[m[32m                            <?php elseif ($member_rank->rank == "sub_agent") : ?>[m
[32m+[m[32m                                <div class="panel-body">[m
[32m+[m[32m                                    <div class="row w-states">[m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-primary btn-block">[m
[32m+[m[32m                                                <span class="value">[m
[32m+[m[32m                                                    <?php echo $detail->total_a + $detail->total_b + $detail->total_c + $detail->total_d + $detail->total_e ?>[m
[32m+[m[32m                                                </span>[m
[32m+[m[32m                                                <span class="info">Total Downline</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[41m                                     [m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[41m                                      [m
[32m+[m
[32m+[m
[32m+[m[41m                                       [m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                                <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                                    if ($data <= "0") {[m
[32m+[m[32m                                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                                    } else {[m
[32m+[m[32m                                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                                    } ?></span>[m
[32m+[m[32m                                                <span class="info">Total Earned</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                                <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                                    $tax = (($data * $tax_percent) / 100);[m
[32m+[m[32m                                                                    $amt = $data - $tax;[m
[32m+[m[32m                                                                    if ($data <= "0") {[m
[32m+[m[32m                                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                                    } else {[m
[32m+[m[32m                                                                        echo config_item('currency') . $amt;[m
[32m+[m[32m                                                                    } ?></span>[m
[32m+[m[32m                                                <span class="info">Total After Tax Deduction</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-danger btn-block">[m
[32m+[m[32m                                                <span class="value"><?php echo config_item('currency') . $this->db_model->select('balance', 'wallet', array('userid' => $this->session->user_id)); ?></span>[m
[32m+[m[32m                                                <span class="info">Wallet Balance</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                                <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                                        'userid' => $this->session->user_id,[m
[32m+[m[32m                                                                        'status' => 'Paid',[m
[32m+[m[32m                                                                    ));[m
[32m+[m[32m                                                                    if ($data == "") {[m
[32m+[m[32m                                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                                    } else {[m
[32m+[m[32m                                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                                    }[m
[32m+[m[32m                                                                    ?></span>[m
[32m+[m[32m                                                <span class="info">Paid Payout</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                        <div class="col-xs-6">[m
[32m+[m[32m                                            <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                                <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                                        'userid' => $this->session->user_id,[m
[32m+[m[32m                                                                        'status' => 'Un-Paid',[m
[32m+[m[32m                                                                    ));[m
[32m+[m[32m                                                                    if ($data == "") {[m
[32m+[m[32m                                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                                    } else {[m
[32m+[m[32m                                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                                    }[m
[32m+[m[32m                                                                    ?></span>[m
[32m+[m[32m                                                <span class="info">Pending Payout</span>[m
[32m+[m[32m                                            </a>[m
[32m+[m[32m                                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                                    </div>[m
[32m+[m[32m                                </div>[m
[32m+[m[32m                                <!-- <p align="center">[m
[32m+[m[32m                                <a href="<?php echo site_url('member/topup-wallet') ?>"[m
[32m+[m[32m                                   class="btn btn-lg btn-primary"><span class="fa fa-usd"></span> Top[m
[32m+[m[32m                                    Up Wallet &rarr;</a>[m
[32m+[m[32m                            </p> -->[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <!--task states end-->[m
[32m+[m
[32m+[m[32m                <!--charts start-->[m
[32m+[m[32m                <div class="col-md-6 col-sm-6">[m
[32m+[m[32m                    <div class="panel">[m
[32m+[m[32m                        <div class="panel-body" style="height: 430px">[m
[32m+[m[32m                            <?php[m
[32m+[m[32m                                            if (config_item('enable_topup') == "Yes" && $this->db_model->select('topup', 'member', array('id' => $this->session->user_id)) <= '0') {[m
[32m+[m
[32m+[m[32m                            ?>[m
[32m+[m
[32m+[m[32m                                <div class="alert alert-warning">Top Up your Account.</div>[m
[32m+[m[32m                                <hr />[m
[32m+[m[32m                                <?php echo form_open('member/topup') ?>[m
[32m+[m[32m                                <div class="col-sm-6">[m
[32m+[m[32m                                    <label for="product" class="control-label">Package</label>[m
[32m+[m[32m                                    <select class="form-control" id="product" name="product" required>[m
[32m+[m[32m                                        <?php foreach ($products as $val) {[m
[32m+[m[32m                                                    echo '<option value="' . $val['id'] . '">' . $val['prod_name'] . '. Price :' . config_item('currency') . number_format($val['prod_price'] + ($val['prod_price'] * $val['gst'] / 100), 2) . ' </option>';[m
[32m+[m[32m                                                } ?>[m
[32m+[m[32m                                    </select>[m
[32m+[m[32m                                </div>[m
[32m+[m[32m                                <div class="col-sm-6">[m
[32m+[m[32m                                    <label>Enter TopUp e-PIN</label>[m
[32m+[m[32m                                    <select class="form-control myselect" id="topup" name="topup">[m
[32m+[m[32m                                        <option value="">Select</option>[m
[32m+[m[32m                                        <?php[m
[32m+[m[32m                                                foreach ($epin as $val) {[m
[32m+[m[32m                                                    echo '<option value="' . $val['epin'] . '">' . $val['epin'] . " | ₹" . number_format($val['amount'], 2) . ' </option>';[m
[32m+[m[32m                                                } ?>[m
[32m+[m[32m                                    </select>[m
[32m+[m[32m                                    <br>[m
[32m+[m[32m                                </div>[m
[32m+[m[32m                                &emsp;<button type="submit" class="btn btn-success">Submit </button>[m
[32m+[m[32m                                <?php echo form_close() ?>[m
[32m+[m[32m                            <?php[m
[32m+[m[32m                                            } else {[m
[32m+[m[32m                            ?>[m
[32m+[m[32m                                <strong>Latest Earnings</strong>[m
[32m+[m[32m                                <hr />[m
[32m+[m[32m                                <div class="table-responsive">[m
[32m+[m[32m                                    <table class="table table-hovered">[m
[32m+[m[32m                                        <thead>[m
[32m+[m[32m                                            <tr style="font-weight: 700">[m
[32m+[m[32m                                                <td>Income Name</td>[m
[32m+[m[32m                                                <td>TDS + Admin(<?php echo $tax_percent; ?>%)</td>[m
[32m+[m[32m                                                <td>Amount</td>[m
[32m+[m[32m                                                <td>Date</td>[m
[32m+[m[32m                                            </tr>[m
[32m+[m[32m                                        </thead>[m
[32m+[m[32m                                        <?php[m
[32m+[m[32m                                                $this->db->select('type, amount, date')[m
[32m+[m[32m                                                    ->where('userid', $this->session->user_id)->order_by('id', 'DESC')[m
[32m+[m[32m                                                    ->limit(12);[m
[32m+[m[32m                                                $inc = $this->db->get('earning')->result();[m
[32m+[m
[32m+[m[32m                                        ?>[m
[32m+[m[32m                                        <tbody>[m
[32m+[m[32m                                            <?php foreach ($inc as $e) : $tax = (($e->amount * 15) / 100); ?>[m
[32m+[m[32m                                                <tr>[m
[32m+[m[32m                                                    <td><?php echo $e->type ?></td>[m
[32m+[m[32m                                                    <td><?php echo  config_item('currency') . $tax ?></td>[m
[32m+[m[32m                                                    <td>₹ <?php echo  $e->amount - $tax ?></td>[m
[32m+[m[32m                                                    <td><?php echo $e->date ?></td>[m
[32m+[m[32m                                                </tr>[m
[32m+[m[32m                                            <?php endforeach; ?>[m
[32m+[m[32m                                        </tbody>[m
[32m+[m[32m                                    </table>[m
[32m+[m
[32m+[m[32m                                </div>[m
[32m+[m[32m                                <h4 align="center" class="notranslate alert alert-primary">My Referral[m
[32m+[m[32m                                    Link[m
[32m+[m[32m                                    : <a target="_blank" href="<?php echo site_url() . 'site/register/A/' . $this->session->user_id ?>"><?php echo site_url() . 'site/register/A/' . $this->session->user_id ?></a>[m
[32m+[m[32m                                </h4>[m
[32m+[m
[32m+[m[32m                            <?php } ?>[m
[32m+[m[32m                        </div>[m
                     </div>[m
[31m-            <?php }[m
[31m-                        } ?>[m
[32m+[m[32m                </div>[m
[32m+[m
[32m+[m[32m                <!-- ################## SUB AGENT END ################ -->[m
[32m+[m[32m                <!-- ################## MEMBER START ################ -->[m
[32m+[m[32m            <?php else : ?>[m
[32m+[m[32m                <div class="panel-body">[m
[32m+[m[32m                    <div class="row w-states">[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-primary btn-block">[m
[32m+[m[32m                                <span class="value">[m
[32m+[m[32m                                    <?php echo $detail->total_a + $detail->total_b + $detail->total_c + $detail->total_d + $detail->total_e ?>[m
[32m+[m[32m                                </span>[m
[32m+[m[32m                                <span class="info">Total Downline</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m[41m                      [m
[32m+[m
[32m+[m
[32m+[m[41m                       [m
[32m+[m
[32m+[m[41m                       [m
[32m+[m
[32m+[m
[32m+[m[41m                        [m
[32m+[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                    if ($data <= "0") {[m
[32m+[m[32m                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                    } else {[m
[32m+[m[32m                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                    } ?></span>[m
[32m+[m[32m                                <span class="info">Total Earned</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-success btn-block">[m
[32m+[m[32m                                <span class="value"><?php $data = $this->db_model->sum('amount', 'earning', array('userid' => $this->session->user_id));[m
[32m+[m[32m                                                    $tax = (($data * $tax_percent) / 100);[m
[32m+[m[32m                                                    $amt = $data - $tax;[m
[32m+[m[32m                                                    if ($data <= "0") {[m
[32m+[m[32m                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                    } else {[m
[32m+[m[32m                                                        echo config_item('currency') . $amt;[m
[32m+[m[32m                                                    } ?></span>[m
[32m+[m[32m                                <span class="info">Total After Tax Deduction</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-danger btn-block">[m
[32m+[m[32m                                <span class="value"><?php echo config_item('currency') . $this->db_model->select('balance', 'wallet', array('userid' => $this->session->user_id)); ?></span>[m
[32m+[m[32m                                <span class="info">Wallet Balance</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                        'userid' => $this->session->user_id,[m
[32m+[m[32m                                                        'status' => 'Paid',[m
[32m+[m[32m                                                    ));[m
[32m+[m[32m                                                    if ($data == "") {[m
[32m+[m[32m                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                    } else {[m
[32m+[m[32m                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                    }[m
[32m+[m[32m                                                    ?></span>[m
[32m+[m[32m                                <span class="info">Paid Payout</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                        <div class="col-xs-6">[m
[32m+[m[32m                            <a href="#" class="btn btn-default btn-block margin0">[m
[32m+[m[32m                                <span class="value"><?php $data = $this->db_model->sum('amount', 'withdraw_request', array([m
[32m+[m[32m                                                        'userid' => $this->session->user_id,[m
[32m+[m[32m                                                        'status' => 'Un-Paid',[m
[32m+[m[32m                                                    ));[m
[32m+[m[32m                                                    if ($data == "") {[m
[32m+[m[32m                                                        echo config_item('currency') . '0';[m
[32m+[m[32m                                                    } else {[m
[32m+[m[32m                                                        echo config_item('currency') . $data;[m
[32m+[m[32m                                                    }[m
[32m+[m[32m                                                    ?></span>[m
[32m+[m[32m                                <span class="info">Pending Payout</span>[m
[32m+[m[32m                            </a>[m
[32m+[m[32m                        </div>[m
[32m+[m
[32m+[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m                <!-- <p align="center">[m
[32m+[m[32m                                <a href="<?php echo site_url('member/topup-wallet') ?>"[m
[32m+[m[32m                                   class="btn btn-lg btn-primary"><span class="fa fa-usd"></span> Top[m
[32m+[m[32m                                    Up Wallet &rarr;</a>[m
[32m+[m[32m                            </p> -->[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </div>[m
[32m+[m[32m        <!--task states end-->[m
[32m+[m
[32m+[m[32m        <!--charts start-->[m
[32m+[m[32m        <div class="col-md-6 col-sm-6">[m
[32m+[m[32m            <div class="panel">[m
[32m+[m[32m                <div class="panel-body" style="height: 430px">[m
[32m+[m[32m                    <?php[m
[32m+[m[32m                                            if (config_item('enable_topup') == "Yes" && $this->db_model->select('topup', 'member', array('id' => $this->session->user_id)) <= '0') {[m
[32m+[m
[32m+[m[32m                    ?>[m
[32m+[m
[32m+[m[32m                        <div class="alert alert-warning">Top Up your Account.</div>[m
[32m+[m[32m                        <hr />[m
[32m+[m[32m                        <?php echo form_open('member/topup') ?>[m
[32m+[m[32m                        <div class="col-sm-6">[m
[32m+[m[32m                            <label for="product" class="control-label">Package</label>[m
[32m+[m[32m                            <select class="form-control" id="product" name="product" required>[m
[32m+[m[32m                                <?php foreach ($products as $val) {[m
[32m+[m[32m                                                    echo '<option value="' . $val['id'] . '">' . $val['prod_name'] . '. Price :' . config_item('currency') . number_format($val['prod_price'] + ($val['prod_price'] * $val['gst'] / 100), 2) . ' </option>';[m
[32m+[m[32m                                                } ?>[m
[32m+[m[32m                            </select>[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                        <div class="col-sm-6">[m
[32m+[m[32m                            <label>Enter TopUp e-PIN</label>[m
[32m+[m[32m                            <select class="form-control myselect" id="topup" name="topup">[m
[32m+[m[32m                                <option value="">Select</option>[m
[32m+[m[32m                                <?php[m
[32m+[m[32m                                                foreach ($epin as $val) {[m
[32m+[m[32m                                                    echo '<option value="' . $val['epin'] . '">' . $val['epin'] . " | ₹" . number_format($val['amount'], 2) . ' </option>';[m
[32m+[m[32m                                                } ?>[m
[32m+[m[32m                            </select>[m
[32m+[m[32m                            <br>[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                        &emsp;<button type="submit" class="btn btn-success">Submit </button>[m
[32m+[m[32m                        <?php echo form_close() ?>[m
[32m+[m[32m                    <?php[m
[32m+[m[32m                                            } else {[m
[32m+[m[32m                    ?>[m
[32m+[m[32m                        <strong>Latest Earnings</strong>[m
[32m+[m[32m                        <hr />[m
[32m+[m[32m                        <div class="table-responsive">[m
[32m+[m[32m                            <table class="table table-hovered">[m
[32m+[m[32m                                <thead>[m
[32m+[m[32m                                    <tr style="font-weight: 700">[m
[32m+[m[32m                                        <td>Income Name</td>[m
[32m+[m[32m                                        <td>TDS + Admin(<?php echo $tax_percent; ?>%)</td>[m
[32m+[m[32m                                        <td>Amount</td>[m
[32m+[m[32m                                        <td>Date</td>[m
[32m+[m[32m                                    </tr>[m
[32m+[m[32m                                </thead>[m
[32m+[m[32m                                <?php[m
[32m+[m[32m                                                $this->db->select('type, amount, date')[m
[32m+[m[32m                                                    ->where('userid', $this->session->user_id)->order_by('id', 'DESC')[m
[32m+[m[32m                                                    ->limit(12);[m
[32m+[m[32m                                                $inc = $this->db->get('earning')->result();[m
[32m+[m
[32m+[m[32m                                ?>[m
[32m+[m[32m                                <tbody>[m
[32m+[m[32m                                    <?php foreach ($inc as $e) : $tax = (($e->amount * 15) / 100); ?>[m
[32m+[m[32m                                        <tr>[m
[32m+[m[32m                                            <td><?php echo $e->type ?></td>[m
[32m+[m[32m                                            <td><?php echo  config_item('currency') . $tax ?></td>[m
[32m+[m[32m                                            <td>₹ <?php echo  $e->amount - $tax ?></td>[m
[32m+[m[32m                                            <td><?php echo $e->date ?></td>[m
[32m+[m[32m                                        </tr>[m
[32m+[m[32m                                    <?php endforeach; ?>[m
[32m+[m[32m                                </tbody>[m
[32m+[m[32m                            </table>[m
[32m+[m
[32m+[m[32m                        </div>[m
[32m+[m[32m                        <h4 align="center" class="notranslate alert alert-primary">My Referral[m
[32m+[m[32m                            Link[m
[32m+[m[32m                            : <a target="_blank" href="<?php echo site_url() . 'site/register/A/' . $this->session->user_id ?>"><?php echo site_url() . 'site/register/A/' . $this->session->user_id ?></a>[m
[32m+[m[32m                        </h4>[m
[32m+[m
[32m+[m[32m                    <?php } ?>[m
                 </div>[m
             </div>[m
         </div>[m
[32m+[m[32m    <?php endif; ?>[m
[32m+[m
[32m+[m
[32m+[m
     </div>[m
[31m-    <!--main content end-->[m
[31m-    <!--footer start-->[m
[31m-    <!--footer end-->[m
[31m-    <script src="<?php echo base_url() ?>axxets/select2/select2.full.min.js"></script>[m
[31m-    <script src="<?php echo base_url(); ?>axxets/select2/select2.full.min.js"></script>[m
[31m-    <!-- inject:js -->[m
[31m-    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/4.0.0/autosize.min.js"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>[m
[31m-    <!-- endinject -->[m
[31m-    <script src="<?php echo base_url('axxets/member/theme.js') ?>"></script>[m
[31m-    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>[m
[31m-    <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>[m
[31m-    <script>[m
[31m-        $(document).ready(function() {[m
[31m-            var table = $('#example').DataTable({[m
[31m-                lengthChange: false,[m
[31m-                buttons: ['copy', 'excel', 'pdf'] // 'colvis' for column visiblity[m
[31m-            });[m
[31m-[m
[31m-            table.buttons().container()[m
[31m-                .appendTo('#example_wrapper .col-md-6:eq(0)');[m
[32m+[m[32m<?php }[m
[32m+[m[32m                        } ?>[m
[32m+[m[32m</div>[m
[32m+[m[32m</div>[m
[32m+[m[32m</div>[m
[32m+[m[32m</div>[m
[32m+[m[32m<!--main content end-->[m
[32m+[m[32m<!--footer start-->[m
[32m+[m[32m<!--footer end-->[m
[32m+[m[32m<script src="<?php echo base_url() ?>axxets/select2/select2.full.min.js"></script>[m
[32m+[m[32m<script src="<?php echo base_url(); ?>axxets/select2/select2.full.min.js"></script>[m
[32m+[m[32m<!-- inject:js -->[m
[32m+[m[32m<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/4.0.0/autosize.min.js"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>[m
[32m+[m[32m<!-- endinject -->[m
[32m+[m[32m<script src="<?php echo base_url('axxets/member/theme.js') ?>"></script>[m
[32m+[m[32m<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>[m
[32m+[m[32m<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>[m
[32m+[m[32m<script>[m
[32m+[m[32m    $(document).ready(function() {[m
[32m+[m[32m        var table = $('#example').DataTable({[m
[32m+[m[32m            lengthChange: false,[m
[32m+[m[32m            buttons: ['copy', 'excel', 'pdf'] // 'colvis' for column visiblity[m
         });[m
[31m-    </script>[m
[31m-[m
[31m-    <!--Data Table--->[m
[31m-    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap4.min.js"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>[m
[31m-    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>[m
[31m-    <script>[m
[31m-        CKEDITOR.replace('editor');[m
[31m-    </script>[m
[31m-    <script>[m
[31m-        $(document).ready(function() {[m
[31m-            $('[data-toggle="popover"]').popover({[m
[31m-                html: true,[m
[31m-                placement: "top"[m
[31m-            });[m
[31m-[m
[31m-            $(".myselect").select2({[m
[31m-                tags: true[m
[31m-            });[m
[32m+[m
[32m+[m[32m        table.buttons().container()[m
[32m+[m[32m            .appendTo('#example_wrapper .col-md-6:eq(0)');[m
[32m+[m[32m    });[m
[32m+[m[32m</script>[m
[32m+[m
[32m+[m[32m<!--Data Table--->[m
[32m+[m[32m<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap4.min.js"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>[m
[32m+[m[32m<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>[m
[32m+[m[32m<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>[m
[32m+[m[32m<script>[m
[32m+[m[32m    CKEDITOR.replace('editor');[m
[32m+[m[32m</script>[m
[32m+[m[32m<script>[m
[32m+[m[32m    $(document).ready(function() {[m
[32m+[m[32m        $('[data-toggle="popover"]').popover({[m
[32m+[m[32m            html: true,[m
[32m+[m[32m            placement: "top"[m
[32m+[m[32m        });[m
[32m+[m
[32m+[m[32m        $(".myselect").select2({[m
[32m+[m[32m            tags: true[m
         });[m
[31m-    </script>[m
[31m-    <script>[m
[31m-        $(function() {[m
[31m-            $(".datepicker").datepicker({[m
[31m-                dateFormat: "yy-mm-dd",[m
[31m-                yearRange: "-70:+70",[m
[31m-                changeMonth: true,[m
[31m-                changeYear: true,[m
[31m-                defaultDate: 0,[m
[31m-                showOptions: {[m
[31m-                    direction: "down"[m
[31m-                },[m
[31m-            });[m
[32m+[m[32m    });[m
[32m+[m[32m</script>[m
[32m+[m[32m<script>[m
[32m+[m[32m    $(function() {[m
[32m+[m[32m        $(".datepicker").datepicker({[m
[32m+[m[32m            dateFormat: "yy-mm-dd",[m
[32m+[m[32m            yearRange: "-70:+70",[m
[32m+[m[32m            changeMonth: true,[m
[32m+[m[32m            changeYear: true,[m
[32m+[m[32m            defaultDate: 0,[m
[32m+[m[32m            showOptions: {[m
[32m+[m[32m                direction: "down"[m
[32m+[m[32m            },[m
         });[m
[31m-    </script>[m
[32m+[m[32m    });[m
[32m+[m[32m</script>[m
 </body>[m
 [m
 </html>[m
\ No newline at end of file[m
[1mdiff --git a/application/views/member/business/business_plan.php b/application/views/member/business/business_plan.php[m
[1mindex d179ee6..c188819 100644[m
[1m--- a/application/views/member/business/business_plan.php[m
[1m+++ b/application/views/member/business/business_plan.php[m
[36m@@ -1,132 +1 @@[m
[31m-<!-- <link rel="stylesheet" href="<?php echo base_url(); ?>axxets/member/business/css/main.css" />[m
[31m-<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->[m
[31m-<style>[m
[31m-    .t {[m
[31m-        border-bottom: solid 3px #f56a6a;[m
[31m-        display: inline-block;[m
[31m-        margin: 0 0 2em 0;[m
[31m-        padding: 0 0 0 0;[m
[31m-    }[m
[31m-    p{[m
[31m-        color:#7f888f;[m
[31m-        text-align: justify;[m
[31m-        font-size: 13px;[m
[31m-    }[m
[31m-</style>[m
[31m-<section>[m
[31m-    <header class="text-center">[m
[31m-        <h2 class="t">JOINING PACKAGE</h2>[m
[31m-    </header>[m
[31m-    <div class="col-md-6">[m
[31m-        <article>[m
[31m-[m
[31m-            <div class="content">[m
[31m-                <h3>₹ 7,000.00 INR Mini Package</h3>[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Gas Safety Device & Herbal food Suppliment Kit</p>[m
[31m-                <!-- <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Capping = 20 Pair/ Closing </p> -->[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Complimentary = Coupon (1,000.00 x 6) = ₹ 6,000.00 + BSM & DOP </p>[m
[31m-                </ul>[m
[31m-            </div>[m
[31m-        </article>[m
[31m-    </div>[m
[31m-    <div class="col-md-6">[m
[31m-        <article>[m
[31m-[m
[31m-            <div class="content">[m
[31m-                <h3> ₹ 13,000.00 INR Premium Package</h3>[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Gas Safety Device & Herbal food Suppliment Kit, 1 Suit length, Shirt Paint Piece, Suit & Saree</p>[m
[31m-                <!-- <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Capping = 20 Pair/ Closing </p> -->[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Complimentary = Coupon (1,000.00 x 12) = ₹ 12,000.00 + BSM & DOP </p>[m
[31m-            </div>[m
[31m-        </article>[m
[31m-    </div>[m
[31m-[m
[31m-    <div class="col-sm-6">[m
[31m-        <article>[m
[31m-[m
[31m-            <div class="content">[m
[31m-                <h3> ₹ 19,000.00 INR Tours & Travel Package</h3>[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> India Tour for 1 Person 1 Night  (Up and Down by train & 2 days services included)</p>[m
[31m-                <!-- <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Capping = 20 Pair/ Closing </p> -->[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Complimentary = Coupon (1,000.00 x 36) = ₹ 36,000.00 + BSM & DOP </p>[m
[31m-[m
[31m-            </div>[m
[31m-        </article>[m
[31m-    </div>[m
[31m-[m
[31m-    [m
[31m-[m
[31m-    <div class="col-sm-6">[m
[31m-        <article>[m
[31m-[m
[31m-            <div class="content">[m
[31m-                <h3> ₹ 25,000.00 INR Executive Package (Triple ID)</h3>[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Gas Safety Device & Herbal food Suppliment Kit, 1 Suit length, FMCG Product, Shirt Paint Piece, Suit & Saree, Bag, Tie, Purse & Belt</p>[m
[31m-                <!-- <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Capping = 20 Pair/ Closing </p> -->[m
[31m-                <p><i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Complimentary = Coupon (1,000.00 x 24) = ₹ 24,000.00 + BSM & DOP </p>[m
[31m-[m
[31m-            </div>[m
[31m-        </article>[m
[31m-    </div>[m
[31m-    [m
[31m-</section>[m
[31m-[m
[31m-<!-- Section -->[m
[31m-[m
[31m-<hr style="border-top: solid 2px rgba(210, 215, 217, 0.75);"> [m
[31m-<br>[m
[31m-<!-- Section -->[m
[31m-<section>[m
[31m-    <header class="text-center">[m
[31m-        <h2 class="t">INCOMES</h2>[m
[31m-    </header>[m
[31m-[m
[31m-    <div class="col-sm-12">[m
[31m-[m
[31m-        <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Matching Bonus –[m
[31m-            First 2:1 / 1:2 = 1000 INR, Another 1:1 = 1000 INR Unlimited </p>[m
[31m-        <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Sponsor Matching[m
[31m-            Bonus = 20 % </p>[m
[31m-        <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Monthly Bonanza[m
[31m-        </p>[m
[31m-        <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Core Committee =[m
[31m-            10% of CTO / CAR Achiever = 100 Member Only </p>[m
[31m-    </div>[m
[31m-    <div class="col-sm-12">[m
[31m-        <ul class="c-photos">[m
[31m-            <img class="img-responsive" src="<?php echo base_url() ?>axxets/member/img/7.jpg" alt="marketing" />[m
[31m-        </ul>[m
[31m-    </div>[m
[31m-</section>[m
[31m-<section>[m
[31m-    <div class="content">[m
[31m-        <header class="text-center">[m
[31m-            <h2 class="t">TERMS AND CONDITION</h2>[m
[31m-        </header>[m
[31m-        <div class="col-sm-6">[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Closing = Weekly /[m
[31m-                Sunday</p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Pay-out = Every[m
[31m-                Wednesday</p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Deduction = TDS 5[m
[31m-                % and Admin 10% </p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Compulsory =[m
[31m-                1000.00 INR Repurchase Every Month</p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Retail Profit = Up[m
[31m-                to 30% </p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Repurchase Bonus[m
[31m-            </p>[m
[31m-            <p>A) 150,000.00 INR Mini Franchise = 3 %</p>[m
[31m-            <p>B) 300,000.00 INR Super Franchise = 4 %</p>[m
[31m-            <p>C) 500,000.00 INR District Franchise = 5 %</p>[m
[31m-            <p>D) 1,000,000. 00 INR State Franchise = 7 %</p>[m
[31m-            <p>E) 60,000.00 INR Special Cira Magic Comer = 2 %</p>[m
[31m-            <p> <i class="fa fa-check-square" aria-hidden="true" style="color:#000;"></i> Franchise</p>[m
[31m-            <p>A) 5,000.00 * 6 Month Repurchase = 5,000 INR free Product in 7 Month </p>[m
[31m-            <p>B) Repurchase Matching = 10 %</p>[m
[31m-            <p>C)Personal Repurchase Business is Count in Weaker Leg Automatically </p>[m
[31m-        </div>[m
[31m-        <div class="col-sm-6"><img src="<?php echo base_url() ?>axxets/member/img/condition.png" alt="" /></div>[m
[31m-    </div>[m
[31m-[m
[31m-</section>[m
\ No newline at end of file[m
[32m+[m[32m<h3>Coming soon</h3>[m
\ No newline at end of file[m
[1mdiff --git a/application/views/member/epin/unused.php b/application/views/member/epin/unused.php[m
[1mindex baa4b58..976bb09 100644[m
[1m--- a/application/views/member/epin/unused.php[m
[1m+++ b/application/views/member/epin/unused.php[m
[36m@@ -28,7 +28,7 @@[m
                 <td><?php echo $sn++; ?></td>[m
                 <td><?php echo $e['epin']; ?></td>[m
                 <td><?php echo '₹  '.$e['amount']; ?></td>[m
[31m-                <td><?php echo config_item('ID_EXT') . $e['issue_to']; ?></td>[m
[32m+[m[32m                <td><?php echo $e['issue_to']; ?></td>[m
                 <td><?php echo $e['generate_time']; ?></td>[m
                 <!-- <td><?php echo $e['type']; ?></td> -->[m
                 <td>[m
[1mdiff --git a/application/views/member/profile/welcome_letter.php b/application/views/member/profile/welcome_letter.php[m
[1mindex 7245258..e6fe671 100644[m
[1m--- a/application/views/member/profile/welcome_letter.php[m
[1m+++ b/application/views/member/profile/welcome_letter.php[m
[36m@@ -7,9 +7,10 @@[m
  * Developed for: Camwel Corporate Solution PVT LTD[m
  **************************************************************************************************/[m
 [m
[31m-$detail = $this->db_model->select_multi('name, email, phone, address, sponsor, signup_package, join_time', 'member', array('id' => $this->session->user_id));[m
[32m+[m[32m$detail = $this->db_model->select_multi('name, email, phone, address,prefix,sponsor, signup_package, join_time', 'member', array('id' => $this->session->user_id));[m
 [m
 $array_src = array([m
[32m+[m[32m    '{{prefix}}',[m
     '{{member_id}}',[m
     '{{member_name}}',[m
     '{{member_phone}}',[m
[36m@@ -20,7 +21,8 @@[m [m$array_src = array([m
     '{{member_purchased}}',[m
 );[m
 [m
[31m-$array_rplc = array([m
[32m+[m[32m$array_rplc = array([m[41m    [m
[32m+[m[32m    $detail->prefix,[m
     $this->session->user_id,[m
     $detail->name,[m
     $detail->phone,[m
[1mdiff --git a/application/views/theme/success.php b/application/views/theme/success.php[m
[1mindex cba153f..abbf637 100644[m
[1m--- a/application/views/theme/success.php[m
[1m+++ b/application/views/theme/success.php[m
[36m@@ -17,8 +17,8 @@[m
             cordially invite you  as <b> &nbsp;<?php if($this->session->_rank_=='Agent'){echo 'Agent';}elseif($this->session->_rank_=='sub_agent'){echo "sub Agent";}else{echo "Member";}?>&nbsp;</b>to our home, where we make friends to earn and learn together. Below is your detail of[m
             Registration.</p>[m
             <div class="mb-5">[m
[31m-                <strong>Sponsor ID :</strong> <?php echo config_item('ID_EXT') . $this->session->_sponsor_ ?><br/>[m
[31m-                <strong>User ID :</strong> <?php echo config_item('ID_EXT') . $this->session->_user_id_ ?><br/>[m
[32m+[m[32m                <strong>Sponsor ID :</strong> <?php echo $this->session->_prefix_ . $this->session->_sponsor_ ?><br/>[m
[32m+[m[32m                <strong>User ID :</strong> <?php echo $this->session->_prefix_ . $this->session->_user_id_ ?><br/>[m
                 <strong>Password :</strong> (<em>You have entered already.</em>)[m
             </div>[m
             <br>[m
[1mdiff --git a/axxets/admin/bg_suburb.jpg b/axxets/admin/bg_suburb.jpg[m
[1mindex 0b7c773..09b03c5 100644[m
Binary files a/axxets/admin/bg_suburb.jpg and b/axxets/admin/bg_suburb.jpg differ
[1mdiff --git a/uploads/favicon.png b/uploads/favicon.png[m
[1mindex a89439d..d93f304 100644[m
Binary files a/uploads/favicon.png and b/uploads/favicon.png differ
[1mdiff --git a/uploads/logo.png b/uploads/logo.png[m
[1mindex 328be36..23f775d 100644[m
Binary files a/uploads/logo.png and b/uploads/logo.png differ
[1mdiff --git a/uploads/welcome_letter.txt b/uploads/welcome_letter.txt[m
[1mindex a9e42b2..65ce784 100644[m
[1m--- a/uploads/welcome_letter.txt[m
[1m+++ b/uploads/welcome_letter.txt[m
[36m@@ -23,7 +23,7 @@[m
 <div class="">[m
     <div class="col-md-6">[m
         <strong>Member ID :</strong>&nbsp;[m
[31m-        <strong>{{member_id}}</strong> [m
[32m+[m[32m        <strong>{{prefix}}{{member_id}}</strong>[m[41m [m
     </div>[m
     <div class="col-md-6">[m
         <strong>Date Of Joining:</strong> [m
