<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="person" class="jsp_Ex_3.Person" scope="page"/>
	<jsp:setProperty name="person" property="name" value="ȫ�浿" />
	<jsp:setProperty name="person" property="id" value="test" />
	<jsp:setProperty name="person" property="pw" value="test11" />
	<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="post_elObj.jsp" method="get">
		���̵� : <input type ="text" name ="id"/><br/>
		��й�ȣ : <input type ="password" name ="pw"/><br/>
		<input type="submit" value="�α���"/>
	</form>
	
	<%
		application.setAttribute("appName", "appValue");
		session.setAttribute("sessionName", "sessionValue");
		pageContext.setAttribute("pageName", "pageValue");
		request.setAttribute("reqname", "reqValue");
	%>
</body>
</html>