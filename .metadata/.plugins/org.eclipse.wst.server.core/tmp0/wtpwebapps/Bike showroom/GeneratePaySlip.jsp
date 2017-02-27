
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Pay Slip</title>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=left>
<a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<form name=cons>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
Statement stmt1=null;
ResultSet rs=null;
ResultSet rs1=null;

String filedata="";
String filestr="";
File file=null;
FileWriter fr=null;
Random rand = new Random(100000l);

int EmpNo;
float Basic,DA,GrossAmt,NetAmt;
float HRA,OAllowances;
float ODeductions=0,IT,PT,TotalDeductions;
String PaySlipDate;
String StartDate=(String)request.getParameter("Start");
String EndDate=(String)request.getParameter("End");;
String strEMPNO=(String)request.getParameter("EMPNO");
int EMPNO = Integer.parseInt(strEMPNO);
String EmpName="";
%>
<H2 align=center>Honda Shoppe<H2>
<h3 align=center>Salary Slip for the Period <%=StartDate%> - <%=EndDate%> (Figures in INR)</h3>

<%

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	stmt1 = con.createStatement();
	String Query = "SELECT EMPNo,Basic,DA, (DA*2), (Basic+DA)* 0.05,PaySlipDate,(Basic+2*DA), ( Basic+DA+(DA*2)+(Basic+DA)*0.05+(Basic+2*DA) ) ,(GrossAmt*0.05),GrossAmt-((Basic+DA)* 0.05)-(GrossAmt*0.05) FROM SalaryMaster where EMPNO = "+EMPNO;
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
	String getEmpName = "Select EMPName from EmpMaster where EMPNo = "+EMPNO;
	rs1 = stmt1.executeQuery(getEmpName);
	if(rs1.next()){
		EmpName = rs1.getString(1);
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}
if(rs!=null)
{
%>
	<!--Displaying the table header-->
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->
<%
	/*Getting the values from the database*/
	System.out.println("---2---");
	while(rs.next())
	{
	  EmpNo=rs.getInt(1);
	  Basic=rs.getFloat(2);
	  DA=rs.getFloat(3);
 	  HRA=rs.getFloat(4);
  	  PT=rs.getFloat(5);
	  PaySlipDate=rs.getString(6);
	  OAllowances= rs.getFloat(7);
	  GrossAmt = rs.getFloat(8);
	  IT = rs.getFloat(9);
	  TotalDeductions = (PT+IT+ODeductions);
	  NetAmt= rs.getFloat(10);

%>
	<!--Displaying the values from database-->
	<table align=left border=1 width="50%">
		<tr><td align=center><b><font color="">Employee NO</font></b></td><td align=center><font  color="red"><b><%=EmpNo%></b></font></td></tr>
		<tr><td align=center><b><font color="">Name</font></b></td><td align=center><font  color="red"><b><%=EmpName%></b></font></td></tr>
	</table>
<br><br><br>
	<!--<h3 align=center><font size="+1" color="">Earnings</font></h3>-->
	<table align=left border=1  width="50%">
	<tr><td align=center colspan=2><b><font color="">Earnings</font></b></td></tr>
		<tr><th align=center>Basic</th><td align=center><%=Basic%></td></tr>
		<tr><th align=center>DA</th><td align=center><%=DA%></td></tr>
		<tr><th align=center>HRA</th><td align=center><%=HRA%></td></tr>
		<tr><th align=center>Other Allowances</th><td align=center><%=OAllowances%></td></tr>
		<tr><th align=center><b>Total</b></th><td align=center><b><%=GrossAmt%></b></td></tr>
	</table>

	<!--<h3 align=center><font size="+1" color="">Deductions</font></h3>-->
	<table align=left border=1  width="50%">
	<tr><td align=center colspan=2><b><font color="">Deductions</font></b></td></tr>
		<tr><th align=center>PT</th><td align=center><%=PT%></td></tr>
		<tr><th align=center>Income Tax </th><td align=center><%=IT%></td></tr>
		<tr><th align=center>Other Deductions</th><td align=center><%=ODeductions%></td></tr>
		<tr><th colspan=2>&nbsp;</th></tr>
		<tr><th align=center><b>Total</b></th><td align=center><b><%=TotalDeductions%></b></td></tr>
		<tr><th align=center><b>Net Pay</b></th><td align=center><b><%=NetAmt%></b></td></tr>
	</table>	

<%
	}
	rs.close();
	rs1.close();
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


</form>
</BODY>
</HTML>

