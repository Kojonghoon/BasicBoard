<%@page import="shoppingMall.CategoryDAO"%>
<%@page import="shoppingMall.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width=700 align="center" border=1>
		<!-- ���� �׺������ -->
		<tr>
			<td colspan="2">
				<a href="<%=request.getContextPath()%>/userPage/main.jsp">���θ� HOME</a> 
				<a href="#">�α���</a> 
				<a href="<%=request.getContextPath()%>/adminLogin.jsp">������</a>
			</td>
		</tr>
		<tr>
			<td width="145" align="center" valign="top">
				<!-- ī�װ� ��� -->
				<table width="100%" border="1">
				<%
				CategoryDAO cdao = CategoryDAO.getInstance();
				ArrayList<CategoryDTO> cdtos = cdao.categoryAll();

				if (cdtos != null && cdtos.size() != 0){
					for(CategoryDTO cdto:cdtos){
						String cname = cdto.getCname();
						String code = cdto.getCode();
				%>
					<tr>
						<td>
							<a href="catList.jsp?category_fk=<%=code%>&cname=<%=cname%>"><%=cname%></a>
						</td>
					</tr>
				<%
						}//for
					}else{
						out.println("<tr<td>ī�װ� ������ ����!!!</td></tr>");
					}//if
				%>
				</table>
			</td>
			<td>