<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="vi">
	<head>
	    <title>TrangChu</title>
	    <meta name="description" content="đây là trang chủ" />
	    <meta charset="utf-8" />
	    <title>Home</title>        
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/reset.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/trangchu.css" />
	    <link rel="stylesheet" href="flexslider.css" type="text/css" media="screen">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="js/jquery.flexslider.js"></script>
	</head>
<style>
*{margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}
.box{
    width:400px;
    height:200px;
    padding:10px;
    margin:0 auto;
    position:relative;
}
 
.box img{
    margin:auto;
    position:absolute;
    top:0; left:0; right:0; bottom:0;
}
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 90%;
    padding: 12px 20px;
    margin: 8px 26px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	font-size:16px;
}

/* Set a style for all buttons */
button {
    background-color: #1d8ece;
    color: white;
    padding: 14px 20px;
    margin: 8px 26px;
    border: none;
    cursor: pointer;
    width: 90%;
	font-size:20px;
}
button:hover {
    opacity: 0.8;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}
.avatar {
    width: 200px;
	height:200px;
    border-radius: 50%;
}

/* The Modal (background) */
.modal {
	display:none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

/* Modal Content Box */
.modal-content {
    background-color: #fefefe;
    margin: 4% auto 15% auto;
    border: 1px solid #888;
    width: 40%; 
	padding-bottom: 30px;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}
.close:hover,.close:focus {
    color: red;
    cursor: pointer;
}
/* Add Zoom Animation */
.animate {
    animation: zoom 0.6s
}
@keyframes zoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}
h3 {color: red}h3.a {color: white; text-shadow: black 0.1em 0.1em 0.2em}
</style>
	<body>
		<div class="container">
			<div class="header">
	           <div class="usermenu"><p><span class="login">Bạn chưa đăng nhập. <input type="submit"  value="Đăng nhập" onclick="document.getElementById('modal-wrapper').style.display='block'"></span><p> <!--#usermenu-->
	            <span class="login">Chưa có tài khoản ? <input type="submit"  value="Đăng kí" onclick="document.getElementById('modal-wrapper2').style.display='block'"></span></div> <!--#usermenu-->
	          
	           <div class="header-main">
	           		<div class="image"><a href="#"><img src="/DoAnThiTracNghiem/img/spkt-banner.jpg"></a></div><br>
	           		<div class="intro">
	           			<h3>HỆ THỐNG HỖ TRỢ ÔN THI ĐẠI HỌC</h3>
	           			<h4>BÀI TẬP LỚN MÔN LẬP TRÌNH WEB</h4>
	           		</div>
	           </div> <!--#header-main-->
			</div> <!--#header-->
			
			
			
		 	<div class="content">
		 	<h3>${status}</h3>
		 	<div class="flexslider" >
          <ul class="slides">
            	<li>
           	    <div class="box"><img src="img/IMG_9779.jpg" ></div>
  	    		</li>
  	    		<li>
  	    		<div class="box"><img src="img/IMG_9776.png"" ></div>
  	    		</li>
          </ul>
        </div>
			<div class="footer">
				<div class="footer-main">
					<div class="about-us">
						<h2>VỀ CHÚNG TÔI</h2>
						<p>Trần Quang Anh - 16110009</p>
						<p>Đặng Thanh Tú - 16110253</p>
					</div> <!--#about-us-->
					<div class="contact-us">
						<h2>ĐỊA CHỈ CÔNG TÁC</h2>
						<p>1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, Thành phố Hồ Chí Minh</p>
	           			<p>&#9742 Phone:  0933217987 - 0933217984</p>
	           			<p>&#9993 E-mail:  quanganh230398@gmail.com</p>
					</div> <!--#contact-us-->
				</div> <!--#footer-main-->
				<div class="footer-bottom">
					<p>Copyright © 2018, <a href="https://www.facebook.com/quanganh.tran.9849"> Facebook </a> .All Rights Reserved. Powered by TranQuangAnh.</p>
				</div>
			</div> <!--#footer-->
		 	</div> <!--#content-->
		</div> <!--#container-->
	<div id="modal-wrapper" class="modal"> 
 		<form name="form1" class="modal-content animate" action="LoginFormServlet" method="post">       
   		 	<div class="imgcontainer">
    		  <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
    		  <img src="/DoAnThiTracNghiem/img/1.png" alt="Avatar" class="avatar">
    		  <h1 style="text-align:center">Login Pop up Box</h1>
   		    </div>

    		<div class="container">
      			<input type="text" placeholder="Enter Username" name="uname">
      			<input type="password" placeholder="Enter Password" name="psw">        
      		<button type="submit">Login</button>      
    		</div>    
  		</form> 
	</div>
	<div id="modal-wrapper2" class="modal"> 
 		<form name="form" class="modal-content animate" action="RegisterServlet" method="post" onsubmit = "return validateRegister()">       
   		 	<div class="imgcontainer">
    		  <span onclick="document.getElementById('modal-wrapper2').style.display='none'" class="close" title="Close PopUp">&times;</span>
    		  <img src="/DoAnThiTracNghiem/img/1.png" alt="Avatar" class="avatar">
    		  <h1 style="text-align:center">Register Pop up Box</h1>
   		    </div>

    		<div class="container">
      			<input type="text" placeholder="Enter Username" name="runame">
      			<input type="text" placeholder="Enter Fullname" name="name">
      			<input type="password" placeholder="Enter Password" name="rpsw"> 
      			<input type="password" placeholder="Retype your password" name="rrpsw">       
      		<button type="submit">Register</button>      
    		</div>    
  		</form> 
	</div>
	<script>
function validateRegister() // còn ktra các box ko đc trống, kiểm tra username
{  
var password = document.form.rpsw.value; 
var retypepassword = document.form.rrpsw.value;
var fullname = document.form.name.value;
var username = document.form.runame.value;
	if (password != retypepassword) 
	{  
		alert("Mật khẩu và mật khẩu nhập lại không trùng khớp !");  
		return false;  
	} 
	if (password ==null || password=="" || retypepassword ==null || retypepassword=="" || fullname ==null || fullname=="" || username ==null || username=="") 
	{  
		alert("Không được để trống bất kì thông tin nào !");  
		return false;  
	} 
}
	</script>
<script>
// If user clicks anywhere outside of the modal, Modal will close

var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        rtl: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
	</body>
</html>
