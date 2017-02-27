
<%@ page language="java"%>
<%@ page session="true"%>
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
<jsp:include page="MultiLevelmenu.htm" /><br>
<br>
<br>

<body Class=SC>
	<%
		Integer IAuth = (Integer) session.getAttribute("auth");
		int auth = IAuth.intValue();
		System.out.println("===Authentication==" + auth);

		if (auth == 1) {
	%><H3 align=center>
		<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You
		are not authorized to access this page
	</H3>
	<%
		} else {
	%>
	<FORM NAME="NewPurchaseForm" onSubmit="return check()"
		action="NewPurchaseEntry.jsp">
		<CENTER>
			<!--ProdID	Stock	BillNo	SundryCreditor	VATOnPurchases	TIN	DOPurchase -->

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">New Purchase entry</TH>
				</TR>
				<TR class=row_odd>
					<TD>ProdID *</TD>
					<TD><INPUT TYPE="TEXT" NAME="ProdID" SIZE="10"></TD>
				</TR>
				<TR class=row_even>
					<TD>Quantity *</TD>
					<TD><INPUT TYPE="TEXT" NAME="Stock" SIZE="10"></TD>
				</TR>

				<TR class=row_odd>
					<TD>BillNo *</TD>
					<TD><INPUT TYPE="TEXT" NAME="BillNo" SIZE="30"></TD>
				</TR>
				<TR class=row_even>
					<TD>DOPurchase *</TD>
					<TD><input size=20 readonly id="DOPurchase" name="DOPurchase">
						<img  id="imgDate"
						style="CURSOR: hand" height="16"
						src="Images/CalDis.gif" width="16" border="0" name="imgDate"
						onMouseOver="fnEnableCalLookup(this)"
						onMouseOut="fnDisableCalLookup(this)"></TD>
				</TR>
				<TR class=row_odd>
					<TD>Bill Ammount *</TD>
					<TD><INPUT TYPE="TEXT" NAME="BillAmmount" SIZE="30"></TD>
				</TR>
				<TR class=row_even>
					<TD>VAT on Purchases *</TD>
					<TD><INPUT TYPE="TEXT" NAME="VATOnPurchase" SIZE="30"></TD>
				</TR>

				<TR class=row_odd>
					<TD>Sundry Creditor *</TD>
					<TD><INPUT TYPE="TEXT" NAME="SundryCreditor" SIZE="30"></TD>
				</TR>
				<TR class=row_even>
					<TD>TIN *</TD>
					<TD><INPUT TYPE="TEXT" NAME="TIN" SIZE="30"></TD>
				</TR>
				<TR class=row_odd ALIGN="CENTER">
					<TD><INPUT TYPE="SUBMIT" VALUE="Add"></TD>
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
		cal.manageFields("imgDate", "DOPurchase", "%d/%m/%Y");
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
