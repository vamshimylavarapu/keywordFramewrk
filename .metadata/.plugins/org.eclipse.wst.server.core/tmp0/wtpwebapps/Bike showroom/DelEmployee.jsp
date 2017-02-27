
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Delete Employee</title>

</HEAD>

<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<center>
<form name=cons>
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String sEMPNO = request.getParameter("EMPNO");
int EMPNO = Integer.parseInt(sEMPNO);
System.out.println("--1---");
try
{
	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Delete FROM empmaster where EMPNO = "+EMPNO;
	System.out.println("--1--"+Query);
	int res = stmt.executeUpdate(Query);
	if(res==1)
	{
		%>
			<H3>Employee record removed from database successfully</H3>
			<A href="DelEmployee.html">Back</A>
		<%
	}
	else
	{
		%>
			<H3>Error in removing....please try again!!!</H3>
			<A href="DelEmployee.html">Back</A>
		<%
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>
</form>
</center>

</BODY>
</HTML>

