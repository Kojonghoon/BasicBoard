<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="shoppingMall.user.ProdListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<%@include file="main_top.jsp"%>
<!-- ��ǰ�󼼺��� ������ -->
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
			out.println(pnum+"�� �ش��ϴ� ��ǰ�� �����ϴ�.!!!");
			return;
		}
	%>

	<br></br>
	<table width="540" border="1" class="outLine">
		<tr class="m1">
			<td colspan="2">
				<b>[<%=pdto.getPname()%>]��ǰ ������</b>
			</td>
		</tr>
		<tr>
			<td align="center" >
				<img src="../uploadFile/<%=pdto.getPimage()%>" width="200" height="200"/>
			</td>
			<td class="m2">
				<form name="frm" method="post">
					��ǰ��ȣ : <%=pnum %><br/>
					��ǰ�̸� : <%=pdto.getPname() %><br/>
					��ǰ���� : <%=pdto.getPrice() %>��<br/>
					��ǰ����Ʈ : [<%=pdto.getPoint()%>]��<br/>
					��ǰ���� : <input type="text" name="pqty" size="2" value="1">��<br/>
					<br/>
					<!-- ��ٱ��� ��� -->
					<table border="0" width="90%" align="center">
						<tr>
					<!-- ��ٱ��� ��� ��ư -->
							<td>
								<a href="#" color="red" border="1">
									<!-- <img src="../uploadFile/��ٱ���.png" border="0"> -->
									��ٱ���
								</a>
							</td>
					<!-- �����ϱ� ��ư -->
							<td>
								<a href="#" color="red" border="1">
									<!-- <img src="../uploadFile/�����ϱ�.png" border="0"> -->
									�����ϱ�
								</a>
							</td>					
						</tr>
					</table>
				</form>
				
			</td>
		</tr>
		<!-- ��ǰ �� ���� -->
		<tr height="50" valign="top">
		<br/>
			<td colspan="2">
				<b>��ǰ �Ұ�</b>
				<%=pdto.getPcontents() %>
			</td>
		</tr>
		
	</table>

<%@include file="main_bottom.jsp"%>