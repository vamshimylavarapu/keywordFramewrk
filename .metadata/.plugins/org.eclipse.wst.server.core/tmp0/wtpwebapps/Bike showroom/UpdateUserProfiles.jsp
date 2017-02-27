<HTML>
<head>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
<script language="javascript" src="Images\validate.js"></script>
<jsp:include page="MultiLevelmenu.htm"/><BR><BR><BR>
<BODY  Class=SC>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%	String AccessCodes = (String)session.getAttribute("AccessCodes"); %>
<%if(AccessCodes.indexOf("LR")>-1||AccessCodes.indexOf("LU")>-1){%>
<%
System.out.println("1---------");
	System.out.println("2-----------");
		String UserID = request.getParameter("UserID");
	System.out.println("3-------------"+UserID);

		String ActAuth = request.getParameter("Auth");
		int Auth=(ActAuth.equals("1")) ? 1:0;
		String ActStatus = request.getParameter("ActiveStatus");
		int ActiveStatus = (ActStatus.equals("Active")) ? 1 : 0;

		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		int res=0;
		try
		{
	System.out.println("I am here and safe..in try");
			/*Getting the connection variable from session*/
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Qry = "Update Login set Auth=\'"+Auth+"\',ActiveStatus="+ActiveStatus+" where Userid=\'"+UserID+"\'";
			res = stmt.executeUpdate(Qry);
			if(res==1){
			%><BR><BR><BR><BR><BR><BR><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Updated Successfully</H5>
			<h3 align=center><A HREF="UsersProfiles.jsp">Back to User Profiles</A></h3>
			<%
			}
			else{
			%><BR><BR><BR><BR><BR><BR><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Unknown Error..please try again</H5>
			<h3 align=center><A HREF="UsersProfiles.jsp">Back to User Profiles</A></h3>
			<%
			}
		}
		catch(Exception e)
		{
			//System.out.println("Exception"+e);
			%><%=e%><%
		}

}
else
{
	%><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page.</H5><%
}
%>



