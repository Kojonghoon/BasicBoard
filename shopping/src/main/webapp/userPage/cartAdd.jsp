<%@page import="shoppingMall.user.CartBean"%>
<%@page import="shoppingMall.user.ProdListDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<meta charset="UTF-8">

<jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session" />

	<%
		String pnum = request.getParameter("pnum");
		String pqty = request.getParameter("pqty");
		String pspec = request.getParameter("pspec");
		
		if (pnum == null || pnum.trim().equals("") || pqty == null || pqty.trim().equals("")) {
		
			response.sendRedirect("main.jsp");
			return;
		}
		
		pnum = pnum.trim();
		pqty = pqty.trim();
		
		ProdListDAO pdao = ProdListDAO.getInstance();
		
		mallCart.addProd(pdao, pnum, pqty, pspec);
		response.sendRedirect("cartList.jsp");
	%>