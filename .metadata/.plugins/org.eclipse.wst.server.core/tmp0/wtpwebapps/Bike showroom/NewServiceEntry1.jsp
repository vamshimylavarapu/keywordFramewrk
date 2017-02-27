  <HTML>
  <%@ page language="java" %>
  <%@ page session="true" %>
  <%@ page import="java.sql.*,java.io.*,java.util.Random"%>
   <% String CustID = request.getParameter("CustID");%>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Service entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var CustID = document.NewServiceForm.CustID.value;
	var ServiceID = document.NewServiceForm.ServiceID.value;
	var ServiceNumber = document.NewServiceForm.ServiceNumber.value;
	var ServiceType = document.NewServiceForm.ServiceType.value;
	var ServiceDetails = document.NewServiceForm.ServiceDetails.value;
	var DOService = document.NewServiceForm.DOService.value;
   	var BillAmmount = document.NewServiceForm.BillAmmount.value; 
	var BillNo = document.NewServiceForm.BillNo.value;

	if(CustID==""||ServiceID==""||ServiceNumber==""||ServiceDetails==""||DOService==""||BillAmmount==""||BillNo==""){
		alert("All the fields are mandatory");
		return false;
	}
   }

	//-->
	</SCRIPT>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>

  </HEAD>
  <body Class=SC>
	<!-- To display Menu --Start -->
	<script language="JavaScript1.2" src="coolfunctions.js"></script>
	<script language="JavaScript1.2" src="coolmenus.js"></script>
	<!-- To display Menu --End --><br><br><br>

  <FORM NAME="NewServiceForm" onSubmit="return check()" action="NewServiceEntry2.jsp">
   <CENTER>
<!--CustID	ServiceID ServiceNumber ServiceType ServiceDetails DOService BillAmmount BillNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Service entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="15" value="<%=CustID%>" readonly></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>ServiceID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ServiceID" SIZE="15"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>ServiceNumber *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ServiceNumber" SIZE="15"></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>ServiceType *</TD>
	   <TD><select name="ServiceType" onchange="fnCheckMode(this)">
				<option value="---">---</option>	
				<option value="Free">Free</option>
				<option value="Cash">Cash</option>	   
			</select></TD>
	   
	   </TR>

	   <TR class=row_even >
	   <TD>ServiceDetails *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ServiceDetails" SIZE="15"></TD>
	   </TR>

       <TR class=row_odd >

	   <TD>DOService *</TD><tD nowrap>
<input size=20 readonly id="DOService" name="DOService">
<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
</tD>

	 
	   </TR>
       
	   <TR class=row_even >
	   <TD> BillAmmount*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="BillAmmount" SIZE="15"></TD>
	   </TR>

       <TR class=row_odd >
	   <TD>BillNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="BillNo" SIZE="15"></TD>
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
