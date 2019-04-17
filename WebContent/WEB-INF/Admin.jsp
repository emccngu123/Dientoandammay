<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
  font-family: sans-serif;
  font-size: 15px;
}
#menu ul {
  background: #8AD385;
  width: 250px;
  padding: 0;
  list-style-type: none;
  text-align: left;
}
#menu li {
  width: auto;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #e8e8e8;
  padding: 0 1em;
}
#menu li a {
  text-decoration: none;
  color: #333;
  font-weight: bold;
  display: block;
}
#menu li:hover {
  background: #CDE2CD;
}
</style>
<body>
<div id="menu">
  <ul>
    <li><a href="DienDanServlet">Diễn đàn</a></li>
    <li><a href="QuanLyDeThiForward">Create Exam</a></li>
    <li><a href="ManagementForward">Management</a></li>
  </ul>
</div>
</body>
</html>