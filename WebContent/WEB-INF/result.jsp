<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="BEAN.User"%>
<%@page import="DAL.LoginDAL"%>
<!DOCTYPE html>
<html lang="vi">
	<head>
	    <title>ResultCSharp</title>
	    <meta name="description" content="đây là trang kết quả môn C#" />
	    <meta charset="utf-8" />
	    <link rel="stylesheet" href="/ExamOnlineDA1/css/reset.css" />
	    <link rel="stylesheet" href="/ExamOnlineDA1/css/quiz.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/trangchu.css" />
	</head>
	<%
		// Lấy ra username đăng nhập vào từ session
		String user = (String) session.getAttribute("username");
		LoginDAL userDAL = new LoginDAL();
		User u = userDAL.getUser(user);
		%>
	<body>
		<div class="container">
			<div class="header">
	           <div class="usermenu"><span class="login"><%=u.getFullname()%> (<a href="TrangChuServlet">Đăng xuất</a>)</span></div>  <!--#usermenu-->
	           <div class="header-main">
	           		<div class="image"><a href="#"><img src="/DoAnThiTracNghiem/img/spkt-banner.jpg"></a></div><br>
	           		<div class="intro">
	           			<h3>HỆ THỐNG HỖ TRỢ ÔN THI ĐẠI HỌC</h3>
	           			<h4>ĐỒ ÁN LẬP TRÌNH WEB</h4>
	           		</div>
	           </div> <!--#header-main-->
			</div> <!--#header-->
		 	<div class="content">
				<c:forEach items="${listcorrectanswer}" var = "listcorrectanswer">
					<c:forEach items = "${listansweruser}" var = "listansweruser">
						<c:if test="${listcorrectanswer.number == listansweruser.number}">
							<c:if test="${listcorrectanswer.answer == 'a'}">
									<c:if test="${listansweruser.answer == 'a'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>									
									</c:if>
									
									<c:if test="${listansweruser.answer == 'b'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'c'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'd'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/incorrect.png">
								 		<br>			
									</c:if>
									
							</c:if>
							<c:if test="${listcorrectanswer.answer == 'b'}">
									<c:if test="${listansweruser.answer == 'a'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>									
									</c:if>
									
									<c:if test="${listansweruser.answer == 'b'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'c'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'd'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/incorrect.png">
								 		<br>			
									</c:if>
							</c:if>
							<c:if test="${listcorrectanswer.answer == 'c'}">
									<c:if test="${listansweruser.answer == 'a'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.b} 
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>									
									</c:if>
									
									<c:if test="${listansweruser.answer == 'b'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'c'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.d}
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'd'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/correct.png">
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/incorrect.png">
								 		<br>			
									</c:if>
							</c:if>
							<c:if test="${listcorrectanswer.answer == 'd'}">
									<c:if test="${listansweruser.answer == 'a'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.b} 
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/correct.png">
								 		<br>									
									</c:if>
									
									<c:if test="${listansweruser.answer == 'b'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/correct.png">
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'c'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c} <img alt="" src="img/incorrect.png">
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/correct.png">
								 		<br>			
									</c:if>
									
									<c:if test="${listansweruser.answer == 'd'}">
							 			<p>${listcorrectanswer.number}.${listcorrectanswer.questname}</p>
								 		${listcorrectanswer.a}
								 		<br>
								 		${listcorrectanswer.b}
								 		<br>
								 		${listcorrectanswer.c}
								 		<br>
								 		${listcorrectanswer.d} <img alt="" src="img/correct.png">
								 		<br>			
									</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</c:forEach>					
				<br>
			<form action="LoginFormServlet" method="post">
			<INPUT TYPE="text" NAME="uname" value="${username}" style="display: none">
			<INPUT TYPE="text" NAME="psw" value="${password}" style="display: none">
			<INPUT TYPE="submit" NAME="name" value="Back">
			</form>
		 	</div> <!--#content-->
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
	           			<p>&#9993 E-mail: quanganh230398@gmail.com</p>
					</div> <!--#contact-us-->
				</div> <!--#footer-main-->
				<div class="footer-bottom">
					<p>Copyright © 2018, <a href="https://www.facebook.com/quanganh.tran.9849">Facebook Admin </a> .All Rights Reserved. Powered by TranQuangAnh.</p>
				</div>
			</div> <!--#footer-->
		</div> <!--#container-->
	</body>
</html>

