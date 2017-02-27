<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%	String AccessCodes = (String)session.getAttribute("AccessCodes"); %>
<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		String[] UserID = new String[200];
		int[] Auth = new int[200];
		int[] ActiveStatus = new int[200];

%>

<HTML>
<head>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	var multiple=true;
		function getValues(){
			//alert("getValues");
			var rButton = document.UsersProfiles.RB;
			if( rButton.length == undefined ){
				multiple = false;
			}
			else{
				mulitple = true;
			}
			var UserID = document.UsersProfiles.UserID;
			var Auth = document.UsersProfiles.Auth;
			var ActiveStatus = document.UsersProfiles.ActiveStatus;
			if(multiple==true)
			{
				for(var i=0;i<rButton.length;i++)
				{
					if(rButton[i].checked==true){
						var UserID = UserID[i].value;
						var Auth = Auth[i].value;
						var ActiveStatus=ActiveStatus[i].value;
						//alert(Usr+":"+MailID+":"+Role+":"+ActiveStatus);
						document.UsersProfiles.uid.value = UserID;
						document.UsersProfiles.uauth.value =Auth ;
						document.UsersProfiles.uactstatus.value = ActiveStatus;
						return true;
					}
				}
			}
			else
			{
					if(rButton.checked==true){
						var UserID = UserID.value;
						var Auth = Auth.value;
						var ActiveStatus=ActiveStatus.value;
						//alert(Usr+":"+MailID+":"+Role+":"+ActiveStatus);
						document.UsersProfiles.uid.value = UserID;
						document.UsersProfiles.uauth.value = Auth;
						document.UsersProfiles.uactstatus.value = ActiveStatus;
						return true;
					}
			}
			alert('Please check on the corresponding radio button to modify a record');
			return false;
		}
	//-->
	</SCRIPT>
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
//-->
</SCRIPT>

<jsp:include page="MultiLevelmenu.htm"/><BR><BR><BR>
<BODY  Class=SC>
<H2 align=center> Users Profiles </H2>
<FORM NAME="UsersProfiles" ACTION="ModifyUserProfiles.jsp" onsubmit = "return getValues()">
<input type=hidden name='uid' value=''>
<input type=hidden name='uauth' value=''>
<input type=hidden name='uactstatus' value=''>

<%if(AccessCodes.indexOf("LR")>-1||AccessCodes.indexOf("LU")>-1){%>
<%
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT UserID,Auth,ActiveStatus FROM Login order by UserID,Auth,ActiveStatus" ;
	rs = stmt.executeQuery(Query);
		int rCount=0;
				
		%>
			<table width="50%" align=center>
			<tr class=row_title>
				<th class=row_title rowspan="1" colspan="1">User ID</th>
				<th class=row_title rowspan="1" colspan="1">Auth</th>
				<th class=row_title rowspan="1" colspan="1">Active Status</th>
				<th class=row_title rowspan="1" colspan="1">Modify</th>
			</tr>
		<%
	while(rs.next()){
	%>
		
		<%UserID[rCount]=rs.getString(1);%>
		<%Auth[rCount]=rs.getInt(2);%>
		<%ActiveStatus[rCount]=rs.getInt(3);%>
		<tr class="<%= (rCount%2 == 0) ? "row_even" : "row_odd"%>">
			<td  align=center><B><%=UserID[rCount]%></B></td>
			<Input name='UserID' value='<%=UserID[rCount]%>' type=hidden></input>
			<td  align=center><B><%=Auth[rCount]%></B></td>
			<Input name='Auth' value='<%=Auth[rCount]%>' type=hidden></input>
			<td align=center><FONT COLOR="<%=(ActiveStatus[rCount]==1)?"Green":"Red"%>"><B><%=(ActiveStatus[rCount]==1)?"Active":"Inactive"%></B></FONT></td>
			<Input name='ActiveStatus' value='<%=ActiveStatus[rCount]%>' type=hidden></input>
			<td  align=center><B><INPUT TYPE="radio" NAME="RB"></B></td>
		</tr>	
	<%
		rCount++;
		}

	if( rCount == 0){
	
		%>
			<center>
			<h3>Sorry No records Found</h3>
			<A href="Report.jsp"> Home </A>
			<center>

		<%
	}

}
catch(Exception e)
{
	%><%=e%><%
}

%>
<Table align=center><tr><th><INPUT TYPE="submit" name='Modify' value='Modify'></th><th><INPUT TYPE="reset"></th></tr></table>

</BODY>
</HTML>
<%
}
else{
	%><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page.</H5><%
}
%>



