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

var PriSkillFlag=false;
var remarksFlag=false;


/* Functions to set Flags if any of the details get modified */
function setPriSkillFlag()
{
	PriSkillFlag=true;

}
function setRemarksFlag()
{
	remarksFlag=true;
}

/*Checking wether any fields get modified or not.*/
function Check(){
//  modification in condition
if(PriSkillFlag==true||remarksFlag==true)
	{
	  if(remarksFlag==false){
		window.alert("Remarks Field is mandatory...while modifying details");
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

String EMPName,MailID,CurrentLocation,Role;
String  Qualification,Remarks;
String strEMPNO = request.getParameter("EMPNO");
String strCurrentLocation=request.getParameter("txtCurrentLocation");
//System.out.println(strCurrentLocation);
int EMPNO= Integer.parseInt(strEMPNO);
//System.out.println(EMPNO);
Date JoiningDate;

try
{

	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();


	String Query = "SELECT * from EmpMaster where EMPNO="+EMPNO;


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
      EMPName=rs.getString(1);
	  EMPNO=rs.getInt(2);
	  MailID=rs.getString(3);
  	  CurrentLocation=rs.getString(4);
	  JoiningDate=rs.getDate(5);
	  Role=rs.getString(6);
	  Qualification=rs.getString(7);
	  Remarks=rs.getString(8);
	  	String RemarksBKUP = Remarks;
	if(Remarks==null) Remarks="";
	if(Remarks.equals("null")) Remarks="";
	  session.setAttribute("RemarksBKUP2",RemarksBKUP);
%>

<!-- If data in any fields get modified then control goes to modifydetails.jsp -->

<FORM action="ModifyDetails.jsp" method="post" name="ModForm" 
onSubmit='return Check()'>
	<H3 CLASS=Top> <%=EMPName%>(<%=EMPNO%>)</H3>
<TABLE>
	<TR class=row_odd><TD>EMPName</TD><TD><%if(EMPName==null)EMPName="-";%><%=EMPName%></TD>			
	<TR class=row_even><TD>Emp Number</TD><TD><%=EMPNO%></TD>
	<TR class=row_odd><TD>Email ID</TD><TD><%if(MailID==null)MailID="-";%><%=MailID%></TD>
	<TR class=row_even><TD>CurrentLocation</TD><TD><%if(CurrentLocation==null)CurrentLocation="-";%><%=CurrentLocation%></TD>
  	<TR class=row_odd><TD>JoiningDate</TD><TD><%=JoiningDate%></TD>
  	<TR class=row_even><TD>Qualification</TD><TD><%if(Qualification==null)Qualification="-";%><%=Qualification%></TD>
  	<TR class=row_odd>
		<TD>Role</TD>
		<TD><INPUT name= Role type=text width="30" value="<%= Role%>" onchange="setPriSkillFlag()"></TD>
	</TR>
	<TR class=row_even>
		<TD>Remarks</TD>
		<TD><INPUT name=Remarks type= text width="50" value="" onchange="setRemarksFlag()">(Enter new Remarks)
		<!--	<INPUT name=Remarks1 type= text width="30" value="<%=Remarks%>" DISABLED>  -->
			<TEXTAREA  WIDTH = "25" onchange='this.value="<%=Remarks%>"'> <%=Remarks%> </TEXTAREA>(Existing Remarks)
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
		<INPUT name=CurrentLocation type=hidden width="30" value="<%=CurrentLocation%>">
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
