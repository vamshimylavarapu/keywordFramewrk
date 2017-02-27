<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script language="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).CreditID;
		txt.value = txtVal;
		window.close();
}
//-->
</script>
<title>
	Adding new Credit Details.......
</title>
</head>
<br><br><br>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String CustID = request.getParameter("CustID");
String CreditID = request.getParameter("CreditID");
String strEMI=request.getParameter("EMI");
int EMI= Integer.parseInt(strEMI);
String Tenure = request.getParameter("Tenure");


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Insert into CreditMaster values(\'"+CustID+"\',\'"+CreditID+"\',"+EMI+",\'"+Tenure+"\')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<H3 align="center">Details Updated Successfully </H3>
			<center><a id="x" href="#" onClick="sendInfo(<%=CreditID%>)">Close</a></center>
			
		<%
	}
	else{
		%>
			<H3 align="center">Error in updating....</H3>
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