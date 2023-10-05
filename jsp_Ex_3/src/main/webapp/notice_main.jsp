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

	<!-- 공지읽기, 공지 쓰기 메뉴 -->
	<a href="javascript:readNotice()">공지 읽기</a>
	<a href="notice/notice_write.jsp">공지 쓰기</a>

</body>
</html>