<HTML>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<script language="javascript" src="Images\validate.js"></script>
<jsp:include page="MultiLevelmenu.htm" /><BR>
<BR>
<BR>


<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%	String AccessCodes = (String)session.getAttribute("AccessCodes"); %>
<%if(AccessCodes.indexOf("LR")>-1||AccessCodes.indexOf("LU")>-1){%>
<%
		String UserID = request.getParameter("uid");
		String ActAuth = request.getParameter("uauth");
		int Auth = Integer.parseInt(ActAuth);
		String ActStatus = request.getParameter("uactstatus");
		int ActiveStatus = Integer.parseInt(ActStatus);
%>
<SCRIPT LANGUAGE="JavaScript">
	<!--
	var AuthFlag=false;
	var ActiveStatusFlag=false;
	  function setAuth()
		  {
		    var oldAuth = "<%=Auth%>";
			var obj = document.UsersProfiles;
			var i = obj.sAuth.options.selectedIndex;
			var Auth= obj.sAuth.options[i].text;
			obj.Auth.value = Auth;
			(Auth != oldAuth) ? AuthFlag=true : AuthFlag=false;

		  }
		  function setActiveStatus()
		  {
			var oldActiveStatus = ("<%=ActStatus%>
	" == 1) ? "Active" : "Inactive";
		var obj = document.UsersProfiles;
		var i = obj.sActiveStatus.options.selectedIndex;
		var ActiveStatus = obj.sActiveStatus.options[i].text;
		obj.ActiveStatus.value = ActiveStatus;
		(ActiveStatus != oldActiveStatus) ? ActiveStatusFlag = true
				: ActiveStatusFlag = false;
	}
	function getFlags() {
		if (AuthFlag == false && ActiveStatusFlag == false) {
			alert("Not modified any fields");
			return false;
		} else {
			return true;
		}

	}
//-->
</SCRIPT>
</head>

<H2 align=center>Modify User Profiles</H2>
<FORM NAME="UsersProfiles" ACTION="UpdateUserProfiles.jsp" Method=GET
	onsubmit="return getFlags()">

	<table width="50%" align=center>
		<tr class=row_title>
			<th class=row_title rowspan="1" colspan="1">User ID</th>
			<th class=row_title rowspan="1" colspan="1">Auth</th>
			<th class=row_title rowspan="1" colspan="1">Active Status</th>
		</tr>
		<tr class="row_odd">
			<td align=center><B><%=UserID%></B></td>
			<Input name='UserID' value='<%=UserID%>' type=hidden></input>

			<td align=center><Input name='Auth' value='<%=Auth%>' type=text
				readonly size=5><BR>
			</input> <SELECT NAME="sAuth" onChange="setAuth()">
					<OPTION value="NA">----</OPTION>
					<script>
						for (i = 0; i < AuthList.length; i++)
							document.write("<OPTION VALUE="+AuthList[i]+">"
									+ AuthList[i] + "</OPTION>");
					</script>
			</SELECT></td>

			<td align=center><Input name='ActiveStatus'
				value='<%=(ActiveStatus == 1) ? "Active" : "Inactive"%>' type=text
				readonly size=8><BR>
			</input> <SELECT NAME="sActiveStatus" onChange="setActiveStatus()">
					<OPTION value="NA">----</OPTION>
					<OPTION value="1">Active</OPTION>
					<OPTION value="0">Inactive</OPTION>
			</SELECT></td>

		</tr>

	</table>

	<Table align=center>
		<tr>
			<th><INPUT TYPE="submit" name='Update' value='Update'></th>
			<th><INPUT TYPE="reset"></th>
		</tr>
	</table>
</FORM>
</HTML>
<%
	} else {
%><H5 align=center>
	<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You
	are not authorized to access this page.
</H5>
<%
	}
%>



