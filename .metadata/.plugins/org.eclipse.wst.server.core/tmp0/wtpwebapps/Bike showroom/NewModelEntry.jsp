<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Model Details.......
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
String Path=null,path1=null;
String strModelID=request.getParameter("ModelID");
int ModelID= Integer.parseInt(strModelID);
String Model = request.getParameter("Model");
Path=request.getParameter("Path");
System.out.println(Path);

	char ch='/';
	char ch1=92;
	 path1=Path.replace(ch1,ch);
	System.out.println(path1);
	session.setAttribute("path1",path1);
	



String strListPrice=request.getParameter("ListPrice");
float ListPrice= Float.parseFloat(strListPrice);
String Description = request.getParameter("Description");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "insert into model values("+ModelID+",'"+Model+"','"+path1+"',"+ListPrice+",'"+Description+"')";
	
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = "+rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewModelEntry0.jsp"> Add another </A>
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