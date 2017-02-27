 <%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">
  	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<SCRIPT LANGUAGE="JavaScript"></SCRIPT>
<script src="jscal2.js"></script>
<script src="en.js"></script>
<link rel="stylesheet" type="text/css" href="jscal2.css" />

    <TITLE> Add Employee </TITLE>
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>

  </HEAD>
   <jsp:include page="MultiLevelmenu.htm"/><br><br><br>

  <body Class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
  <FORM NAME="AddEmpForm" onSubmit="return check()" action="AddEmployee.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Add new Employee </TH>
	   </TR>
	   
	   <TR class=row_even >
	   <TD>EMPNO *</TD>
	   <%
	  Connection con=(Connection)session.getAttribute("connection");
		Statement stmt =  con.createStatement();
		String SelQ = "Select max(EMPNO) from EmpMaster order by EMPNO";
		//System.out.println(SelQ);
		ResultSet rs=stmt.executeQuery(SelQ);
		
		rs.next();
	   %>
	   <TD><INPUT TYPE="TEXT" NAME="EMPNO" value="<%=(rs.getInt(1)+1) %>" 
	   SIZE="30"    readonly="readonly"></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>EMPName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EMPName" SIZE="30" ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>MailID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="MailID" SIZE="30"></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>EMP_ADDRESS *</TD>
	   <TD><TEXTAREA NAME="EMP_ADDRESS" rows="5" cols="20" >
	   </TEXTAREA></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>PHONENO *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PHONENO" SIZE="10"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>CurrentLocation*</TD>
	   <TD><select name="CurrentLocation">
				<option value="Bangalore">-----</option>
				<option value="Bangalore">Bangalore</option>	   
				<option value="Hyderabad">Hyderabad</option>
				<option value="Pune">Pune</option>
			</select></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>JoiningDate </TD>
	    <TD><input size=20 readonly id="JoiningDate" name="JoiningDate">
			<img id="imgDate" style="CURSOR: hand"  height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >

		<TR class=row_even >
			<TD>Role</TD>
			<TD>
				<select name="Role">
					<option value="NA">-----</option>
					<option>General Manager</option>	   
					<option>Accounts Manager</option>
					<option>Sales Manager</option>	   
					<option>Sales Representative</option>
					<option>Accountant</option>	   
					<option>Accounts Assistant</option>
					<option>Clerk</option>	   
					<option>Receptionist</option>	   
					<option>Security</option>	   
				</select>
			</TD>

		</TR>
		<TR class=row_odd >
			<TD>Qualification</TD>
			<TD><INPUT TYPE="TEXT" NAME="Qualification"  SIZE="30"></TD>
		</TR>
		<TR class=row_even >
			<TD>Remarks</TD>
			<TD><INPUT TYPE="TEXT" NAME="Remarks"   SIZE="30"></TD>
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