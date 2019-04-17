<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAL.LoginDAL"%>
<%@page import="BEAN.User"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<html lang="vi">
	<head>
	    <title>TrangQuanLy</title>
	    <meta name="description" content="đây là trang chủ" />
	    <meta charset="utf-8" />
	    <title>Home</title>
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/reset.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/trangchu.css" />
	    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">  
	</head>
		<%
		// Lấy ra username đăng nhập vào từ session
		String user = (String) session.getAttribute("username");
		LoginDAL userDAL = new LoginDAL();
		User u = userDAL.getUser(user);
		%>
		<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
  		<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<style>
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
h3 {color: red}h3.a {color: white; text-shadow: black 0.1em 0.1em 0.2em}
 table, td, th{
                border: 1px solid green;
                font-family: 'Oxygen', sans-serif;
        }
        th{
                background-color:green;
                color: white;
        }
        body{
                text-align: center;
        }
        .container{
                margin-left: auto;
                margin-right: auto;
                width: 100%;
        }
</style>

	<body>
		<div class="container">
			<div class="header">
	           <div class="usermenu"><span class="login"><%=u.getFullname()%> (<a href="TrangChuServlet">Đăng xuất</a>)</span> <!--#usermenu-->
  				<div id="menu">
  				<ul>
   					
    				<li><a href="#" id="showTableUser">Danh sách User</a>
    				<li><a href="#" id="showTableQuestionMath" >Câu hỏi Toán</a>
    				<li><a href="#" id="showTableQuestionPhysic" >Câu hỏi Lý</a>
    				<li><a href="#" id="showTableQuestionGeography" >Câu hỏi Địa</a>
       			 	<li><a href="#" onclick="document.getElementById('modal-wrapper').style.display='block'">+</a></li>
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
		 	<h3>${message}</h3>
		 	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
			<script type="text/javascript" src="js/glm-ajax.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
                $("#tablediv").hide();
                $("#showTableUser").click(function(event){
                        $.ajax({
                                type: "get",
                                url : "GetAllThisinh",
                                success: function(responseJson){

                                        if(responseJson!=null){
                                                $("#productTable").find("tr:gt(0)").remove();
                                                var table1 = $("#productTable");
                                                $.each(responseJson, function(key, value){
                                                        var rowNew = $("<tr><td></td><td></td></tr>");
                                                        rowNew.children().eq(0).text(value['username']);
                                                        rowNew.children().eq(1).text(value['fullname']);
                                                        rowNew.appendTo(table1);
                                                });             
                                        }
                                }
                        })                      
                        $("#tablediv").show();
                        $("#tablediv1").hide();
                })
        });
</script>	
  <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
  
