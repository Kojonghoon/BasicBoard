<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.io.*"%>
<!-- saveó������ -->
<%
/*
1. ����ڰ� �Է��� ������, ����, ���ϸ��� ��� ���� ����
2. ���ϸ�� FileWriter�� ��Ʈ�� ����
3. ��Ʈ���� ���ؼ� ������� ������ ���Ͽ� ����.
4. ��Ʈ�� �ݱ�
5. ���Ͽ� ���Ⱑ ����Ǿ����� �޽��� ����
*/

request.setCharacterEncoding("euc-kr");
String title = request.getParameter("title");
String content = request.getParameter("info");
String fileName = request.getParameter("filename");

if (fileName == null || fileName.trim().equals("")) {
	response.sendRedirect("notice_write.jsp");
	return;
}

if (title == null || content == null || title.trim().equals("") || content.trim().equals("")) {
	out.println("���� ����� ������ �Է��ϼ���!!");
	out.println("<a href = notice_write.jsp>���ư���</a>");
	return;
}

// ���� ���� ��� ���ϱ�
//request ��ü�� getRealpath("/notice");
//config ���� ��ü�� getServletContext() �޼ҵ�
//ServletContext ctx = config.getServletContext();

ServletContext ctx = config.getServletContext();
String allPath = ctx.getRealPath("/notice");

//String allPath = request.getRealPath("/notice");
out.print("�������� ����� ��� : " + allPath);

String allFname = allPath + "/" + fileName;

FileWriter fw = null;
PrintWriter pw = null;

try {
	fw = new FileWriter(allFname);
	pw = new PrintWriter(fw, true);
	pw.println("<body>");
	pw.println("<b>"+title+"</b><br/>");
	pw.println(content);
	pw.println("</body>");

	pw.close();
	fw.close();
} catch (IOException e) {
	out.println("����� ���� : " + e.getMessage());
	return;
}
%>
<script type="text/javascript">
	alert("<%=fileName%> ���Ͽ� ���� �۾� �Ϸ�!!!")
	location.href="<%=request.getContextPath()%>/notice_main.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>