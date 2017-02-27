<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Purchases Details.......
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String ProdID = request.getParameter("ProdID");
String strStock = request.getParameter("Stock");
int Stock= Integer.parseInt(strStock);
String BillNo = request.getParameter("BillNo");
String SundryCreditor=request.getParameter("SundryCreditor");

String strDOPurchase=request.getParameter("DOPurchase");
//Date DOPurchase= Date.valueOf(strDOPurchase);
String TIN=request.getParameter("TIN");
String strBillAmmount=request.getParameter("BillAmmount");
float BillAmmount= Float.parseFloat(strBillAmmount);

String strVATOnPurchase=request.getParameter("VATOnPurchase");
float VATOnPurchase= Float.parseFloat(strVATOnPurchase);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into ProductMaster values(\'"+ProdID+"\',"+Stock+",\'"+BillNo+"\',"+BillAmmount+",\'"+SundryCreditor+"\',"+VATOnPurchase+",\'"+strDOPurchase+"\',\'"+TIN+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewPurchaseEntry0.jsp"> Add another </A>
		</center>
		<%
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>