<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("aa","abcd");
		request.setAttribute("xy","1234");
		
		response.sendRedirect("RequestObj");
	%>
</body>
</html>