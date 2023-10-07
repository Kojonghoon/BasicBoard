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
		<hr width="500" size="10" color="green">
		<h2>답변 쓰기</h2>
		<hr width="500" size="10" color="green">
		<table width="800" cellpadding="0" cellspacing="0" border="1">
			<form action="reply.do" method="post">
			<input type="hidden" name="bId" value="${replyView.bId}">
			<input type="hidden" name="bGroup" value="${replyView.bGroup}">
			<input type="hidden" name="bStep" value="${replyView.bStep}">
			<input type="hidden" name="bIndent" value="${replyView.bIndent}">
				<tr>
					<td>번호</td>
					<td>${replyView.bId}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${replyView.bHit}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="bName" value="${replyView.bName}"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bTitle" value="${replyView.bTitle}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="80" name="bContent">${replyView.bContent}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="답변등록" />&nbsp;&nbsp;
						<a href="list.do">목록으로</a></td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>