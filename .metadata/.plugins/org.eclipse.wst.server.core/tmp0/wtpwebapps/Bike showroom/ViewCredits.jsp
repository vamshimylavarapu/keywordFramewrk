
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
<h2 align=center>Credit List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="CustID";
String CustID,Tenure;
int EMI;
String CreditID;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "CustID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM CreditMaster order by "+orderby;


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
        <th class=row_title><a class=title href="ViewCredits.jsp?orderby=CustID">CustID</a></th>
	<th class=row_title><a class=title href="ViewCredits.jsp?orderby=CreditID">CreditID</a></th>
	<th class=row_title><a class=title href="ViewCredits.jsp?orderby=EMI">EMI</a></th>
	<th class=row_title><a class=title href="ViewCredits.jsp?orderby=Tenure">Tenure</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  CustID=rs.getString(1);
	  CreditID=rs.getString(2);
	  EMI=rs.getInt(3);
  	  Tenure=rs.getString(4);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=CustID%></td>
		<td align=center><%=CreditID%></td>
		<td align=center><%=EMI%></td>
		<td align=center><%=Tenure%></td>
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

