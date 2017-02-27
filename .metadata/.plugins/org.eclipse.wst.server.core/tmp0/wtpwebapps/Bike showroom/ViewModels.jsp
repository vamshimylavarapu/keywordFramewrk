<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HEAD><LINK href="styles.css" type="text/css" rel="stylesheet"></HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body class=sc>
<h2 align=center>Available Models</h2>
<a href="Models.jsp">Back</a>
<%

String modelname=request.getParameter("modelname");

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = (Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from Model  where model='"+modelname+"'";
			rs = stmt.executeQuery(Query);
	
	

			%>
			<table class="notebook">
				<tr class=row_title>
				<th>ModelID</th><th>Model</th><th>Image</th><th>List Price</th><th>Description</th>
				</tr>
			<%
			int rCount=0;
			while(rs.next())

			{				
					String p=rs.getString(3);
				
					p="Images/Models/"+p;
					
					File fl=new File(rs.getString(3));
					System.out.println(fl+"   "+p);
					%>
					<tr class=<%= (rCount%2==0)? "row_odd":"row_even"%> >
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><img src="<%=p %>" width="90" height="90" border=0 alt="click here"></td>
						<td align=center><%=rs.getString(4)%></td>
						<td align=center><%=rs.getString(5)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>

