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
		<h2>�� ���� ����</h2>
		<hr width="500" color="blue" size="10">
	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<form action="modify.do" method="post">
			<input type="hidden" name="bId" value="${view.bId}" />
			<tr>
				<td>��ȣ</td>
				<td>${view.bId}</td>
			</tr>
			<tr>
				<td>��ȸ��</td>
				<td>${view.bHit}</td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="bName" value="${view.bName}" /></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="bTitle" value="${view.bTitle}" /></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="10" cols="80" name="bContent" />${view.bContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="����" />&nbsp;&nbsp;
					<a href="list.do">�������</a> &nbsp;&nbsp; <a href="delete.do?bId=${view.bId}">����</a>&nbsp;&nbsp;
					<a href="replyView.do?bId=${view.bId}">�亯</a></td>
			</tr>
		</form>
	</table>
	</center>
</body>
</html>