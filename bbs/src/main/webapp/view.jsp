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
		<hr width="500" color="blue" size="10">
		<h2>글 내용 보기</h2>
		<hr width="500" color="blue" size="10">
	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<form action="modify.do" method="post">
			<input type="hidden" name="bId" value="${view.bId}" />
			<tr>
				<td>번호</td>
				<td>${view.bId}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${view.bHit}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="bName" value="${view.bName}" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" value="${view.bTitle}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="80" name="bContent" />${view.bContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정" />&nbsp;&nbsp;
					<a href="list.do">목록으로</a> &nbsp;&nbsp; <a href="delete.do?bId=${view.bId}">삭제</a>&nbsp;&nbsp;
					<a href="replyView.do?bId=${view.bId}">답변</a></td>
			</tr>
		</form>
	</table>
	</center>
</body>
</html>