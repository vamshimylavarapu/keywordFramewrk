
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
<h2 align=center>VAT on Sales </h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String ProdID,CustID;
String orderby="CustID";

float VATOnSale,TotalVAT=0;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "CustID":(String)request.getParameter("orderby");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT CustID,ProdID, VATOnSales FROM SalesMaster order by "+orderby;


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
        <th class=row_title><a class=title href="VATSales.jsp?orderby=CustID">CustID</a></th>
	<th class=row_title><a class=title href="VATSales.jsp?orderby=ProdID">ProdID</a></th>
	<th class=row_title><a class=title href="VATSales.jsp?orderby=VATOnSales">VAT On Sales</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
          CustID=rs.getString(1);
	  ProdID=rs.getString(2);
	  VATOnSale=rs.getFloat(3);
	  TotalVAT +=VATOnSale;
	  DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=CustID%></td>
		<td align=center><%=ProdID%></td>
		<td align=center><%=VATOnSale%></td>
	
	
	<%
	}
	%><tr class= "row_odd" ><th colspan=2><font  color="red">Total VAT</font> </th><th><font color="red"><%=TotalVAT%></font></th></tr><%

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

