<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="shoppingMall.user.ProdListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<%@include file="main_top.jsp"%>
<!-- 제품상세보기 페이지 -->
	<%
		String pnum = request.getParameter("pnum");
		String pspec = request.getParameter("pspec");
		
		if (pnum == null || pnum.trim().equals("") || pspec == null || pspec.trim().equals("")) {
			response.sendRedirect("main.jsp");
			return;
		}
		
		ProdListDAO pdao = ProdListDAO.getInstance();
		Vector<ProductDTO> pdtos = pdao.selectByPnum(pnum.trim());
		
		ProductDTO pdto = pdtos.get(0);
		
		if (pdto == null) {
			out.println(pnum+"에 해당하는 상품이 없습니다.!!!");
			return;
		}
	%>

	<br></br>
	<table width="540" border="1" class="outLine">
		<tr class="m1">
			<td colspan="2">
				<b>[<%=pdto.getPname()%>]상품 상세정보</b>
			</td>
		</tr>
		<tr>
			<td align="center" >
				<img src="../uploadFile/<%=pdto.getPimage()%>" width="200" height="200"/>
			</td>
			<td class="m2">
				<form name="frm" method="post">
					상품번호 : <%=pnum %><br/>
					상품이름 : <%=pdto.getPname() %><br/>
					상품가격 : <%=pdto.getPrice() %>원<br/>
					상품포인트 : [<%=pdto.getPoint()%>]원<br/>
					상품수량 : <input type="text" name="pqty" size="2" value="1">개<br/>
					<br/>
					<!-- 장바구니 담기 -->
					<table border="0" width="90%" align="center">
						<tr>
					<!-- 장바구니 담기 버튼 -->
							<td>
								<a href="#" color="red" border="1">
									<!-- <img src="../uploadFile/장바구니.png" border="0"> -->
									장바구니
								</a>
							</td>
					<!-- 구매하기 버튼 -->
							<td>
								<a href="#" color="red" border="1">
									<!-- <img src="../uploadFile/구매하기.png" border="0"> -->
									구매하기
								</a>
							</td>					
						</tr>
					</table>
				</form>
				
			</td>
		</tr>
		<!-- 상품 상세 내용 -->
		<tr height="50" valign="top">
		<br/>
			<td colspan="2">
				<b>상품 소개</b>
				<%=pdto.getPcontents() %>
			</td>
		</tr>
		
	</table>

<%@include file="main_bottom.jsp"%>