<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="shoppingMall.*"%>
<meta charset="UTF-8">
<%
//�α��� ����� �ʿ���
%>
<jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session" />
	<%
	//�����ϰ��� �ϴ� ��ǰ�� ��ȣ�� ������ �����;���
	String pnum = request.getParameter("pnum");
	String pqty = request.getParameter("pqty");
	if (pnum == null || pnum.trim().equals("") || pqty == null || pqty.trim().equals("")) {
	
	%>
	<script type="text/javascript">
		alert("�߸� ���� ����Դϴ�.");
		history.back();
	</script>	
	<%
			return;
		}//if End
	try{
		mallCart.setModify(pnum, pqty);
		response.sendRedirect("cartList.jsp");
	}catch(NumberFormatException e){
		e.printStackTrace();
	%>
		<script>
		alert("������ �߸� �Է��߽��ϴ�.!!!");
		history.go(-1);
		</script>
	<%
	}
	%>