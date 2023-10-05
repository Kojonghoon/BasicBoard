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
		<a href="insert.do">삽입</a>
		<hr width=500>
		<a href="http://localhost:8080<%=request.getContextPath()%>/update.do">수정</a>
		<hr width=500>
		<a href="http://localhost:8080/jsp_Ex_3/select.do">조회</a>
		<hr width=500>
		<a href="<%=request.getContextPath()%>/delete.do">삭제</a>
	</center>
</body>
</html>