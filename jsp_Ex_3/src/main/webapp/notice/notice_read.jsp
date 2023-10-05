<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*" import="java.io.*"%>
<%
/* 
	1. ���������� �б� ���ؼ� ���� ��¥�� ���Ѵ�.
	2. ��¥.html --> ���ϸ��� �����.
	3. ���ϸ�� ������ �д� ��彺Ʈ���� ����
	4. ���͸�
	5. ��Ʈ���� ���ؼ� �о����
	6. �о�� ������ �������� ����ϱ�
	7. ��Ʈ�� closeó��
*/
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	
	out.print(yy + "��" + mm + "��" + dd + "��");
	
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
	
	//out.println("�о�� ���� ��� : "+rFile);
	
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
		out.println("������ ���������� �����ϴ�!!!");
		out.println("<a href='javascript:self.close();'");
		out.println("close</a>");
	} catch (IOException e) {
		out.println("IO���� : " + e.getMessage());
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