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
	�̸�:<jsp:getProperty name="person" property="name"/><br/> 
	���̵�:<jsp:getProperty name="person" property="id"/><br/> 
	��й�ȣ:<jsp:getProperty name="person" property="pw"/>
	
	<hr/>
	�̸�: ${person.name}<br/>
	���̵�: ${person.id} <br/>
	��й�ȣ: ${person.pw}
</body>
</html>