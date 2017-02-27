<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Register entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check()
	{
		var CustID = document.NewRegisterForm.CustID.value;
                
		if(CustID=="")
		{
			alert("Customer ID is mandatory");
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

  <FORM NAME="NewRegisterForm" onSubmit="return check()" action="NewRegEntry1.jsp">
   <CENTER>
<!--CustID	ProdID RegNo CostPrice SellingPrice DOSale CreditID SaleMode ChequeNo VATOnSales BillNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Register entry </TH>
	   </TR>
	   <TR class=row_even >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="15" ></TD><td><input type="button" value="Show Customers" onclick="fnEmpPopUp('ListCustomers.jsp',300,300)"></td>
	   </TR>
	   <TR class=row_odd ALIGN="CENTER">
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
		cal.manageFields("imgDate", "JoiningDate", "%d/%m/%Y");
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