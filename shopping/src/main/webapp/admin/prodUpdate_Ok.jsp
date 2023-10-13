<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	request.setCharacterEncoding("euc-kr");
	MultipartRequest multi = null;
	
	String uploadPath = application.getRealPath("uploadFile");
	ProductDAO pdao = ProductDAO.getInstance();
	
	String msg = "", url = "";
	try {
		multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 10, "euc-kr", new DefaultFileRenamePolicy());
	
		int n = pdao.updateProd(multi);
	
		if (n > 0) {
			msg = "��ǰ ������ ���� �Ϸ� �Ǿ����ϴ�..!!!";
			url = "prodList.jsp";
		} else {
			msg = "��ǰ���� ���� ó���� ���� �ʾҽ��ϴ�...!!!";
			url = "prodList.jsp";
		}
	} catch (IOException e) {
		msg = "���� ���ε� ����!!";
		url = "prodList.jsp";
	} catch (NumberFormatException e) {
		msg = "��ǰ ����, ������ ���ڷ� �Է��ϼ���!!!!";
		url = "prodList.jsp";
	}
%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>
