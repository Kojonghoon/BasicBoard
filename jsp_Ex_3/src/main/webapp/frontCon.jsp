<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<a href="insert.do">����</a>
		<hr width=500>
		<a href="http://localhost:8080<%=request.getContextPath()%>/update.do">����</a>
		<hr width=500>
		<a href="http://localhost:8080/jsp_Ex_3/select.do">��ȸ</a>
		<hr width=500>
		<a href="<%=request.getContextPath()%>/delete.do">����</a>
	</center>
</body>
</html>