<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="pack.GetAllValues,java.util.ArrayList" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.divOne{
		border: 2px solid #d4d4d4;
		margin-bottom: 10px;
	}
	.divSec{
		border: 2px solid #d4d4d4;
		padding: 40px 40px 40px 40px;
		margin-left:  10%;
		margin-top:  10%;
		margin-right:  10%;
		margin-bottom:  10%;
	}
	.pre1{
		font-size: medium;
		margin-left:  8%;
		margin-top:  2%;
		margin-right:  2%;
		margin-bottom:  2%;
	}
@media(max-width: 450px) {
.divOne{
		border: 2px solid #d4d4d4;
		margin-bottom: 5px;
	}
	.divSec{
		border: 2px solid #d4d4d4;
		padding: 20px 10px 20px 10px;
		margin-left:  3%;
		margin-top:  5%;
		margin-right:  5%;
		margin-bottom:  5%;
	}
	.pre1{
		font-size: medium;
		margin-left:  4%;
		margin-top:  2%;
		margin-right:  2%;
		margin-bottom:  2%;
}
</style>
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
</nav>
<nav class="navbar">
<div id="mySidenav" class="sidenav">
<a href="index.jsp">Home</a>
<a href="#">Contact</a>
<a href="#">About</a>
</div></nav>
<div class='dmain'>


<%
String search = request.getParameter("Search");
int dd = Integer.parseInt(request.getParameter("dd"))-1;
GetAllValues gav = new GetAllValues();
ArrayList al = gav.values1(search, dd);
if(al.size()>0)
{
	out.println("<h1>Search Results......</h1><div class=\"divSec\">");

for(int i=0;i<al.size();i=i+4)
{
	out.println("<div class='divOne'>");
	out.println("<pre class='pre1'>");
	out.println("Name : "+al.get(i));
	out.println("Department : "+al.get(i+1));
	out.println("Area of expertise : "+al.get(i+2));
	out.print("Personal interest : "+al.get(i+3));
	out.println("</pre>");
	out.println("</div>");
}
out.println("</div>");
}
else
{
	out.println("<h1>No Search Results......</h1><br><br><a style='text-decoration:none;' class='btn btn-primary bg-dark' href='index.jsp'>Back To Home</a><div class=\"divSec\"></div>");
}

%>



</div>
<script src="bootstrap.min.js" >
</script>
</body>
</html>