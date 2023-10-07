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
		<h2>리스트</h2>
		<hr width="500" color="blue" size="10">
		<table width="800" cellpadding="0" cellspacing="0" border=1>
			<!-- 제목 -->
			<tr align="center">
				<td width="100">번호</td>
				<td>이름</td>
				<td width="350">제목</td>
				<td>날짜</td>
				<td>조회</td>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.bId}</td>
					<td>${dto.bName}</td>
					<td>
						<c:forEach begin="1" end="${dto.bIndent}">ㄴ</c:forEach>
						<a href="view.do?bId=${dto.bId}">${dto.bTitle}</a>
					</td>
					<td>${dto.bDate}</td>
					<td>${dto.bHit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right"><a href="write_view.do">글쓰기</a></td>
			</tr>
		</table>
	</center>
</body>
</html>