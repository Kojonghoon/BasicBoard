<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	
	out.println("<font color=red><b>");
	out.println(yy + "년" + mm + "월" + dd + "일");
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
<h2>오늘의 공지사항</h2>
	<form action="notice_save.jsp" method="post">
		<table border="1" width="500">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>공지 내용</th>
				<td><textarea name="info" rows="5" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>파일명</th>
				<td>
					<input type="text" name="filename" value="<%=fname%>" disabled/>
					<input type="hidden" name="filename" value="<%=fname%>"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성" />
					<input type="reset" value="취소" />
				</td>
			</tr>
		</table>
	</form>
</body>

</html>