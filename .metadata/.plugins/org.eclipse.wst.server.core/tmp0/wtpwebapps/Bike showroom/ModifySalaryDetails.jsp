<!--
	File : ModifyDetails.jsp
	Purpose : This jsp is used to modify the user details by Authorised Users
-->
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
Modifying Salary Details.......
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;


String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);
Date PaySlipDate;
float DA,Basic;
String strGrossAmt=request.getParameter("GrossAmt");
float GrossAmt= Float.parseFloat(strGrossAmt);
String strNetAmt=request.getParameter("NetAmt");
float NetAmt= Float.parseFloat(strNetAmt);

try
{
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Update SalaryMaster set  NetAmt="+strNetAmt+",GrossAmt="+strGrossAmt+" where EMPNO="+EMPNO;
	//System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	//System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		String AdminUser=(String)session.getAttribute("userr");
		Timestamp DateModified = new Timestamp(System.currentTimeMillis());
		String ModDate = DateModified.toString();
		String InsQuery="Insert into ActivityTracker values(\'"+AdminUser+"\',\'"+EMPNO+"\',\'"+ModDate+"\')";
		int LogEntry=stmt.executeUpdate(InsQuery);
		%>
			<script>
				for(i=1;i<=10;i++) document.write("<br>");
			</script>
				<H3 align="center">Details Updated Successfully </H3>
			<BR>
			<center>
			 <INPUT TYPE="button" value="Close" onclick='window.close();window.opener.location.reload();'></center>
			
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