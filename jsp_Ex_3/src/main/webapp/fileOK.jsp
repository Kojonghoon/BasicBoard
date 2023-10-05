<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String uploadPath = request.getRealPath("upload_file");

int maxSize = 1024 * 1024 * 10; // 10M
String file = "";
String originFile = "";

try {
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR",
	new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();
	String names = (String)files.nextElement();

	file = multi.getFilesystemName(names);
	originFile = multi.getOriginalFileName(names);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	file Upload완료!
	<!-- C:\WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jsp_Ex_3\upload_file -->
</body>
</html>