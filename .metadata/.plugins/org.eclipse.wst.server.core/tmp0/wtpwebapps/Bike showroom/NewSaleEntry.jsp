<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Sales Details.......
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
//System.out.println("---1--");
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
//System.out.println("-------2-------");
String CustID = request.getParameter("CustID");
String ProdID = request.getParameter("ProdID");
String strRegNo=request.getParameter("RegNo");
System.out.println(strRegNo);

int RegNo= Integer.parseInt(strRegNo);


String strCostPrice=request.getParameter("CostPrice");
float CostPrice= Float.parseFloat(strCostPrice);
String strSellingPrice=request.getParameter("SellingPrice");
float SellingPrice= Float.parseFloat(strSellingPrice);
String DOSale=request.getParameter("DOSale");
String CreditID=request.getParameter("CreditID");
//System.out.println("-------4-------");

String SaleMode=request.getParameter("SaleMode");
String ChequeNo=request.getParameter("ChequeNo");
String strVATOnSales=request.getParameter("VATOnSales");
float VATOnSales= Float.parseFloat(strVATOnSales);
//System.out.println("-------5-------");

String BillNo=request.getParameter("BillNo");
//System.out.println("-------6-------");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into SalesMaster values('"+CustID+"','"+ProdID+"',"+RegNo+","+CostPrice+","+SellingPrice+",'"+DOSale+"','"+CreditID+"','"+SaleMode+"',"+ChequeNo+","+VATOnSales+",'"+BillNo+"')";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<jsp:forward page="NewServiceEntry1.jsp">
				<jsp:param name="CustID" value="<%=CustID%>"/>
			</jsp:forward>
		<%
	}
	else{
		%>Error in updating<%
	}
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</body>
</html>