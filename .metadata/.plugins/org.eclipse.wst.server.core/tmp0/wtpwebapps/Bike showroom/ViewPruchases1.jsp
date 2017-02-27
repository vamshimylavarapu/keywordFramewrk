<!--
	File : EmpDetails.jsp
	Purpose : This jsp is used to display the details of all the employees and also 
			  provide link to view or edit the details.

-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
<TITLE>Purchases Details</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<LINK href="styles.css" type="text/css" rel="stylesheet">



</HEAD>


<BODY class=SC>



	<%
		/*Declaration of variables*/

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		String filedata = "";
		String filestr = "";
		File file = null;
		FileWriter fr = null;
		Random rand = new Random(100000l);

		String ProdID="", BillNo, SundryCreditor, VATONPurchase, TIN;
		String strStock = request.getParameter("txtStock");
		int Stock = Integer.parseInt(strStock);
		String BillAmount = request.getParameter("txtBillAmount");
		int Stock1 = Integer.parseInt(BillAmount);

		String DOPurchase;
		/* System.out.println("---1---"+strEmpNo); */
		try {

			/*Getting the connection variable from session*/

			con = (Connection) session.getAttribute("connection");
			stmt = con.createStatement();

			String Query = "SELECT * from ProductMaster where ProdID="
					+ ProdID;
			System.out.println(Query + "----2----");
			rs = stmt.executeQuery(Query);
			System.out.println("---3----");

		} catch (Exception e) {
			System.out.println("Exception" + e);
		}

		if (rs != null) {
			/*Getting the values from the database*/

			if (rs.next()) {
				System.out.println("-----4-----");
				ProdID = rs.getString(1);
				Stock = rs.getInt(2);
				BillNo = rs.getString(3);
				SundryCreditor = rs.getString(4);
				VATONPurchase = rs.getString(5);
				DOPurchase = rs.getString(6);
				TIN = rs.getString(7);
	%>
	<!--Displaying the values from database-->
	<H3 CLASS=Top>
		<%=ProdID%></H3>
	<TABLE>
		<th class=row_odd>
		<TD>ProdID</TD>
		<TD><%=ProdID%></TD>
		<th class=row_even>
		<TD>Stock</TD>
		<TD><%=Stock%></TD>
		<th class=row_odd>
		<TD>BillNo</TD>
		<TD><%=BillNo%></TD>
		<th class=row_even>
		<TD>BillAmount</TD>
		<TD><%=BillAmount%></TD>
		<th class=row_odd>
		<TD>SundryCreditor</TD>
		<TD><%=SundryCreditor%></TD>
		<th class=row_even>
		<TD>VATOnPurchase</TD>
		<TD><%=VATONPurchase%></TD>
		<th class=row_odd>
		<TD>DOPurchase</TD>
		<TD><%=DOPurchase%></TD>
		<th class=row_even>
		<TD>TIN</TD>
		<TD><%=TIN%></TD>
	</TABLE>
	<%
		}
			rs.close();
		} else {
			/*To write to the server if the resultset is null*/
			//System.out.println("Result set is null\n");
		}
		/* Verifying wether the user is authorised to edit emp details
		 if user is authorised he can edit the details if not he can
		 only view the details */
	%>
</BODY>
</HTML>

