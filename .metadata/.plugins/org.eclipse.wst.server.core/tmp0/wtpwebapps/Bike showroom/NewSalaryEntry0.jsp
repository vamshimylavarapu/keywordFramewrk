
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String EMPNO = request.getParameter("EMPNO");
%>
<HTML>
<HEAD>
<LINK href="styles.css" type="text/css" rel="stylesheet">

<TITLE>New Salary entry</TITLE>
<script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />

<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function check() {
		var EMPNO = document.NewSalaryForm.EMPNO.value;
		var Basic = document.NewSalaryForm.Basic.value;
		var DA = document.NewSalaryForm.DA.value;
		var GrossAmt = document.NewSalaryForm.GrossAmt.value;
		var NetAmt = document.NewSalaryForm.NetAmt.value;
		var PaySlipDate = document.NewSalaryForm.PaySlipDate.value;

		if (EMPNO == "" || Basic == "" || DA == "" || GrossAmt == ""
				|| NetAmt == "" || PaySlipDate == "") {
			alert("All the fields are mandatory");
			return false;
		}
		if (Basic.length < 3) {
			alert("enter valid Basic");
			document.NewSalaryForm.Basic.value = "";
			document.NewSalaryForm.Basic.focus();
			return false;
		}
		if (Basic < 0) {
			alert("enter Positive Basic");
			document.NewSalaryForm.Basic.value = "";
			document.NewSalaryForm.Basic.focus();
			return false;
		}

		if (DA.length < 3) {
			alert("enter valid DA");
			document.NewSalaryForm.DA.value = "";
			document.NewSalaryForm.DA.focus();
			return false;
		}
		if (DA < 0) {
			alert("enter Positive DA");
			document.NewSalaryForm.DA.value = "";
			document.NewSalaryForm.DA.focus();
			return false;
		}
		if (GrossAmt.length < 3) {
			alert("enter valid GrossAmt");
			document.NewSalaryForm.GrossAmt.value = "";
			document.NewSalaryForm.GrossAmt.focus();
			return false;
		}
		if (GrossAmt < 0) {
			alert("enter positive GrossAmt");
			document.NewSalaryForm.GrossAmt.value = "";
			document.NewSalaryForm.GrossAmt.focus();
			return false;
		}
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
		  } 
		
		
		else {  
	%>
	<FORM NAME="NewSalaryForm" onSubmit="return check()"
		action="NewSalaryEntry.jsp">
		<CENTER>
			<!--EMPNO Basic DA GrossAmt NetAmt PaySlipDate -->

			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">New Salary entry</TH>
				</TR>
				<TR class=row_odd>
					<TD>EMPNO *</TD>
					<TD><INPUT TYPE="TEXT" NAME="EMPNO" SIZE="15"
						value="<%=EMPNO%>" readonly></TD>
				</TR>
				<TR class=row_even>
					<TD>Basic *</TD>
					<TD><INPUT TYPE="TEXT" NAME="Basic" SIZE="10"></TD>
				</TR>

				<TR class=row_odd>
					<TD>DA *</TD>
					<TD><INPUT TYPE="TEXT" NAME="DA" SIZE="30"></TD>
				</TR>

				<TR class=row_even>
					<TD>GrossAmt *</TD>
					<TD><INPUT TYPE="TEXT" NAME="GrossAmt" SIZE="30"></TD>
				</TR>

				<TR class=row_odd>
					<TD>NetAmt *</TD>
					<TD><INPUT TYPE="TEXT" NAME="NetAmt" SIZE="30"></TD>
				</TR>



				<TR class=row_even>
					<TD>PaySlipDate *</TD>
					<TD><input size=20 readonly id="PaySlipDate"
						name="PaySlipDate"> <img 
						id="imgDate" style="CURSOR: hand" 
						height="16" src="Images/CalDis.gif" width="16" border="0"
						name="imgDate" onMouseOver="fnEnableCalLookup(this)"
						onMouseOut="fnDisableCalLookup(this)"></TD>
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
		cal.manageFields("imgDate", "PaySlipDate", "%d/%m/%Y");
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
