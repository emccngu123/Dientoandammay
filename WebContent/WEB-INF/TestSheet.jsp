<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Exam</title>
</head>
<h2>${msg}</h2>
<% int i =1;
 String a = (String) session.getAttribute("error");
%>
   <script type="text/javascript">
        function noBack() {
        	window.forward("trangchu.jsp");
        }
    </script>
<script language="javascript">
// Created by: Neill Broderick :: http://www.bespoke-software-solutions.co.uk/downloads/downjs.php

var mins
var secs;

function cd() {
 	mins = 1 * ${time}; // change minutes here
 	secs = 0 + s(":01"); // change seconds here (always add an additional second to your total)
 	redo();
}

function s(obj) {
 	for(var i = 0; i < obj.length; i++) {
  		if(obj.substring(i, i + 1) == ":")
  		break;
 	}
 	return(obj.substring(i + 1, obj.length));
}

function dis(mins,secs) {
 	var disp;
 	if(mins <= 9) {
  		disp = " 0";
 	} else {
  		disp = " ";
 	}
 	disp += mins + ":";
 	if(secs <= 9) {
  		disp += "0" + secs;
 	} else {
  		disp += secs;
 	}
 	return(disp);
}

function redo() {
 	secs--;
 	if(secs == -1) {
  		secs = 59;
  		mins--;
 	}
 	document.cd.disp.value = dis(mins,secs); // setup additional displays here.
 	if((mins == 0) && (secs == 0)) {
  		window.alert("Time is up. Press OK to continue."); // change timeout message as required
  		// window.location = "yourpage.htm" // redirects to specified page once timer ends and ok button is pressed
 	} else {
 		cd = setTimeout("redo()",1000);
 	}
}

function init() {
  cd();
}
window.onload = init;
</script>
<body>
 	<form name="cd">
			<input id="txt" readonly="true" type="text" border="0" name="disp">
	</form>
	<form action="ResultController" method= get ">
	<table>
		<c:forEach items = "${listCauhoi}" var="Cauhoi">
<%-- 			<tr>
			    <td><% out.println(i); %>)</td>
				<tr><td>${Cauhoi.questname}</td></tr>
				<tr><td>${Cauhoi.a}</td></tr>
				<tr><td>${Cauhoi.b}</td></tr>
				<tr><td>${Cauhoi.c}</td></tr>
				<tr><td>${Cauhoi.d}</td></tr>
				<tr><td>${Cauhoi.answer}</td></tr>
				<tr><td>"=========================================================="</td></tr>
				<% i++; %>
			</tr> --%>
				<p><% out.println(i); %>)${Cauhoi.questname}</p>
	 		<input type="radio" name="ans[<%=i%>]" value="a"> ${Cauhoi.a}
	 		<br>
	 		<input type="radio" name="ans[<%=i%>]" value="b"> ${Cauhoi.b}
	 		<br>
	 		<input type="radio" name="ans[<%=i%>]" value="c"> ${Cauhoi.c}
	 		<br>
	 		<input type="radio" name="ans[<%=i%>]" value="d"> ${Cauhoi.d}
	 		<br>
	 		<% i++; %>
		</c:forEach>
	</table>
	
</body>
<INPUT TYPE="text" NAME="firstbox" value="${numberQuestion}" style="display: none">
<INPUT TYPE="text" NAME="secondbox" value="${time}" style="display: none">
				<div class=create>
					
						<input type="submit" name = "name" value= "Submit">
				
				</div> <!--#create-->
	</form>
				
				
</html>