
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Salay Details</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

/* Function to show popup window displaying details of Employee based on emp num */
function fnEmpPopUp(strEMPNO)
{ 

var intLeft=0;
var strTitle ='Details';
var strUrl = 'EmpSalDetails.jsp?EMPNO='+strEMPNO;
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
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

int EMPNO;
float Basic,DA,GrossAmt,NetAmt;
String PaySlipDate;
String orderby=(String)request.getParameter("orderby");
if(orderby==null){
orderby="EMPNO";
}
%>

<%
System.out.println("--1--");
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM SalaryMaster order by "+orderby;
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>

	<tr class=row_title>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=EMPNO">EMP NO</a></th>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=Basic">Basic</a></th>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=DA">DA</th>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=GrossAmt">Gross Salary</a></th>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=NetAmt">NetPay</a></th>
	<th class=row_title><a class=title href="SalaryDetails.jsp?orderby=PaySlipDate">PaySlipDate</a></th>
	</tr>

<%
int DisRow=0;
	/*Getting the values from the database*/
	System.out.println("---2---");
	while(rs.next())
	{
	  EMPNO=rs.getInt(1);
	  Basic=rs.getFloat(2);
	  DA=rs.getFloat(3);
 	  GrossAmt=rs.getFloat(4);
  	  NetAmt=rs.getFloat(5);
	  PaySlipDate=rs.getString(6);
	 DisRow++;

%>
	<!--Displaying the values from database-->
<%
	if(DisRow%2!=0){
	%><tr class=row_odd><%
	}else{
	%><tr class=row_even><%
	}%>
	<%if(auth==0){%>
		<td align=center><a id="x" href="javascript:fnEmpPopUp(<%=EMPNO%>)" target="_self"><%=EMPNO%>  </a></td>
	<%}else{%>
	<td align=center><%=EMPNO%></td>
	<%}%>
	<td align=center><%=Basic%></td>
	<td align=center><%=DA%></td>
  	<td align=center><%=GrossAmt%></td>
	<td align=center><%=NetAmt%></td> 
 	<td align=center><%=PaySlipDate%></td> 
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

