  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Model entry</TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var ModelID = document.NewModelForm.ModelID.value;
	var Model = document.NewModelForm.Model.value;
	var Path= document.NewModelForm.Path.value;
	var ListPrice = document.NewModelForm.ListPrice.value;
	var Description = document.NewModelForm.Description.value;
	if(ModelID==""||Model==""||Path==""||ListPrice==""||Description==""){
		alert("All the fields are mandatory");
		return false;
	}
   }

	//-->
	</SCRIPT>
  </HEAD>
  <body Class=SC>
	<!-- To display Menu --Start -->
	<script language="JavaScript1.2" src="coolfunctions.js"></script>
	<script language="JavaScript1.2" src="coolmenus.js"></script>
	<!-- To display Menu --End --><br><br><br>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>

  <FORM NAME="NewModelForm" onSubmit="return check()" action="NewModelEntry.jsp">
   <CENTER>
<!--ModelID	 Model	Path ListPrice Description -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Model entry </TH>
	   </TR>
	   <TR class=row_odd >
	   <TD>ModelID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ModelID" SIZE="10"  ></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>Model *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Model" SIZE="10"></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Path *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Path" SIZE="10"></TD>
	   </TR>
	   
	    <TR class=row_even >
	   <TD>ListPrice *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ListPrice" SIZE="10"></TD>
	   </TR>

       <TR class=row_odd >
	   <TD>Description *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Description" SIZE="10"></TD>
	   </TR>

	   <TR class=row_even  ALIGN="CENTER">
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