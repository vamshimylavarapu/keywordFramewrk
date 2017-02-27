<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Credit entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var CustID = document.NewCreditForm.CustID.value;
	var CreditID = document.NewCreditForm.CustName.value;
	var EMI= document.NewCreditForm.Address.value;
	var Tenure = document.NewCreditForm.PhoneNo.value;

	if(CustID==""||CreditID==""||EMI==""||Tenure==""){
		alert("All the fields are mandatory");
		return false;
	}
   }

	//-->
	</SCRIPT>
  </HEAD>
  <body Class=SC>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="NewCreditForm" onSubmit="return check()" action="NewCreditEntry.jsp">
   <CENTER>
<!--CustID	CreditID EMI Tenure -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Credit entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="10" ></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>CreditID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CreditID" SIZE="10" ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>EMI *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EMI" SIZE="10"></TD>
	   </TR>
	   
	    <TR class=row_even >
	   <TD>Tenure *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Tenure" SIZE="10"></TD>
	   </TR>
       <TR class=row_odd  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
		</TR>   
   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
 <%
  }
  %>