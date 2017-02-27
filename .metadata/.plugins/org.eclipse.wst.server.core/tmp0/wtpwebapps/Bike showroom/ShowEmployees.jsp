
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>ConsolidatedReprot</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

/* Function to show popup window displaying details of Employee based on emp num */
function fnEmpPopUp(strEMPNO)
{ 

var intLeft=0;
var strTitle ='Details';
var strUrl = 'EMPDetails.jsp?EMPNO='+strEMPNO;
	intLeft = screen.availWidth/2;
var strOptions= 'menubar=no,toolbar=no,scrollbars=yes,resizable=Yes,height=500,width=500,left=' + (intLeft)  + ',top=0';
fnNewDetailsPopUp(strUrl,strTitle,strOptions);
}	
function fnNewDetailsPopUp(strUrl,strTitle,strOptions)
{
	popupWin = window.open(strUrl,strTitle,strOptions).focus();
}

//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=left><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center>Employee List</h2>
<form name=cons>


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
String Domain,Qualification,Remarks;
int EMPNO;
String JoiningDate;
String orderby=(String)request.getParameter("orderby");
if(orderby==null){
orderby="EMPName";
}
%>

<%

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_UPDATABLE);
	String Query = "SELECT EmpMaster.EMPName, EmpMaster.EMPNO, EmpMaster.MailID, EmpMaster.CurrentLocation, EmpMaster.JoiningDate, EmpMaster.Role, EmpMaster.Qualification, EmpMaster.Remarks FROM EmpMaster order by "+orderby;

	//System.out.println(Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs.first())
{
//System.out.println("Resultset is not null");
rs.beforeFirst();

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>

	<tr class=row_title>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=EMPName">EMPName</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=EMPNO">EMPNO</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=MailID">MailID</th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=CurrentLocation">Location</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=JoiningDate">Joining Date</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=Role">Role</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=Qualification">Qualification</a></th>
	<th class=row_title><a class=title href="ShowEmployees.jsp?orderby=Remarks">Remarks</a></th>
	</tr>

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  EMPName=rs.getString(1);
	  EMPNO=rs.getInt(2);
	  MailID=rs.getString(3);
  	  CurrentLocation=rs.getString(4);
	  JoiningDate=rs.getString(5);
	  Role=rs.getString(6);
	  Qualification=rs.getString(7);
	  Remarks=rs.getString(8);
	 DisRow++;

%>
	<!--Displaying the values from database-->
<%
	if(DisRow%2!=0){
	%><tr class=row_odd><%
	}else{
	%><tr class=row_even><%
	}%>
	
	
	<td><%if(EMPName==null||(EMPName.trim()).equals("")) EMPName="-";%>
		<%=EMPName%></td>
	<td><a id="x" href="javascript:fnEmpPopUp('<%=EMPNO%>')" target="_self"><%=EMPNO%>  </a></td>
	<td><%if(MailID==null||(MailID.trim()).equals(""))MailID="-";%><%=MailID%></td>
 	<td><%if(CurrentLocation==null||(CurrentLocation.trim()).equals(""))CurrentLocation="-";
		if((CurrentLocation.trim()).equals("HYDERABAD"))CurrentLocation="Hyderabad";
	    if((CurrentLocation.trim()).equals("BANGALORE"))CurrentLocation="Bangalore";
	    if((CurrentLocation.trim()).equals("PUNE"))CurrentLocation="Pune";%>
	 <%=CurrentLocation%></td> 
  	 <%
		if(JoiningDate==null){
			%><td>-</td><%
		}else{
		 %><td><%=JoiningDate%></td><%
		}
	 %>	
  	<td>
	<%
		if(Role==null||(Role.trim()).equals(""))	Role="-";
	%><%=Role%></td>
  	<td><%if( Qualification==null||( Qualification.trim()).equals("")) Qualification="-";%><%= Qualification%></td>
	<td><%if(Remarks==null||Remarks.trim().equals(""))Remarks="-";%><%=Remarks%></td> 
</tr>


<%
	}


	rs.close();
%>
<%
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
	%>
		<CENTER>
		<B>No Records found............<B><BR>
		<A href="Report.jsp"> Back </A>
		</CENTER>
	<%

}


%>


</table>
</form>
</BODY>
</HTML>

