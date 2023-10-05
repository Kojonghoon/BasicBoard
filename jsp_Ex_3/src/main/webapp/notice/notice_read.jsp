<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.io.*"%>
<%
/* 
	1. 공지파일을 읽기 위해서 오늘 날짜를 구한다.
	2. 날짜.html --> 파일명을 만든다.
	3. 파일명과 파일을 읽는 노드스트림을 연결
	4. 필터링
	5. 스트림을 통해서 읽어오기
	6. 읽어온 내용을 브라우저에 출력하기
	7. 스트림 close처리
*/
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	
	out.print(yy + "년" + mm + "월" + dd + "일");
	
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
	//out.println(fname);
	
	String rFile = config.getServletContext().getRealPath("/notice");
	rFile += "/" + fname;
	
	//out.println("읽어올 파일 경로 : "+rFile);
	
	FileReader fr = null;
	BufferedReader br = null;
	try {
		fr = new FileReader(rFile);
		br = new BufferedReader(fr);
		String contents = "";
		while ((contents = br.readLine()) != null) {
			out.println(contents + "<br/>");
		}
		br.close();
		fr.close();
	} catch (FileNotFoundException e) {
		out.println("오늘은 공지사항이 없습니다!!!");
		out.println("<a href='javascript:self.close();'");
		out.println("close</a>");
	} catch (IOException e) {
		out.println("IO오류 : " + e.getMessage());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>