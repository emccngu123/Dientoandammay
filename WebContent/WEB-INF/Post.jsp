<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAL.LoginDAL"%>
<%@page import="BEAN.User"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>

<html lang="vi">
	<head>
	    <title>ThiSinh</title>
	    <meta name="description" content="đây là trang chủ" />
	    <meta charset="utf-8" />
	    <title>Home</title>
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/reset.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/trangchu.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/Blockquote.css" />
	</head>
		<%
		// Lấy ra username đăng nhập vào từ session
		String user = (String) session.getAttribute("username");
		LoginDAL userDAL = new LoginDAL();
		User u = userDAL.getUser(user);
		%>
<style>
.txtdeepshadow {
  text-align: center;
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 20px;
  height: 40px;
  padding-top: 10px;
  color: #e0dfdc;
  background-color: #333;
  letter-spacing: .1em;
  text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0, 0, 0, 0.9);
}
.Dislay {
  height: 80px;
  width: 600px;
}
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
h3 {color: red}h3.a {color: white; text-shadow: black 0.1em 0.1em 0.2em}
</style>
		<script>
function validate() // còn ktra các box ko đc trống, kiểm tra username
{  
var cmt = document.form.comment.value; 
	if (cmt ==null || cmt=="" ) 
	{  
		alert("Chưa nhập bình luận !");  
		return false;  
	} 
}
	</script>
	<body>
		<div class="container">
			<div class="header">
	           <div class="usermenu"><span class="login"><%=u.getFullname()%> (<a href="TrangChuServlet">Đăng xuất</a>)</span> <!--#usermenu-->
				<div id="menu">
  				<ul>
   					<li><a href="DienDanServlet">Diễn đàn</a></li>
   				</ul>
   				</div>
				</div>
	           <div class="header-main">
	           		<div class="image"><a href="#"><img src="/DoAnThiTracNghiem/img/spkt-banner.jpg"></a></div>
	           		<div class="intro">
	           			<h3>HỆ THỐNG HỖ TRỢ ÔN THI ĐẠI HỌC</h3>
	           			<h4>BÀI TẬP LỚN MÔN LẬP TRÌNH WEB</h4>
	           		</div>
	           </div> <!--#header-main-->
			</div> <!--#header-->
			
			
			
		 	<div class="content">
			<h3>"${Title}"</h3><br>
			
			<c:forEach items = "${lUserRep}" var="user">
					<blockquote class="sunflower">					
					Người đăng: ${user.getUser()}<br>
					Tin nhắn: ${user.message}<br>
					</blockquote>
			</c:forEach>
			<form name="form" action="AddComment" method="post" onsubmit="return validate()"> 
			 <br>
			 <br>
			 Trả lời:<br>
			  <input type="text" name ="comment" class="Dislay"><br>
			 <input type="submit" value ="Gửi" >
			 <INPUT TYPE="text" NAME="idPost" value="${idPost}" style="display: none">
			 <br>
			 <br>
			 </form>
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
					<p>Copyright © 2018, <a href="https://www.facebook.com/quanganh.tran.9849">Facebook Admin </a> .All Rights Reserved. Powered by TranQuangAnh.</p>
				</div>
			</div> <!--#footer-->
		 	</div> <!--#content-->
		</div> <!--#container-->
	</body>
</html>
