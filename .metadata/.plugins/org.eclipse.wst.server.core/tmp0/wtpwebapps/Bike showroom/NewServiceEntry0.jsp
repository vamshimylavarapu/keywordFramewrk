<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Service entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />
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
	

  <FORM NAME="NewServiceForm" onSubmit="return check()" action="NewServiceEntry.jsp">
   <CENTER>
<!--CustID	ServiceID ServiceNumber ServiceType ServiceDetails DOService BillAmmount BillNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Service entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="15" ></TD>
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
<img  id="imgDate" style="CURSOR: hand" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
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
   
   
   
   
   
    <script type="text/javascript">
		//<![CDATA[

		var cal = Calendar.setup({
			onSelect : function(cal) {
				cal.hide()
			},
			showTime : true
		});
		cal.manageFields("imgDate", "DOService", "%d/%m/%Y");
		/*   cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d %I:%M %p"); */
		/*   cal.manageFields("f_btn2", "f_date2", "%b %e, %Y %I:%M %p");
		  cal.manageFields("f_btn3", "f_date3", "%e %B %Y %I:%M %p");
		  cal.manageFields("f_btn4", "f_date4", "%A, %e %B, %Y %I:%M %p");
		 */
		//]]>
	</script>
   </BODY> 
   </HTML>
 <%
  }
  %>