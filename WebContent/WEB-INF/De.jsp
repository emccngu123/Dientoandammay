<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Xem trước đề</title>
<script>
function goBack() {
  window.history.back()
}
</script>
</head>
Đề thi môn "${className}"
<% int i =1; %>
 
<body>
	<table>
		<c:forEach items = "${listCauhoi}" var="Cauhoi">
			<tr>
			    <td><% out.println(i); %>)</td>
				<tr><td>${Cauhoi.questname}</td></tr>
				<tr><td>${Cauhoi.a}</td></tr>
				<tr><td>${Cauhoi.b}</td></tr>
				<tr><td>${Cauhoi.c}</td></tr>
				<tr><td>${Cauhoi.d}</td></tr>
				<tr><td>"=========================================================="</td></tr>
				<% i++; %>
			</tr>
		</c:forEach>
	</table>
</body>

				<div class=create>
					<form action="TaoDe" method= post ">
						<input type="submit" name = "name" value= "Tạo đề">
					</form>
				</div> <!--#create-->
				
<button onclick="goBack()">Trở lại</button>
</html>