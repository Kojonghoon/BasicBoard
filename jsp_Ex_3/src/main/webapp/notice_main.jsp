<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function readNotice() {
		window.open("notice/notice_read.jsp" ,"notice","width=250, height=300,")
	}
</script>
</head>
<body>

	<!-- �����б�, ���� ���� �޴� -->
	<a href="javascript:readNotice()">���� �б�</a>
	<a href="notice/notice_write.jsp">���� ����</a>

</body>
</html>