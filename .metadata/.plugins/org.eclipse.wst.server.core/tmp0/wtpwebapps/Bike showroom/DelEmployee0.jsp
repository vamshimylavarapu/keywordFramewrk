<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">	
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <TITLE> Delete Employee </TITLE>
	
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var EMPNO = document.DelEmpForm.EMPNO.value;
		if(EMPNO==""){
			alert("Employee number is mandatory");
			document.DelEmpForm.EMPNO.focus();
			return false;
		}
		else
		{
		  	var ed=EMPNO;
			var pattern = /^([0-9]{1,8})$/;
			if(!(pattern.test(ed))){ 
				alert("Please enter numbers only");
				document.DelEmpForm.EMPNO.value="";
				document.DelEmpForm.EMPNO.focus();
				return false;
		}

	}
	return true;
	}

	//-->
	</SCRIPT>
  </HEAD>
 <jsp:include page="MultiLevelmenu.htm"/><br><br><br>

  <body Class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
	

  <FORM NAME="DelEmpForm" onSubmit="return check()" action="DelEmployee.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Remove Employee </TH>
	   </TR>
	   <TR class=row_even >
	   <TD>EMPNO *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EMPNO" SIZE="10"></TD><td><input type="button" value="Show Employees" onclick="fnEmpPopUp('ListEmployees.jsp',300,300)"></td>
	   </TR>
	   <TR class=row_odd  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Remove" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Clear"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
 <%
  }
  %>