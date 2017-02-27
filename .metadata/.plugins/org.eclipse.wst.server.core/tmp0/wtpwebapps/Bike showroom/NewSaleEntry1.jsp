<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String CustID = request.getParameter("CustID");%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Sale entry</TITLE>
    <script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check()
	{
		var CustID = document.NewSaleForm.CustID.value;
		var ProdID = document.NewSaleForm.ProdID.value;
		var RegNo = document.NewSaleForm.RegNo.value;
		var CostPrice = document.NewSaleForm.CostPrice.value;
		var SellingPrice = document.NewSaleForm.SellingPrice.value;
		var DOSale = document.NewSaleForm.DOSale.value;
		var CreditID = document.NewSaleForm.CreditID.value; 
		//var SaleModeAsList = new Array("paid","credit");
		var SaleMode = document.NewSaleForm.SaleMode.value; 
		var ChequeNo = document.NewSaleForm.ChequeNo.value; 
		var VATOnSales = document.NewSaleForm.VATOnSales.value; 
		var BillNo = document.NewSaleForm.BillNo.value;

		if(CustID==""||ProdID==""||RegNo==""||CostPrice==""||SellingPrice==""||DOSale==""||CreditID==""|| SaleMode==""||ChequeNo ==""||VATOnSales==""||BillNo=="")
		{
			alert("All the fields are mandatory");
			return false;
		}
    }
	function fnCheckMode(S)
	{
		var CustID = document.NewSaleForm.CustID.value;
		var i = S.options.selectedIndex;
		var Value  = S.options[i].value;
		if(Value=="Credit" && CustID!=null)
		{
			var URL = "NewCreditEntry1.jsp?CustID="+CustID;
			fnEmpPopUp(URL,350,250);
		}
		if(Value="Cash"){
			document.NewSaleForm.CreditID.value='NA';
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

  <FORM NAME="NewSaleForm" onSubmit="return check()" action="NewSaleEntry.jsp">
   <CENTER>
<!--CustID	ProdID RegNo CostPrice SellingPrice DOSale CreditID SaleMode ChequeNo VATOnSales BillNo -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Sale entry </TH>
	   </TR>
	   <TR class=row_even >
	   <TD>CustID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CustID" SIZE="15" value="<%=CustID%>" readonly></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>ProdID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ProdID" SIZE="15"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>RegNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RegNo" SIZE="15"></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>CostPrice *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CostPrice" SIZE="15"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>SellingPrice *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="SellingPrice" SIZE="15"></TD>
	   </TR>

       <TR class=row_odd >

	   <TD>DOSale *</TD><tD nowrap>
<input size=20 readonly id="DOSale" name="DOSale">
<img  id="imgDate" style="CURSOR: hand"  height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
</tD>

	 
	  
 
	   <TR class=row_even >
	   <TD> SaleMode*</TD>
	   <TD><select name="SaleMode" onchange="fnCheckMode(this)">
				<option value="---">---</option>	
				<option value="Cash">Cash</option>	   
				<option value="Credit">Credit</option>
			</select></TD>
	 
	   </TR>
 
       
	   <TR class=row_odd >
	   <TD> CreditID*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="CreditID" SIZE="15"></TD>
	   </TR>

 
	   <TR class=row_even >
	   <TD> ChequeNo*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ChequeNo" SIZE="15"></TD>
	   </TR>

 
	   <TR class=row_odd >
	   <TD> VATOnSales*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="VATOnSales" SIZE="15"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>BillNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="BillNo" SIZE="15"></TD>
	   </TR>


       <TR class=row_odd ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
		</TR>   
   </TABLE>
   </CENTER>
   
   <script type="text/javascript">
		//<![CDATA[

		var cal = Calendar.setup({
			onSelect : function(cal) {
				cal.hide()
			},
			showTime : true
		});
		cal.manageFields("imgDate", "DOSale", "%d/%m/%Y");
		/*   cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d %I:%M %p"); */
		/*   cal.manageFields("f_btn2", "f_date2", "%b %e, %Y %I:%M %p");
		  cal.manageFields("f_btn3", "f_date3", "%e %B %Y %I:%M %p");
		  cal.manageFields("f_btn4", "f_date4", "%A, %e %B, %Y %I:%M %p");
		 */
		//]]>
	</script>
   </FORM>
   </BODY> 
   </HTML>
