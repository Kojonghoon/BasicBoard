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
		<hr width="500" color="green" size="10">
		<h2>�� �ۼ��ϱ�</h2>
		<hr width="500" color="green" size="10">
		<table width="800" cellpadding="0" cellspacing="0" border="1">
			<form action="write.do" method="post">
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="bName" size="20"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="bTitle" size="50"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea name="bContent" rows="10" cols="80"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="���" />&nbsp;&nbsp;
						<a href="list.do">�������</a></td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>