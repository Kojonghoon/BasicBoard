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
		<h2>�亯 ����</h2>
		<hr width="500" size="10" color="green">
		<table width="800" cellpadding="0" cellspacing="0" border="1">
			<form action="reply.do" method="post">
			<input type="hidden" name="bId" value="${replyView.bId}">
			<input type="hidden" name="bGroup" value="${replyView.bGroup}">
			<input type="hidden" name="bStep" value="${replyView.bStep}">
			<input type="hidden" name="bIndent" value="${replyView.bIndent}">
				<tr>
					<td>��ȣ</td>
					<td>${replyView.bId}</td>
				</tr>
				<tr>
					<td>��ȸ��</td>
					<td>${replyView.bHit}</td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="bName" value="${replyView.bName}"/></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="bTitle" value="${replyView.bTitle}"/></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="10" cols="80" name="bContent">${replyView.bContent}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="�亯���" />&nbsp;&nbsp;
						<a href="list.do">�������</a></td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>