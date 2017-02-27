
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>ConsolidatedReport</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=left><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center>SalesBook</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="CustID";
String CustID,ProdID,SaleMode,BillNo,CreditID;
int RegNo,ChequeNo;
String DOSale;
float CostPrice,SellingPrice,VATOnSales;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "CustID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM SalesMaster order by "+orderby;


	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>

	<tr class=row_title>
        <th class=row_title><a class=title href="SalesBook.jsp?orderby=CustID">CustID</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=ProdID">ProdID</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=RegNo">RegNo</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=CostPrice">CostPrice</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=SellingPrice">SellingPrice</a></th>	
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=DOSale">DOSale</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=CreditID">CreditID</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=SaleMode">SaleMode</a></th>	
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=ChequeNo">ChequeNo</a></th>	
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=VATOnSales">VATOnSales</a></th>
	<th class=row_title><a class=title href="SalesBook.jsp?orderby=BillNo">BillNo</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  CustID=rs.getString(1);
	  ProdID=rs.getString(2);
	  RegNo=rs.getInt(3);
  	  CostPrice=rs.getFloat(4);
	  SellingPrice=rs.getFloat(5);
          DOSale=rs.getString(6);
	  CreditID=rs.getString(7);
	  SaleMode=rs.getString(8);
	  ChequeNo=rs.getInt(9);
	  VATOnSales=rs.getFloat(10);
	  BillNo=rs.getString(11);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=CustID%></td>
		<td align=center><%=ProdID%></td>
		<td align=center><%=RegNo%></td>
		<td align=center><%=CostPrice%></td>
		<td align=center><%=SellingPrice%></td>
		<td align=center><%=DOSale%></td>
		<td align=center><%=CreditID%></td>
                <td align=center><%=SaleMode%></td>
		<td align=center><%=ChequeNo%></td>
		<td align=center><%=VATOnSales%></td>
		<td align=center><%=BillNo%></td>
	<%
	}


	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
	%>
		<CENTER>
		<B>No Records found............<B><BR>
		<A href="Report.jsp"> Back </A>
		</CENTER>
	<%

}


%>


</table>
</form>
</BODY>
</HTML>

