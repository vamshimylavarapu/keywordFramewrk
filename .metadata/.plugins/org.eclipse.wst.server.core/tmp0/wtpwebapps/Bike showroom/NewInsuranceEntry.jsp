<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Insurance Details.......
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

String CustName = request.getParameter("CustName");
String vehicleID = request.getParameter("vehicleno");
String amount = request.getParameter("amount");
String dateofinsurance=request.getParameter("doi");
String dateofexpiery=request.getParameter("doe");




try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into insurancemaster(customername,vehicleno,amount,dateofinsurance,experyofinsurance) values('"+CustName+"','"+vehicleID+"',"+Float.parseFloat(amount)+",'"+dateofinsurance+"','"+dateofexpiery+"')";
	
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
			<A href="NewInsurance.jsp"> Add another </A>
		</center>
		<%
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	e.printStackTrace();
}
%>

</body>
</html>