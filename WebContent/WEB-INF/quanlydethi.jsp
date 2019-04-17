<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="vi">
	<head>
	    <title>QuanLyDeThi</title>
	    <meta name="description" content="đây là trang cho quản lý đề thi" />
	    <meta charset="utf-8" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/reset.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/menu.css" />
	    <link rel="stylesheet" href="/DoAnThiTracNghiem/css/quanlydethi.css" />
	    <style type="text/css">
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
                width: 40em;
        }
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/glm-ajax.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
                $("#tablediv").hide();
                $("#showTable").click(function(event){
                        $.ajax({
                                type: "post",
                                url : "GetAllExamOfClass",
                                data: {number : $('#chon').val()},
                                success: function(responseJson){
                                        if(responseJson!=null){
                                                $("#productTable").find("tr:gt(0)").remove();
                                                var table1 = $("#productTable");
                                                $.each(responseJson, function(key, value){
                                                        var rowNew = $("<tr><td></td><td></td><td></td><td></td></tr>");
                                                        rowNew.children().eq(0).text(value['idTest']);
                                                        rowNew.children().eq(1).text(value['timeLimit']);
                                                        rowNew.children().eq(2).text(value['numberQuestion']);
                                                        rowNew.children().eq(3).text(value['username']);
                                                        rowNew.appendTo(table1);
                                                });             
                                        }
                                }
                        })                      
                        $("#tablediv").show();
                })
        });
</script>
<script>
function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : event.keyCode;
       if(charCode == 59 || charCode == 46)
        return true;
       if (charCode > 31 && (charCode < 48 || charCode > 57))
          return false;
       return true;
    }
</script>
<script>  
function validate() 
{  
var socaude = document.form.easy.value; 
var socautrungbinh = document.form.medium.value; 
var socaukho = document.form.hard.value;   
var thoigianlambai = document.form.time.value; 
if (socaude>5) 
{  
	alert("Moi cau hoi chi co the chon toi da 5 cau");  
	return false;  
} 
else if (socautrungbinh>5) 
{  
	alert("Moi cau hoi chi co the chon toi da 5 cau");  
	return false;  
} 
else if (socaukho>5) 
{  
	alert("Moi cau hoi chi co the chon toi da 5 cau");  
	return false;  
} 
else if(thoigianlambai == null || thoigianlambai == "") 
{  
	alert("Chua nhap thoi gian cua bai test !");  
	return false;  
}  
}  
</script>
	</head>
 
 	<body>
<form name="form" action="XemTruocDeServlet" method="post" onsubmit="return validate()">
		<div class="container">

			<div class="menu">
				<ul>
					<li><h2>Quản lý đề thi</h2></li>
					<li><a href="#">Admin: <%=session.getAttribute("username") %></a></li>
					<li><a href="TrangChuServlet">Đăng Xuất</a></li>
				</ul>
			</div> <!--#menu-->

			<div class="content">
				<div class="select" >
					<select id="chon" name="chon">
					<option>Math</option>
					<option>Physics</option>
					<option>Geography</option>
					</select>

				</div> <!--#select-->
        <input type="button" value="Xem các đề hiện có" id="showTable"/>
        <div id="tablediv">
                <table cellpadding="0" id="productTable">
                        <tr>
                                <th scope="col">Mã đề</th>
                                <th scope="col">Thời lượng làm bài</th>
                                <th scope="col">Tổng số câu hỏi</th>
                                <th scope="col">ID người tạo</th>
                        </tr>
                </table>
        </div>

				<div class=create>
						Số câu dễ: <input type="text" name="easy" onkeypress=" return isNumberKey(event)"><br>
						Số câu thường: <input type="text" name="medium" onkeypress=" return isNumberKey(event)"><br>
						Số câu khó: <input type="text" name="hard" onkeypress=" return isNumberKey(event)"><br>
						Thời lượng(phút): <input type="text" name="time" onkeypress=" return isNumberKey(event)"><br>
						<input type="submit" value="Xem trước">
				</div> <!--#create-->
       

			</div> <!--#content-->

		</div> <!--#container-->
</form>
 	</body>
</html>
