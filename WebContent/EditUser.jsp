<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
    <meta name="theme-color" content="#000000">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript">

var a = parseInt(0);

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    
}
window.addEventListener('click', function(f){
  if ((!document.getElementById('exception').contains(f.target))){
    a=parseInt(1);
  }
})
window.addEventListener('click', function(e){
  if (a==1&&(!document.getElementById('mySidenav').contains(e.target))){
    document.getElementById("mySidenav").style.width = "0";
    //alert('WTF');
    a=parseInt(0);
  }
})
</script>
<link rel="stylesheet" type="text/css" href="psit.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap.min.css" >
</head>
<body>
<%
String uname = null;
try {
    uname = (String) session.getAttribute("UserId");
 
} catch (Exception e) {
}
if (uname == null) {
    response.sendRedirect("SessionExpired.html");
}

//out.print("<center><h3>Welcome , "+uname+"</h3></center><br>");
%>
	<div class="logodiv"><a href="index.jsp" style="text-decoration: none;color: white;"><img class="logoimg" src="logo-with-name1.png" height="62" width="78">&nbsp&nbsp&nbsp&nbsp<p class="logotxt">Pranveer Singh Institute of Technology</p></a></div>
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
</div>
</nav>
  <div class="dmain">
  <%
  int id = Integer.parseInt(request.getParameter("id"));
  String name = request.getParameter("name");
  String dept = request.getParameter("dept");
  String aoe = request.getParameter("aoe");
  String pi = request.getParameter("pi");
  %>
  <form onsubmit="return check(event)" action="EditUser" method="post">
 <table>
 <tr><p>Id : <input id="id" type="text" name="id" value=<%=id %> readonly="readonly"></p></tr>
<tr><p>Name : <input id="Name" type="text" name="name" value=<%=name %>></p></tr>
<tr><p>Department : <input id="Dept" type="text" name="dept" value=<%=dept %>></p></tr>
<tr><p>Area of expertise : <input id="AOE" type="text" name="aoe" value=<%=aoe %>></p></tr>
<tr><p>Personal interest : <input id="PI" type="text" name="pi" value=<%=pi %>></p></tr>
<tr><input type="submit" value="UPDATE"></tr>

<script>
function check()
{
var name = document.getElementById('Name').value;
var dept = document.getElementById('Dept').value;
var aoe = document.getElementById('AOE').value;
var pi = document.getElementById('PI').value;
if(name=='')
	{
	  alert("Enter the Name....");
	  return false;
	}
else if(dept=='')
	{
	alert("Enter the Department....");
	return false;
	}
else if(aoe=='')
	{
	alert("Enter the Area of expertise....");
	return false;
	}
else if(pi=='')
	{
	alert("Enter the Personal Interest....");
	return false;
	}
else
	{
	return true;
	}
}

</script>


</table>
</form>
  </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="bootstrap.min.js" ></script>
</body>
</html>