<%@page import="shoppingMall.ProductDAO"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	String pnum = request.getParameter("pnum");
	if (pnum == null || pnum.trim().equals("")) {
		response.sendRedirect("prodList.jsp");
		return;
	} //if
	
	String pimage = request.getParameter("pimage");
	String imgPath = application.getRealPath("uploadFile");
	
	File dfile = null;
	
	if (pimage != null) {
		dfile = new File(imgPath + "/" + pimage);
		System.out.println("삭제파일 : " + dfile );
		if(dfile.exists()){
			if(dfile.delete()){
				out.println("이미지 파일 삭제 완료");
			}
		}
	}//if
	
	//비지니스 로직 호출
	ProductDAO pdao = ProductDAO.getInstance();
	int n = pdao.delProd(pnum.trim());
	
	String msg ="", url="prodList.jsp";
	if(n>0){
		msg="상품 삭제 처리 완료되었습니다.";
	}else{
		msg="상품 삭제 실패!!!";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>