<script type="text/javascript">
        $(document).ready(function(){
        	$("#tablediv1").hide();
                $("#showTableQuestionMath").click(function(event){
                	$.ajax({
                        type: "post",
                        url : "GetAllQuestion",
                        data: {number : "2"},
                        success: function(responseJson){

                                if(responseJson!=null){
                                        $("#productTable1").find("tr:gt(0)").remove();
                                        var table1 = $("#productTable1");
                                        $.each(responseJson, function(key, value){
                                        	var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                            rowNew.children().eq(0).text(value['idQuest']);
                                            rowNew.children().eq(1).text(value['questname']);
                                            rowNew.children().eq(2).text(value['a']);
                                            rowNew.children().eq(3).text(value['b']);
                                            rowNew.children().eq(4).text(value['c']);
                                            rowNew.children().eq(5).text(value['d']);
                                            rowNew.children().eq(6).text(value['answer']);
                                            rowNew.children().eq(7).text(value['type']);
                                            rowNew.appendTo(table1);
                                        });             
                                }
                        }
                })                      
                $("#tablediv1").show();
                $("#tablediv").hide();
        })
});
</script>
<script type="text/javascript">
        $(document).ready(function(){
        	$("#tablediv1").hide();
                $("#showTableQuestionGeography").click(function(event){
                	$.ajax({
                        type: "post",
                        url : "GetAllQuestion",
                        data: {number : "5"},
                        success: function(responseJson){

                                if(responseJson!=null){
                                        $("#productTable1").find("tr:gt(0)").remove();
                                        var table1 = $("#productTable1");
                                        $.each(responseJson, function(key, value){
                                        	var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                            rowNew.children().eq(0).text(value['idQuest']);
                                            rowNew.children().eq(1).text(value['questname']);
                                            rowNew.children().eq(2).text(value['a']);
                                            rowNew.children().eq(3).text(value['b']);
                                            rowNew.children().eq(4).text(value['c']);
                                            rowNew.children().eq(5).text(value['d']);
                                            rowNew.children().eq(6).text(value['answer']);
                                            rowNew.children().eq(7).text(value['type']);
                                            rowNew.appendTo(table1);
                                        });             
                                }
                        }
                })                      
                $("#tablediv1").show();
                $("#tablediv").hide();
        })
});
</script>
<script type="text/javascript">
        $(document).ready(function(){
        	$("#tablediv1").hide();
                $("#showTableQuestionPhysic").click(function(event){
                	$.ajax({
                        type: "post",
                        url : "GetAllQuestion",
                        data: {number : "6"},
                        success: function(responseJson){

                                if(responseJson!=null){
                                        $("#productTable1").find("tr:gt(0)").remove();
                                        var table1 = $("#productTable1");
                                        $.each(responseJson, function(key, value){
                                        	var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                            rowNew.children().eq(0).text(value['idQuest']);
                                            rowNew.children().eq(1).text(value['questname']);
                                            rowNew.children().eq(2).text(value['a']);
                                            rowNew.children().eq(3).text(value['b']);
                                            rowNew.children().eq(4).text(value['c']);
                                            rowNew.children().eq(5).text(value['d']);
                                            rowNew.children().eq(6).text(value['answer']);
                                            rowNew.children().eq(7).text(value['type']);
                                            rowNew.appendTo(table1);
                                        });             
                                }
                        }
                })                      
                $("#tablediv1").show();
                $("#tablediv").hide();
        })
});
</script>
	 <div id="tablediv">
                <table cellpadding="0" id="productTable">
                        <tr>
                                <th scope="col">User Name</th>
                                <th scope="col">Full Name</th>
                        </tr>
                </table>
       		 </div>
		 	<div id="tablediv1">
                <table cellpadding="0" id="productTable1">
               		<th scope="col">ID</th>
                 	<th scope="col">Câu hỏi</th>
                 	<th scope="col">Đáp án a</th>
                 	<th scope="col">Đáp án b</th>
                 	<th scope="col">Đáp Án c</th>
                 	<th scope="col">Đáp Án d</th>
                 	<th scope="col">Kết quả</th>
                 	<th scope="col">Mức độ</th>              	
                </table>
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
					<p>Copyright © 2018, <a href="https://www.facebook.com/quanganh.tran.9849">Facebook Admin </a> .All Rights Reserved. Powered by TranQuangAnh.</p>
				</div>
			</div> <!--#footer-->
		 	</div> <!--#content-->
		</div> <!--#container-->
		<div id="modal-wrapper" class="modal"> 
 		<form name="form" class="modal-content animate" action="ThemCauHoi" method="post">       
   		 	<div class="imgcontainer">
    		  <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
    		  <h1 style="text-align:center">Nhập Câu Hỏi</h1>
   		    </div>
			<h1 style="text-align:center">Môn:</h1>
    		<div class="container">
    			<div class="select" style="text-align:center">
					<select id="class" name="classs" >
					<option value="2">Math</option>
					<option value="6">Physics</option>
					<option value="5">Geography</option>
					</select>
				</div> <!--#select-->
      			<input type="text" placeholder="Enter Question" name="name">
      			<input type="text" placeholder="Enter Option A" name="a">
      			<input type="text" placeholder="Enter Option B" name="b"> 
      			<input type="text" placeholder="Enter Option C" name="c">
      			<input type="text" placeholder="Enter Option D" name="d">
      			<h1 style="text-align:center">Kết quả</h1>
      			<div class="select" style="text-align:center" >
					<select id="result" name="result">
					<option>a</option>
					<option>b</option>
					<option>c</option>
					<option>d</option>
					</select>
					<h1 style="text-align:center">Mức độ:</h1>
				</div> <!--#select-->
      			     <div class="select" style="text-align:center">
					<select id="chon1" name="type">
					<option>easy</option>
					<option>Medium</option>
					<option>Hard</option>
					</select>
				</div> <!--#select-->
      		<button type="submit">ADD</button>      
    		</div>    
  		</form> 
	</div>
	</body>
</html>
