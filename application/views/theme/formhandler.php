<?php


session_start();


if (isset($_POST['submit'])) {
    $name = $_POST['name'];
    echo $name;
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];    
    $address = $_POST['address']; 
    $message = $_POST['message']; 
    $product_category = $_POST['product_category']; 


    $to = " info@adifuture.com";
    $subject = "Enquiry From ADI FUTURE ";
    $headers =  'MIME-Version: 1.0' . "\r\n";
    $headers .= 'From: info@adifuture.com' . "\r\n";
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";



    $full_message = "<html>
    <head><title>Enquiry Data</title></head>
    <body>
    <table>
        <tr>
        <td>Name</td>
        <td>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td> $name</td>
        </tr>
        <tr>
        <td>Email Id</td>
        <td>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td> $email</td>
        </tr>
        <tr>
        <td>Mobile No</td>
        <td>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td> $mobile</td>
        </tr>
        <tr>
        <td>Message</td>
        <td>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td> $address</td>
        </tr>
      <tr>
        <td>Message</td>
        <td>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td> $message</td>
        </tr>
        
    </table>
    </body>
    </html>";

$user = $email;
$user_subject = "Thank You $name";
$user_headers = 'From: info@adifuture.com' . "\r\n";
$user_message = "Dear $name.\nWelcome to ADI FUTURE \n We have got your query.We will reach you soon.\nThank You!";
$uanswer = intval(trim($_POST["uanswer"]));
// if ($uanswer == $answer) {
if (mail($to, $subject, $full_message, $headers)==0) {
mail($user, $user_subject, $user_message, $user_headers);
$_SESSION["response"] = "<h3>Dear <span   style='color:#e70780;'>$name</span>,</h3><blockquote><p>We have got your query. We will contact you soon.<br/>For Quick Enquiry <span style='color:#e70780;'>Call Us</span> at <span ><i class='fas fa-phone-alt px-2 '></i><span> +91
9955215097/+91 9955215097</span></span></p>
<p>Thank You!</p></blockquote>";
} else {
echo $name . $mobile . $whatsapp . $email . $need . $message;
$_SESSION["response"] = "<h3>Dear <span  style='color:#e70780;'>$name</span>,</h3><blockquote><p>Something is wrong. It seems like internet is not working well.<br/>For Quick Enquiry <span style='color:#e70780;'>Call Us<span> at <span ><i class='fas fa-phone-alt px-2 '></i><span>+91
9955215097/+91 9955215097</span></span></p>
<p>Please, try again!</p><p>Thank You!</p></blockquote>";
}
// } else {
// $_SESSION["response"] = "<h3>Dear <span   style='color:#e70780;'>$name</span>,</h3><blockquote><p>You have entered wrong <u aptcha value</u>. Please Enter the correct value.<br/>For Quick Enquiry <span all Us</span> at <span   style='color:#e70780;'><i class='fas fa-phone-alt  px-2 '></i><span> +91
// 8294703147/+91 7979878458</span></span></p>
// <p>Please, try again!</p><p>Thank You!</p></blockquote>";
// }
header("Location:thanku.php");
}
