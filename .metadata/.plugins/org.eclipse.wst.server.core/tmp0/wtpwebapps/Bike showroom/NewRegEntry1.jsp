 <%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String CustID = request.getParameter("CustID");


%>

 
  <HTML>
  <HEAD>
  <script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Register entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var CustID = document.NewRegisterForm.CustID.value;
        var ProdID = document.NewRegisterForm.ProdID.value;
	var HelmetBillNo= document.NewRegisterForm.HelmetBillNo.value;
	var DateOfReg = document.NewRegisterForm.DateOfReg.value;
	var TemporaryRegNo = document.NewRegisterForm.TemporaryRegNo.value;
	var PermenantRegNo = document.NewRegisterForm.PermenantRegNo.value;
	if(CustID==""||ProdID==""||HelmetBillNo==""||DateOfReg==""||TemporaryRegNo==""||PermenantRegNo=="")
	{
		alert("All the fields are mandatory");
		return false;
	}

	}
   
//-->
	</SCRIPT>
	
	<script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />
	
  </HEAD>
  <body Class=SC>
	<!-- To display Menu --Start -->
	<script language="JavaScript1.2" src="coolfunctions.js"></script>
	<script language="JavaScript1.2" src="coolmenus.js"></script>
	<!-- To display Menu --End --><br><br><br>

  <FORM NAME="NewRegisterForm" onSubmit="return check()" action="NewRegEntry.jsp">
   <CENTER>
<!--CustID ProdID HelmetBillNo DateOfReg TemporaryRegNo PermenantRegNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Register entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="10" value="<%=CustID%>" readonly></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>ProdID*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ProdID" SIZE="10" ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>HelmetBillNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="HelmetBillNo" SIZE="10"></TD>
	   </TR>
	   
	    <TR class=row_even >
	    <TD>DateOfReg *</TD><tD nowrap>
		<input size=20 readonly id="DateOfReg" name="DateOfReg">
		<img  id="imgDate" style="CURSOR: hand"  height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
        </tD>
	   

       <TR class=row_odd >
	   <TD>TemporaryRegNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="TemporaryRegNo" SIZE="10"></TD>
	   </TR>

       <TR class=row_even >
	   <TD>PermenantRegNo</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PermenantRegNo" SIZE="10"></TD>
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
		cal.manageFields("imgDate", "DateOfReg", "%d/%m/%Y");
		/*   cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d %I:%M %p"); */
		/*   cal.manageFields("f_btn2", "f_date2", "%b %e, %Y %I:%M %p");
		  cal.manageFields("f_btn3", "f_date3", "%e %B %Y %I:%M %p");
		  cal.manageFields("f_btn4", "f_date4", "%A, %e %B, %Y %I:%M %p");
		 */
		//]]>
	</script>
   </BODY> 
   </HTML>
