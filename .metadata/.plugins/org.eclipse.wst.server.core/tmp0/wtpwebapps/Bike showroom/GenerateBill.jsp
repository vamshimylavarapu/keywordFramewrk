 <%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String BillNo = request.getParameter("BillNo");%>
<%String CustName = request.getParameter("CustName");%>
<%String Product = request.getParameter("Product");%>
<%String DateOfSale = request.getParameter("DateOfSale");%>
<%String Amount = request.getParameter("Amount");%>

 
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>Generate Bill</TITLE>
	

  </HEAD>
  <body Class=SC>

	<!-- To display Menu --Start -->
	<script language="JavaScript1.2" src="coolfunctions.js"></script>
	<script language="JavaScript1.2" src="coolmenus.js"></script>

	<!-- To display Menu --End --><br><br><br>

  <FORM NAME="GenerateBill" onSubmit="return check()" action="GenerateBill.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="4"> BILL </TH>   
	   </TR>
	   <TR></TR>
	   <TR class=row_odd >
	   <Td><b>BillNo</b></Td> <TD><%=BillNo%></TD><TD><b>Date Of Sale</b></TD><TD><%=DateOfSale%></TD>
	   </TR>
	   <TR class=row_even >
	   <TD><b>CustName</b></TD> <TD colspan=3><%=CustName%></TD>
	   </TR>
	   <TR class=row_even >
	   <TD><b>Product</b></TD>
	   <TD colspan=3><%=Product%></TD>
	   </TR>
	   <TR><TD colspan=4>&nbsp</TD></TR>
	   <TR class=row_even >
	   <Th>&nbsp;</Th>
	   <TD><font color="red"><b>Amount (Rs)</b></font></TD>
	   <TD colspan=2><%=Amount%></TD>
	   </TR>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>



	    
   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
