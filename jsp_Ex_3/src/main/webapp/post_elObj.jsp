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
		String id1 = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	���̵� : <%= id1 %><br/>
	��й�ȣ : <%= pw %><br/>
	<hr/>

	���̵� : ${param.id}		<br/>
	��й�ȣ : ${param.pw}		<br/>
	
	���̵� : ${param["id"]}	<br/>
	��й�ȣ : ${param["pw"]}	<br/>
	<hr/>
	
	applicationScope : ${applicationScope.appName}	<br/>
	sessionScope : ${sessionScope.sessionName}		<br/>
	pageScope : ${pageScope.pageName}				<br/>
	requestScope : ${requestScope.reqName }			<br/>
	<hr/>
	
	- context �ʱ�ȭ �Ķ���� <br/>
	${initParam.cont_1}<br/>
	${initParam.cont_2}<br/>
	${initParam.cont_3}
	
	
	
	
</body>
</html>