<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet,pack.GetAllValues,java.util.ArrayList" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8"><meta name="theme-color" content="#000000">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src='fac.jss'></script>
<link rel="stylesheet" type="text/css" href="psit.css">
<link rel="stylesheet" href="bootstrap.min.css" >
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: separate;
    margin-right:10%;
}
</style>
</head>
<body>
<%
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
  %>
<div class="logodiv">
<a href="index.jsp" style="text-decoration: none;color: white;">
<img class="logoimg" src="logo-with-name1.png" height="62" width="78">&nbsp&nbsp&nbsp&nbsp
<p class="logotxt">Pranveer Singh Institute of Technology</p></a>
</div>
<nav class="topbar">
<span id='exception' class="spanning" style="color:white;font-size: 26px;" onclick="openNav()">&#9776;</span>
<a href="index.jsp">Home</a>
<a href="#">Contact</a>
<a href="#">About</a>
<a style="float:right;" href="Logout.jsp">Log Out</a>
</nav>
<nav class="navbar">
<div id="mySidenav" class="sidenav">
<a href="index.jsp">Home</a>
<a href="#">Contact</a>
<a href="#">About</a>
<a href="Logout.jsp">Log Out</a>
</div></nav>
<div class='dmain'>
<center><table>
<tr>
<td><p>Id</p></td>
<td><p>Name</p></td>
<td><p>Dept</p></td>
<td><p>Area of expertise</p></td>
<td><p>Personal interest</p></td>
</tr>
<%
String uname = null;
try {
    uname = (String) session.getAttribute("UserId");
 
} catch (Exception e) {
}
if (uname == null) {
    response.sendRedirect("SessionExpired.html");
}

out.print("<center><h3>Welcome , "+uname+"</h3></center><br>");
%>
<%

GetAllValues gav = new GetAllValues();
ArrayList al = gav.values();
//out.print("size : "+al.size());
for(int i = 0; i < al.size(); i=i+5)
{
	out.print("<tr id='row"+i/5+"'>");
	out.print("<td>"+al.get(i)+"</td>");
	out.print("<td>"+al.get(i+1)+"</td>");
	out.print("<td>"+al.get(i+2)+"</td>");
	out.print("<td>"+al.get(i+3)+"</td>");
	out.print("<td>"+al.get(i+4)+"</td>");
	out.print("<td><a href='Del?id="+al.get(i)+"'>Delete</a></td>");
	out.print("<td><a href='EditUser.jsp?id="+al.get(i)+"&name="+al.get(i+1)+"&dept="+al.get(i+2)+"&aoe="+al.get(i+3)+"&pi="+al.get(i+4)+"'>Edit</a></td>");
	out.print("</tr>");
}

%>
</center></table>
<h5 style='margin-left:15%;'>To add faculty <a href='AddUser.jsp'>Click here....</a></h5><br><br>
<!-- <h5 style='margin-left:15%;'>To edit faculty details  <a href='EditUser'>Click here....</a></h5><br>
<h5 style='margin-left:15%;'>To remove faculty <a href='removeUser'>Click here....</a></h5> -->
</div>
<script src="bootstrap.min.js" >
</script>
</body>
</html>