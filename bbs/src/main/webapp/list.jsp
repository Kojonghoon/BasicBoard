<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<hr width="500" color="blue" size="10">
		<h2>����Ʈ</h2>
		<hr width="500" color="blue" size="10">
		<table width="800" cellpadding="0" cellspacing="0" border=1>
			<!-- ���� -->
			<tr align="center">
				<td width="100">��ȣ</td>
				<td>�̸�</td>
				<td width="350">����</td>
				<td>��¥</td>
				<td>��ȸ</td>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.bId}</td>
					<td>${dto.bName}</td>
					<td>
						<c:forEach begin="1" end="${dto.bIndent}">��</c:forEach>
						<a href="view.do?bId=${dto.bId}">${dto.bTitle}</a>
					</td>
					<td>${dto.bDate}</td>
					<td>${dto.bHit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right"><a href="write_view.do">�۾���</a></td>
			</tr>
		</table>
	</center>
</body>
</html>