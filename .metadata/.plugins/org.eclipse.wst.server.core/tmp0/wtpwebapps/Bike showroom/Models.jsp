<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HEAD>
<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<jsp:include page="MultiLevelmenu.htm" /><br>
<br>
<br>
<body class=sc>
	<h2 align=center>Available Models</h2>
	<form action="ViewModels.jsp">
		<%
			Connection con;
			ResultSet rs = null;
			Statement stmt = null;
			try {

				//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con = (Connection) session.getAttribute("connection");
				stmt = con.createStatement();
				String Query = "Select * from Model order by ModelID";
				rs = stmt.executeQuery(Query);
		%><center>
			<table>
				<tr>
					<td>Please Select Model</td>
					<td><select name="modelname">

							<%
								int rCount = 0;
									while (rs.next())

									{
										String p = rs.getString(3);
							%>


							<option><%=rs.getString(2)%></option>
							<%
								rCount++;
									}

								} catch (Exception e) {
							%><%=e%>
							<%
								}
							%>
					</select>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
		</center>
	</form>