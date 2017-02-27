<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Registration Details.......
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


String CustID = request.getParameter("CustID");
String ProdID=request.getParameter("ProdID");
String HelmetBillNo = request.getParameter("HelmetBillNo");
String DateOfReg=request.getParameter("DateOfReg");
String TemporaryRegNo = request.getParameter("TemporaryRegNo");
String PermenantRegNo = request.getParameter("PermenantRegNo");
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into Registration values(\'"+CustID+"\',\'"+ProdID+"\',\'"+HelmetBillNo+"\',\'"+DateOfReg+"\',\'"+TemporaryRegNo+"\',\'"+PermenantRegNo+"\')";
	
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
			<A href="NewRegEntry0.jsp"> Add another </A>
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