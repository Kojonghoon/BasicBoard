<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
if (session.getAttribute("valid") != null) {
%>
<jsp:forward page="ad_main.jsp"></jsp:forward>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<hr width=500 color="green">
		<h2>�α���</h2>
		<hr width=500 color="green">
		<form action="loginOk.jsp" method="post">
			���̵� :<input type="text" name="id" value="<%if (session.getAttribute("id") != null)
	out.println(session.getAttribute("id"));%>"><br /> ��й�ȣ : <input type="password" name="pw"><br /> <input type="submit" value="�α���">
		</form>
	</center>
</body>
</html>