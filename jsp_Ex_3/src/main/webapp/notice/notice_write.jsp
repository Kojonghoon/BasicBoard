<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	
	out.println("<font color=red><b>");
	out.println(yy + "��" + mm + "��" + dd + "��");
	out.println("</b></font>");
	String fname = yy + "";
	if (mm < 10)
		fname += ("0" + mm);
	else
		fname += mm;
	if (dd < 10)
		fname += ("0" + dd);
	else
		fname += dd;
	
	fname += ".html";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
<h2>������ ��������</h2>
	<form action="notice_save.jsp" method="post">
		<table border="1" width="500">
			<tr>
				<th>����</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>���� ����</th>
				<td><textarea name="info" rows="5" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>���ϸ�</th>
				<td>
					<input type="text" name="filename" value="<%=fname%>" disabled/>
					<input type="hidden" name="filename" value="<%=fname%>"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�ۼ�" />
					<input type="reset" value="���" />
				</td>
			</tr>
		</table>
	</form>
</body>

</html>