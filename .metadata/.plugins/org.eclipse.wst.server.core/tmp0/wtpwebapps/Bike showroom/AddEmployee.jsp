<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Employee Details.......
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

String EMPName = request.getParameter("EMPName");
String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);
String MailID = request.getParameter("MailID");
String Empadd=request.getParameter("EMP_ADDRESS");
String PhoneNo=request.getParameter("PHONENO");
String CurrentLocation=request.getParameter("CurrentLocation");

String strJoiningDate=request.getParameter("JoiningDate");
//Date JoiningDate= Date.valueOf(strJoiningDate);
String Role=request.getParameter("Role");
String Qualification=request.getParameter("Qualification");
String Remarks=request.getParameter("Remarks");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String SelQ = "Select EMPNO from EmpMaster where EMPNO="+EMPNO;
	//System.out.println(SelQ);
	rs=stmt.executeQuery(SelQ);
if(!(rs.next())){

	String Query = "insert into empmaster values('"+EMPName+"',"+EMPNO+",'"+MailID+"','"+CurrentLocation+"','"+strJoiningDate+"','"+Role+"','"+Qualification+"','"+Remarks+"')";
	
	//System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	//System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
        String AdminUser=(String)session.getAttribute("userr");
	//System.out.println(AdminUser);
	//System.out.println(EMPNO);
	//String format=new SimpleDateFormat().format(new Date("dd/mm/yyyy"));
	
	Timestamp DateModified = new Timestamp(System.currentTimeMillis());
	String ModDate = DateModified.toString();
	//System.out.println(DateModified.toString());
	String InsQuery="Insert into ActivityTracker values('"+AdminUser+"',"+EMPNO+",'"+ModDate+"')";
	//System.out.println(InsQuery);
	int LogEntry=stmt.executeUpdate(InsQuery);
		%>
			<jsp:forward page="NewSalaryEntry0.jsp">
				<jsp:param name="EMPNO" value="<%=EMPNO%>"/>
			</jsp:forward>
		<%
	
	
	%>
	
	<script>
		for(i=1;i<=10;i++) document.write("<br>");
	</script>
		<H3 align="center">Details Updated Successfully </H3>
	<BR>
	<center>
		<A href="Report.jsp"> Back </A>
	</center>
	<%}
	}
else{
%>
	<H3 align="center">Sorry Employee already exists in the databases</H3>
	<%}	
}
catch(Exception e)
{
	System.out.println("Exception"+e);
e.printStackTrace();
}
%>

</body>
</html>