<%@page import="pack.GetNames"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" errorPage="error.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
GetNames gn = new GetNames();
ArrayList al = gn.values();
out.print("<script>var name="+al+";</script>");
%>
<%=al %>
</body>
</html>