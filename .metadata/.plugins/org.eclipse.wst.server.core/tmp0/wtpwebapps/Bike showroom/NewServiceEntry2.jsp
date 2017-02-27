<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Service Details.......
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
System.out.println("---1--");
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String CustID = request.getParameter("CustID");
String ServiceID = request.getParameter("ServiceID");
String strServiceNumber=request.getParameter("ServiceNumber");
int ServiceNumber= Integer.parseInt(strServiceNumber);
System.out.println(ServiceNumber);
String ServiceType= request.getParameter("ServiceType");
String ServiceDetails = request.getParameter("ServiceDetails");
String DOService=request.getParameter("DOService");
String strBillAmmount=request.getParameter("BillAmmount");
float BillAmmount= Float.parseFloat(strBillAmmount);
System.out.println(BillAmmount);
String BillNo=request.getParameter("BillNo");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into ServiceMaster values(\'"+CustID+"\',\'"+ServiceID+"\',"+ServiceNumber+",\'"+ServiceType+"\',\'"+ServiceDetails+"\',\'"+DOService+"\',"+BillAmmount+",\'"+BillNo+"\')";
	
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
			<A href="NewServiceEntry0.jsp"> Add another </A>
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