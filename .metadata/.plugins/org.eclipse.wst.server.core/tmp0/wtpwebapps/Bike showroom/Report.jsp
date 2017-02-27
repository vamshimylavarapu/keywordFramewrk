<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password
			
-->

<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<BR>
<Title>Reports</Title>
<font face="Times New ROman" color=blue >
<center>


<BR>


<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("userr");%>

<h2 class=report>Welcome <u><%=Userid%></u> to Bike Showroom Automation</FONT></h2><br>





<p align="right">
<A href="ChangePassword1.jsp">Change Password </A><BR>
<%
/* Verifying wether the user is authorised to edit emp details
	if user is authorised he can edit the details if not he can
	only view the details */
	Integer EmpAuth = (Integer)session.getAttribute("auth");
	int Auth = EmpAuth.intValue();
	System.out.println(Auth);
			/*If authorised show Download data to Excel */
		if(Auth==0){
		%>
			<A href="AddUser.html">Add new user </A><BR> 
		<%
		}

%>

</p>
</body>
</html>