<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${100}
	<br /> ${11.99999}
	<br /> ${"문자열" }
	<br /> ${false }
	<br />

	<hr>
	${10+10}<br /> 
	${10-10}<br /> 
	${10*2}<br /> 
	${10/2}<br /> 
	${10>20}<br /> 				<!-- false -->
	${10<20}<br />				<!-- true -->
	<hr> 
	${10>20?1:2}<br />			<!-- 2 -->
	${(10>20)||(10<20)}<br />	<!-- true -->
</body>
</html>