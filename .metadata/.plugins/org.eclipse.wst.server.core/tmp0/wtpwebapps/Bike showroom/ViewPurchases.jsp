
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
<h2 align=center>Purchases List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="ProdID";
String ProdID,BillNo,SundryCreditor,TIN;
float BillAmmount,VATOnPurchase;
int Stock;
String DOPurchase;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "ProdID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
%>

<%

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM ProductMaster order by "+orderby;


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
        <th class=row_title><a class=title href="ViewPurchases.jsp?orderby=ProdID">ProdID</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=Stock">Stock</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=BillNo">BillNo</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=BillAmmount">BillAmmount</a></th>
  	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=SundryCreditor">SundryCreditor</a></th>
  	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=VATOnPurchase">VATOnPurchase</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=DOPurchase">DOPurchase</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=TIN">TIN</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  ProdID=rs.getString(1);
	  Stock=rs.getInt(2);
	  BillNo=rs.getString(3);
  	  BillAmmount=rs.getFloat(4);
	  SundryCreditor=rs.getString(5);
	  VATOnPurchase=rs.getFloat(6);
	  DOPurchase=rs.getString(7);
	  TIN=rs.getString(8);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=ProdID%></td>
		<td align=center><%=Stock%></td>
		<td align=center><%=BillNo%></td>
		<td align=center><%=BillAmmount%></td>
		<td align=center><%=SundryCreditor%></td>
		<td align=center><%=VATOnPurchase%></td>
		<td align=center><%=DOPurchase%></td>
		<td align=center><%=TIN%></td>
	<%}


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

