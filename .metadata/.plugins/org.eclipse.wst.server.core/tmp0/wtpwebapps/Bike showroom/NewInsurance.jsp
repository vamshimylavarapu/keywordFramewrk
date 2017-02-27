<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />
<TITLE>New Purchase entry</TITLE>
<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function check() {
		var ProdID = document.NewPurchaseForm.ProdID.value;
		var Stock = document.NewPurchaseForm.Stock.value;
		var BillNo = document.NewPurchaseForm.BillNo.value;
		var SundryCreditor = document.NewPurchaseForm.SundryCreditor.value;
		var TIN = document.NewPurchaseForm.TIN.value;
		var DOPurchase = document.NewPurchaseForm.DOPurchase.value;
		var BillAmmount = document.NewPurchaseForm.BillAmmount.value;
		var VATOnPurchase = document.NewPurchaseForm.VATOnPurchase.value;
		var curDate = new Date();

		if (ProdID == "" || Stock == "" || BillNo == "" || SundryCreditor == ""
				|| TIN == "" || DOPurchase == "" || BillAmmount == ""
				|| VATOnPurchase == "") {
			alert("All the fields are mandatory");
			return false;
		}
		if (DOPurchase == "") {
			alert("Loading current date");
			document.NewPurchaseForm.DOPurchase.value = curDate;
		}
		return true;
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
	
  <FORM NAME="NewCustomerForm" onSubmit="return check()" action="NewInsuranceEntry.jsp">
   <CENTER>
<!--CustID	CustName	Address 	PhoneNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Insurance Entry </TH>
	   </TR>
	   <TR class=row_odd >
	    <TD>CustName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustName" SIZE="10"></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>VehicleNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="vehicleno" SIZE="10"></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Amount *</TD> 
       <TD><INPUT TYPE="TEXT" NAME="amount" SIZE="10"></TD>
	    </TR>
	   
	    <TR class=row_even >
	   <TD>Date Of Insurance *</TD>
	   <TD><INPUT TYPE="TEXT"id="doi" NAME="doi" SIZE="10"><img  id="imgDate"
						style="CURSOR: hand" height="16"
						src="Images/CalDis.gif" width="16" border="0" name="imgDate"
						onMouseOver="fnEnableCalLookup(this)"
						onMouseOut="fnDisableCalLookup(this)"></TD></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>Date Of Expiery *</TD>
	   <TD><INPUT TYPE="TEXT" id="doe" NAME="doe" SIZE="10"><img  id="imgDate1"
						style="CURSOR: hand" height="16"
						src="Images/CalDis.gif" width="16" border="0" name="imgDate"
						onMouseOver="fnEnableCalLookup(this)"
						onMouseOut="fnDisableCalLookup(this)"></TD></TD>
	   </TR>
       <TR class=row_even  ALIGN="CENTER">
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
		cal.manageFields("imgDate", "doi", "%d/%m/%Y");
		cal.manageFields("imgDate1", "doe", "%d/%m/%Y");
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