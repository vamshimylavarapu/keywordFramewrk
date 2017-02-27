<!--
	File : EmpDetails.jsp
	Purpose : This jsp is used to display the details of all the employees and also 
			  provide link to view or edit the details.

-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
<TITLE> Employee Details </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript">
<!--

function editDetails(Label , strEMPNO){
	
	
var Loc = "EditDetails.jsp?EMPNO="+strEMPNO;

	if(Label=="Close")	{ window.close(); }
	else if(Label == "Edit") 
	{
location.replace(Loc);
	}


}
//-->
</SCRIPT>
</HEAD>


<BODY class=SC >



<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String filedata="";
String filestr="";
File file=null;
FileWriter fr=null;
Random rand = new Random(100000l);

String EMPName,MailID,CurrentLocation,Role;
String  Qualification,Remarks;
String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);
Date JoiningDate;
int Auth = 1;
System.out.println("---1---"+strEMPNO);
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();

	String Query = "SELECT * from EmpMaster where EMPNO="+EMPNO;
	System.out.println(Query+"----2----");
	rs = stmt.executeQuery(Query);
	System.out.println("---3----");
		
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}

if(rs!=null)
{
	/*Getting the values from the database*/

	if(rs.next())
	{
	 System.out.println("-----4-----");
          EMPName=rs.getString(1);
	  EMPNO=rs.getInt(2);
	  MailID=rs.getString(3);
  	  CurrentLocation=rs.getString(4);
	  JoiningDate=rs.getDate(5);
	  Role=rs.getString(6);
	   Qualification=rs.getString(7);
	  Remarks=rs.getString(8);


%>
	<!--Displaying the values from database-->
	<H3 CLASS=Top> <%=EMPName%>(<%=EMPNO%>)</H3>
	<TABLE>
	<TR class=row_odd><TD>EMPName</TD><TD><%if(EMPName==null)EMPName="-";%><%=EMPName%></TD>			
	<TR class=row_even><TD>Emp Number</TD><TD><%=EMPNO%></TD>
	<TR class=row_odd><TD>Email ID</TD><TD><%if(MailID==null)MailID="-";%><%=MailID%></TD>
	<TR class=row_even><TD>CurrentLocation</TD><TD><%if(CurrentLocation==null)CurrentLocation="-";%><%=CurrentLocation%></TD>
  	<TR class=row_odd><TD>JoiningDate</TD><TD><%=JoiningDate%></TD>
  	<TR class=row_even><TD>Role</TD><TD><%if(Role==null)Role="-";%><%=Role%></TD>
  	<TR class=row_odd><TD>Qualification</TD><TD><%if( Qualification==null) Qualification="-";%><%= Qualification%></TD>
  	<TR class=row_odd><TD>Remarks</TD><TD><%if(Remarks==null)Remarks="-";%><%=Remarks%></TD>
	</TABLE>
<%
	}
	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
}
/* Verifying wether the user is authorised to edit emp details
	if user is authorised he can edit the details if not he can
	only view the details */
Integer EmpAuth = (Integer)session.getAttribute("auth");
	Auth = EmpAuth.intValue();
	//System.out.println(Auth);
		String path="";
		String label="";
		/*If authorised show Edit and Close Buttons */
		if(Auth==0){
			label ="Edit";%>
				<TR><TD><INPUT TYPE="button" value="<%=label%>" onclick='editDetails("<%=label%>","<%=EMPNO%>");'></TD>
				<TD><INPUT TYPE="button" value="Close" onclick='window.close()'></TD></TR>

       <%
		}
	    /* For Normal Users show Close button only */
		else {
			label = "Close"; %>
<TR><TD><INPUT TYPE="button" value="<%=label%>" onclick='editDetails("<%=label%>","<%=EMPNO%>");'></TD></TR>
			<%
        }
     %>
</BODY>
</HTML>

