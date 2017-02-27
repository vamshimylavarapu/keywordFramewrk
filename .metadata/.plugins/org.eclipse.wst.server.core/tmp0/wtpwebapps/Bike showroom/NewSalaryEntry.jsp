<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Employee salary Details.......
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

String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);
String strPaySlipDate=request.getParameter("PaySlipDate");
String PaySlipDate= strPaySlipDate;
//Date PaySlipDate;
String strBasic=request.getParameter("Basic");
float Basic = Float.parseFloat(strBasic);
String strDA=request.getParameter("DA");
float DA= Float.parseFloat(strDA);
String strGrossAmt=request.getParameter("GrossAmt");
float GrossAmt= Float.parseFloat(strGrossAmt);
String strNetAmt=request.getParameter("NetAmt");
float NetAmt= Float.parseFloat(strNetAmt);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into SalaryMaster values("+EMPNO+","+Basic+","+DA+","+GrossAmt+","+NetAmt+",'"+PaySlipDate+"')";
	
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
			<A href="Report.jsp"> Back </A>
		</center>
		<%
	}
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</body>
</html>