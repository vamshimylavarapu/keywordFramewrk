
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
<h2 align=center>Services List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="CustID";
String CustID,ServiceID,ServiceType,ServiceDetails,BillNo;
int ServiceNumber,BillAmmount;
String DOService;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "CustID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM ServiceMaster order by "+orderby;


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
        <th class=row_title><a class=title href="ViewServices.jsp?orderby=CustID">CustID</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=ServiceID">ServiceID</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=ServiceNumber">ServiceNumber</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=ServiceType">ServiceType</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=ServiceDetails">ServiceDetails</a></th>	
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=DOService">DOService</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=BillAmmount">BillAmmount</a></th>
	<th class=row_title><a class=title href="ViewServices.jsp?orderby=BillNo">BillNo</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  CustID=rs.getString(1);
	  ServiceID=rs.getString(2);
	  ServiceNumber=rs.getInt(3);
  	  ServiceType=rs.getString(4);
	  ServiceDetails=rs.getString(5);
          DOService=rs.getString(6);
	  BillAmmount=rs.getInt(7);
	  BillNo=rs.getString(8);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=CustID%></td>
		<td align=center><%=ServiceID%></td>
		<td align=center><%=ServiceNumber%></td>
		<td align=center><%=ServiceType%></td>
		<td align=center><%=ServiceDetails%></td>
		<td align=center><%=DOService%></td>
		<td align=center><%=BillAmmount%></td>
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

