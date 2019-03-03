<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList,pack.GNames" buffer="1024kb" errorPage="error.jsp"
    %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
    <meta name="theme-color" content="#000000">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript" src="fac.jss">
</script>
<style type="text/css">
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  width:50%;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border: 1px solid #d4d4d4; 
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
  </style>
<link rel="stylesheet" type="text/css" href="psit.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap.min.css" >
</head>
<body>
<%
//Set standard HTTP/1.1 no-cache headers.
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");

//Set standard HTTP/1.0 no-cache header.
response.setHeader("Pragma", "no-cache");
//session.getAttribute("UserId")
if(((String)session.getAttribute("UserId"))==null)
	out.print("");
else
	response.sendRedirect("DashBoard.jsp");
%>
	<div class="logodiv"><a href="index.jsp" style="text-decoration: none;color: white;"><img class="logoimg" src="logo-with-name1.png" height="62" width="78">&nbsp&nbsp&nbsp&nbsp<p class="logotxt">Pranveer Singh Institute of Technology</p></a></div>
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
</div>
</nav>
<div class="info"><div class="mainDiv1"><h1>WELCOME!!!!</h1><h3>To The Faculty Information Portal</h3>
	<pre>This is a portal where User can search faculty details 
and view their respective details such as name, department, 
courses, area of expertise, and professional interest.


</pre></div><div height="5%"></div></div>
<div class="mainDiv">

	<div class="row">
	<div class="secDiv col-sm-6">
		<form onsubmit="return check2(event)" action="AdminLogin" method="post">
		<div style="z-index: 1;">
  <div class="row">
    <div class="col-md-5">
      <p style="font-size: 3vw;color: white;">UserId : </p>
    </div>
    <div class="col-md-7">
      <p style="font-size: 25px;color: white;"><input id='userid' style="width:100%" type="text" name="uid"/></p>
    </div>
  </div>
  <div class="row">
    <div class="col-md-5">
      <p style="font-size: 3vw;color: white;">Password : </p>
    </div>
    <div class="col-md-7">
      <p style="font-size: 25px;color: white;"><input id='password' style="width:100%" type="password" name="pass"/></p>
    </div>
  </div>
  <div class="row">
    <div class="col-md-5">
      
    </div>
    <div class="col-md-4 lol">
      <input class="lobtn" type="submit" value="LOGIN"/>
    </div>
    <div class="col-md-3">
      <!--<input style="width:100%" type="button" value="RESET"/>-->
    </div>
  </div>
  
</div>
</form>
</div>
<div class="col-sm-6">
<div style="margin-top:10%;">
<form onsubmit="return check(event)" action="Search.jsp" method="post" autocomplete="off">
<input style="display: none;" type="text" name="hid" value="">
<div class="autocomplete"><center>
<table><tr>
<td><input id="myInput" type="text"  name="Search" placeholder="Search Faculty Details........" height="50"></td>
<td><input style="background-color: white;margin-top:12%;" type="image" src="Search.png" alt="Submit" width="35" height="35" href="Search.jsp"></td>
<%@ page import="pack.GNames"%>
<script>

function check2() {
	var a = document.getElementById('userid').value;
	var b = document.getElementById('password').value;
	if(a=="")
		{
		 alert("Enter UserId.....");
		 return false;
		}
	else if(b=="")
		{
		 alert("Enter Password.....");
		 return false;
		}
		else
			return true;
}

function check() {
	var a = document.getElementById('myInput').value;
	if(a=="")
		{
		 alert("Enter Something in Search box");
		 return false;
		}
	else 
		{
		 return true;
		}
}

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      var firstval = 0;
      var incval = 1 ;
      var idholder = document.getElementById('lol').value;
      //alert(idholder);
      if(idholder>1)
    	  {
    	  	firstval = idholder-2;
    	  	incval = 4;
    	  }
      
      for (i = firstval; i < arr.length; i=i+incval) {
        /*check if the item starts with the same letters as the text field value:*/
        var temp = i;
        var flag = 0;
        for(;temp>firstval;)
        	{
        		temp=temp-incval;
        		if(arr[temp].toLowerCase()==arr[i].toLowerCase())
        			{
        				flag=1;
        				//alert(flag);
        			}
        	}
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()  && flag==0) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}
<%
GNames gn = new GNames();
ArrayList al = gn.values();
out.println("var countries = [];");
for(int i=0;i<al.size();i++)
{
	out.println("countries["+i+"]=\""+al.get(i)+"\";");
}
//out.println("alert(al);");
//out.println("</script>");
%>
/*An array containing all the country names in the world:*/

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>
</tr>
<tr>
<td>
<select id='lol' name="dd">
  <option value="1">All</option>
  <option value="2">Name</option>
  <option value="3">Department</option>
  <option value="4">Area Of Expertise</option>
  <option value="5">Personal Interest</option>
</select>
</td>
</tr></table>
</center></div>
</form>
</div>
</div>
	</div>

</div>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="bootstrap.min.js" ></script>
</body>
</html>
</body>
</html>