<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Customer entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var CustID = document.NewCustomerForm.CustID.value;
	var CustName = document.NewCustomerForm.CustName.value;
	var Address = document.NewCustomerForm.Address.value;
	var PhoneNo = document.NewCustomerForm.PhoneNo.value;

	if(CustID==""||CustName==""||Address==""||PhoneNo==""){
		alert("All the fields are mandatory");
		return false;
	}
		if(PhoneNo.length<10)
		{
			alert("enter valid PhoneNo");
			document.NewCustomerForm.PhoneNo.value="";
			document.NewCustomerForm.PhoneNo.focus();
			return false;
		}
		if(CustName.length<4)
		{
			alert("CustName should be 4 chars");
			document.NewCustomerForm.CustName.value="";
			document.NewCustomerForm.CustName.focus();
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
	
  <FORM NAME="NewCustomerForm" onSubmit="return check()" action="NewCustomerEntry.jsp">
   <CENTER>
<!--CustID	CustName	Address 	PhoneNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Customer entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="10" ></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>CustName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustName" SIZE="10"></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Address *</TD> 
       <TD><INPUT TYPE="TEXT" NAME="Address" SIZE="10"></TD>
	    </TR>
	   
	    <TR class=row_even >
	   <TD>PhoneNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PhoneNo" SIZE="10"></TD>
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