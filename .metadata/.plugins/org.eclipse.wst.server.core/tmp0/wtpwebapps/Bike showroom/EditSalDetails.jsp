<!--
	File : EditDetails.jsp
	Purpose : This jsp is modify the details of Employes by Authorised users.Only Authorised 
			  Users can Edit or Modify the details.

-->
<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<TITLE></TITLE>

<Script language="JavaScript">
var i;

var GrossFlag=false;
var NetFlag=false;


/* Functions to set Flags if any of the details get modified */
function setGrossFlag()
{
	GrossFlag=true;

}
function setNetFlag()
{
	NetFlag=true;
}

/*Checking wether any fields get modified or not.*/
function Check(){
//  modification in condition
if(GrossFlag==true||NetFlag==true)
	{
	  if(NetFlag==false){
		window.alert("NetAmt Field is mandatory...while modifying details");
		return false;
	  }
	  else
		return true;
	}
	else{
		window.alert("Not Modified any Fields...Press Cancel to exit");
		return false;
	}
}
</script>
</HEAD>
<body class= SC>
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
float Basic,DA,GrossAmt,NetAmt;
Date PaySlipDate;
String strEMPNO = request.getParameter("EMPNO");
int EMPNO= Integer.parseInt(strEMPNO);

try
{

	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();


	String Query = "SELECT * from SalaryMaster where EMPNO="+EMPNO;


	//System.out.println(Query);
	rs = stmt.executeQuery(Query);
		
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}

if(rs!=null)
{
	/*Getting the values from the database*/

	while(rs.next())
	{
	  //System.out.println("----------");
	  EMPNO=rs.getInt(1);
	  Basic=rs.getFloat(2);
  	  DA=rs.getFloat(3);
	  GrossAmt=rs.getFloat(4);
	  NetAmt=rs.getFloat(5);
	 PaySlipDate=rs.getDate(6);
%>

<!-- If data in any fields get modified then control goes to modifydetails.jsp -->

<FORM action="ModifySalaryDetails.jsp" method="post" name="ModForm" 
onSubmit='return Check()'>
	<H3 CLASS=Top>(<%=EMPNO%>)</H3>
<TABLE>
	<TR class=row_even><TD>Emp Number</TD><TD><%=EMPNO%></TD>
	<TR class=row_odd><TD>Basic</TD><TD><%=Basic%></TD>
	<TR class=row_even><TD> DA</TD><TD><%= DA%></TD>
  	<TR class = row_odd><TD>PaySlipDate</TD><TD><%=PaySlipDate%></TD>
  	<TR class=row_even>
		<TD>GrossAmt</TD>
		<TD><INPUT name=GrossAmt type=text width="30" value="<%=GrossAmt%>" onchange="setGrossFlag()">(Enter new GrossAmt)</TD>
	</TR>
	<TR class=row_odd>
		<TD>NetAmt</TD>
		<TD><INPUT name=NetAmt type= text width="50" value="<%=GrossAmt%>" onchange="setNetFlag()">(Enter new NetAmt)
	
			
		</TD>
	</TR>
	<TR class=row_odd>
	<td>
		<input type="Submit" value="Modify" id="sid" >
	</td>
	<td>
		<input type="Button" value="Cancel" onclick='window.close()' >
	</td>
	</tr>

</TABLE>
		<INPUT name=EMPNO type=hidden width="30" value="<%=EMPNO%>">

</FORM>

<%
	}
	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");

}

%>
</BODY>
</HTML>
