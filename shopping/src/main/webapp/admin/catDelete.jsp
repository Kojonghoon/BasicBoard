<%@page import="shoppingMall.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String cnum = request.getParameter("cnum");
	if (cnum == null || cnum.trim().equals("")) {
		response.sendRedirect("catList.jsp");
		return;
	} //if
	
	//categoryDAO의 비지니스 로직을 수행
	CategoryDAO cdao = CategoryDAO.getInstance();
	int n = cdao.categoryDelete(cnum);
	
	String msg = "";
	String url = "catList.jsp";
	if (n > 0) {
		msg = "카테고리 삭제 완료 되엇습니다....!!!";
	} else {
		msg = "카테고리 삭제 실패....!!!";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>