<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="shoppingMall.user.ProdListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<meta charset="UTF-8">
<%@include file="main_top.jsp"%>
<!-- 카테고리 리스트 내용 -->
	<h3 align="center">쇼핑몰에 오신 것을 환영합니다.!!!</h3>
		<%
			ProdListDAO pdao = ProdListDAO.getInstance();	
		
			DecimalFormat df = new DecimalFormat("#,###,###");
			String category_fk = request.getParameter("category_fk");
			String cname = request.getParameter("cname");
			if (cname != null) {
			    cname = java.net.URLDecoder.decode(cname, "UTF-8");
			}
			
			Vector<ProductDTO> pdtos = pdao.selectByCat(category_fk);
			
			if (pdtos == null || pdtos.size() == 0) {
				out.println("<table width='540'><tr><td>해당 상품이 없습니다.!!!!</td></tr></table>");
			}else{
		%>
		<b><%=cname%></b>
		<hr color="green" width="90%">
		<br/>
		<table width ="540px" border="1" align="center">
			<tr>
			<%
				int cnt=0;
				for(ProductDTO pdto:pdtos){
					cnt++;
					String pimage = pdto.getPimage();
					String pnum = pdto.getPnum();
					String pname = pdto.getPname();
					int price = pdto.getPrice();
					int point = pdto.getPoint();
			%>
				<td align="center">
				<a href="prodView.jsp?pnum=<%=pnum%>&pspec=<%=category_fk%>"> 
				<img src="../uploadFile/<%=pimage%>" width="120" height="120"></a>			
				<br/>
				<%=pname%><br/>
				<%=df.format(price)%>원<br/>
				포인트[<%=point%>]
			<%
					if(cnt%3==0){
						out.println("</tr><tr>");
					}//if
				}//forEnd
			%>
			</tr>
		</table>
			<%
				}//if End
			%>
<%@include file="main_bottom.jsp"%>