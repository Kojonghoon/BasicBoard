<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 변수 선언 -->
<c:set var="num1" value="10" />
<c:set var="num2" value="5" />
<c:set var="res" value="${num1*num2}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${num1}과 ${num2}의 곱은 ${res}<br />
	<c:out value="${res}" /><br />

	<c:catch var="exception">
		<%=10 / 0%>
	</c:catch>
	<br />
	<c:out value="${exception}" />
	<hr/>
	
	<c:if test="${10+10==100}">
		참
	</c:if>
	
	<c:if test="${10+10 !=100}">
		거짓
	</c:if>
	<hr/>
	
	<c:forEach var="aa" begin="0" end="10" step="2">
		<font size=${aa}> 안녕하세요!!!</font><br />
	</c:forEach>
</body>
</html>