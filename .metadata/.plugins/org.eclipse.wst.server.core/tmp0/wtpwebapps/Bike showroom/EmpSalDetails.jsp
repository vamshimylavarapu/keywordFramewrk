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
	
	
var Loc = "EditSalDetails.jsp?EMPNO="+strEMPNO;

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

String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);
float Basic,DA,GrossAmt,NetAmt;
Date PaySlipDate;
int Auth = 1;
System.out.println("---1---"+strEMPNO);
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();

	String Query = "SELECT * from SalaryMaster where EMPNO="+EMPNO;
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
 	  EMPNO=rs.getInt(1);
	  Basic=rs.getFloat(2);
	  DA=rs.getFloat(3);
 	  GrossAmt=rs.getFloat(4);
  	  NetAmt=rs.getFloat(5);
	  PaySlipDate=rs.getDate(6);
%>
	<!--Displaying the values from database-->
	<H3 CLASS=Top> (<%=EMPNO%>)</H3>
	<TABLE>
	<TR class=row_odd><TD>Emp Number</TD><TD><%=EMPNO%></TD>			
	<TR class=row_even><TD>Basic</TD><TD><%=Basic%></TD>
	<TR class=row_odd><TD>DA</TD><TD><%=DA%></TD>
	<TR class=row_even><TD>Gross Salary</TD><TD><%=GrossAmt%></TD>
  	<TR class=row_odd><TD>Net Salary</TD><TD><%=NetAmt%></TD>
  	<TR class=row_even><TD>Payment Date</TD><TD><%=PaySlipDate%></TD>
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

