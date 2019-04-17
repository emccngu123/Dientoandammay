<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAL.LoginDAL"%>
<%@page import="BEAN.User"%>
<!DOCTYPE html>

<html lang="vi">
	<head>
	    <title>ThiSinh</title>
	    <meta name="description" content="đây là trang cho user" />
	    <meta charset="utf-8" />
	    <title>Home</title>
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/reset.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/trangchu.css" />
	</head>
		<%
		// Lấy ra username đăng nhập vào từ session
		String user = (String) session.getAttribute("username");
		LoginDAL userDAL = new LoginDAL();
		User u = userDAL.getUser(user);
		%>
<style>
/*==Reset CSS==*/
* {
  margin: 0;
  padding: 0;
}

/*==Style cơ bản cho website==*/
body {
  font-family: sans-serif;
  color: #333;
}
h3 {color: red}h3.a {color: white; text-shadow: black 0.1em 0.1em 0.2em}
/*==Style cho menu===*/
#menu ul {
  background: #1F568B;
  list-style-type: none;
  text-align: center;
}
#menu li {
  color: #f1f1f1;
  display: inline-block;
  width: 120px;
  height: 40px;
  line-height: 40px;
  margin-left: -5px;
}
#menu a {
  text-decoration: none;
  color: #fff;
  display: block;
}
#menu a:hover {
  background: #F1F1F1;
  color: #333;
}

/*==Dropdown Menu==*/
.sub-menu {
  display: none;
  position: absolute;
}
#menu li {
  position: relative;
}
#menu li:hover .sub-menu {
  display: block;
}
.sub-menu li {
  margin-left: 0 !important;
}

/*==Menu cấp 3==*/
.sub-menu > ul {
  display: none !mportant;
}
*{margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}
.box{
    background:#333;
    width:400px;
    height:400px;
    padding:10px;
    color:#fff;
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
		</style>
	<body>
		<div class="container">
			<div class="header">
	           <div class="usermenu"><span class="login"><%=u.getFullname()%> (<a href="TrangChuServlet">Đăng xuất</a>)</span> <!--#usermenu-->
  				<div id="menu">
  				<ul>
   					<li><a href="DienDanServlet">Diễn đàn</a></li>
    				<li><a href="#">Thi thử</a>
     			 	<ul class="sub-menu">
       			 	<li><a href="HienThiTrangMon?id=2&name=Math">Toán</a></li>
        			<li><a href="HienThiTrangMon?id=5&name=Physics">Vật Lý</a></li>
       				<li><a href="HienThiTrangMon?id=6&name=Geography">Địa lý</a></li>
      				</ul>
    				</li>
   			   <li><a href="#" onclick="document.getElementById('modal-wrapper').style.display='block'">Tạo bài đăng</a></li>
   			   <li><a href="MyPostServlet">Bài đăng của tôi</a></li>
  </ul>
</div>
				</div>
	           <div class="header-main">
	           		<div class="image"><a href="#"><img src="/DoAnThiTracNghiem/img/spkt-banner.jpg"></a></div><br>
	           		<div class="intro">
	           			<h3>HỆ THỐNG HỖ TRỢ ÔN THI ĐẠI HỌC</h3>
	           			<h4>BÀI TẬP LỚN MÔN LẬP TRÌNH WEB</h4>
	           		</div>
	           </div> <!--#header-main-->
			</div> <!--#header-->
			
			
			
		 	<div class="content">
		 	<img src="img/co.png" >
			<div class="footer">
				<div class="footer-main">
					<div class="about-us">
						<h2>VỀ CHÚNG TÔI</h2>
						<p>Trần Quang Anh - 16110009</p>
						<p>Đặng Thanh Tú - 16110253
</p>
					</div> <!--#about-us-->
					<div class="contact-us">
						<h2>ĐỊA CHỈ CÔNG TÁC</h2>
						<p>1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, Thành phố Hồ Chí Minh</p>
	           			<p>&#9742 Phone:  0933217987 - 0933217984</p>
	           			<p>&#9993 E-mail:  quanganh230398@gmail.com</p>
					</div> <!--#contact-us-->
				</div> <!--#footer-main-->
				<div class="footer-bottom">
					<p>Copyright © 2018, <a href="https://www.facebook.com/quanganh.tran.9849">Facebook Admin </a> .All Rights Reserved. Powered by TranQuangAnh.</p>
				</div>
			</div> <!--#footer-->
		 	</div> <!--#content-->
		</div> <!--#container-->
		<div id="modal-wrapper" class="modal"> 
 		<form name="form1" class="modal-content animate" action="CreatePost" method="post">       
   		 	<div class="imgcontainer">
    		  <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
    		  <img src="/DoAnThiTracNghiem/img/1.png" alt="Avatar" class="avatar">
    		  <h1 style="text-align:center">Tạo Bài Viết</h1>
   		    </div>

    		<div class="container">
      			<input type="text" placeholder="Enter Title" name="title">
      			<input type="text" placeholder="Enter Content" name="content">        
      		<button type="submit">Create</button> 
    		</div>    
  		</form> 
	</div>
	</body>
</html>
