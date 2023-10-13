<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="shoppingMall.user.ProdListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<%@include file="main_top.jsp"%>
<!-- mall 내용 -->
<td>
	<h3 align="center">쇼핑몰에 오신 것을 환영합니아!!!</h3>
	<%	//인기상품 진열 ----------------------------
	DecimalFormat df = new DecimalFormat("#,###,###");
	
	ProdListDAO pdao = ProdListDAO.getInstance();
	Vector<ProductDTO> pdtos = pdao.selectByPspec("hit");

	if (pdtos == null || pdtos.size() == 0) {
		out.println("Hit 상품이 없습니다.!!!");
	} else {
	%>
	<hr color="red" />
	<b>&nbsp;&nbsp;&nbsp;&nbsp;인기 상품</b>
	<hr color="green" width="90%" />
	<br>
	<table width="100%" border="1" , align="center">
		<tr>
			<%
			int cnt = 0;
			for (ProductDTO pdto : pdtos) {
				cnt++;
				String pimage = pdto.getPimage();
				String pnum = pdto.getPnum();
				String pname = pdto.getPname();
				int price = pdto.getPrice();
				int point = pdto.getPoint();
			%>
			<td align="center">
				<a href=""> <img src="../uploadFile/<%=pimage%>" width="120" height="120" border="0" />
				</a> <br />
				<%=pname%><br />
				<%=df.format(price)%>원<br /> [<%=df.format(point)%>]포인트
			</td>
			<%
					if(cnt%3==0){
						out.println("</tr><tr>");
					}//if
				} //for End
			%>
		</tr>
	</table>
	<%
		} //if
	%>
	<%//신상품 진열----------------------------------------------
		Vector<ProductDTO> pdtos2 = pdao.selectByPspec("new");
			if(pdtos2==null||pdtos2.size()==0){
				out.println("신상품이 존재하지 않습니다.!!!");
			}else{
	%>
		<br>
		<b>&nbsp;&nbsp;&nbsp;&nbsp;최신 상품</b>
		<hr color="green" width="90%">
		<br>
		<table width="100%" border=0 aligh="center">
			<tr>
				<%
					int cnt = 0;
					for (ProductDTO pdto : pdtos2) {
						cnt++;
						String pimage = pdto.getPimage();
						String pnum = pdto.getPnum();
						String pname = pdto.getPname();
						int price = pdto.getPrice();
						int point = pdto.getPoint();
				%>
				<td align="center">
					<a href=""> <img src="../uploadFile/<%=pimage%>" width="120" height="120" border="0" />
					</a> <br />
					<%=pname%><br />
					<%=df.format(price)%>원<br /> [<%=df.format(point)%>]포인트
				</td>
				<%
					if(cnt%3==0){
						out.println("</tr><tr>");
					}//if
				} //for End
				%>
			</tr>
		</table>
	<%
			}//if문
	%>
</td>
<%@include file="main_bottom.jsp"%>