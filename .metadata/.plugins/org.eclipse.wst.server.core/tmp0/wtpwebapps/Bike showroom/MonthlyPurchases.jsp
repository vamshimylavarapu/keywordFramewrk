<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>


<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	MonthlyPurchases........
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);
function disButtons(){
	document.SForm.GenEx0.disabled=true;
	document.SForm.GenEx.disabled=true;
}
//-->
</SCRIPT>

</head>
<body Class=SC>
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String ProdID;
int Stock;
float BillAmmount;
String DOPurchase;
String orderby;
orderby=((String)request.getParameter("orderby")==null) ? "ProdID":(String)request.getParameter("orderby");

String strStartDate = request.getParameter("Start");
String strEndDate =  request.getParameter("End");

System.out.println(strStartDate);
System.out.println(strEndDate);

try
{

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "Select ProdID,Stock,BillAmmount from ProductMaster  where DOPurchase between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')"; 
	//System.out.println(Query);
	rs = stmt.executeQuery(Query);

	////System.out.println(rs.getString(2));
	if(rs.first())
	{
		rs.beforeFirst();
	//System.out.println("Result set not null"); %>
	<table class=notebook>
	<tr class=row_title>
	
	 <th class=row_title><a class=title href="MonthlyPurchases.jsp?orderby=ProdID">ProdID</a></th>
	<th class=row_title><a class=title href="MonthlyPurchases.jsp?orderby=Stock">Stock</a></th>
	<th class=row_title><a class=title href="MonthlyPurchases.jsp?orderby=BillAmmount">BillAmmount</a></th>
	
	</tr>

<%
int iCnt=0;
		while(rs.next()){
		iCnt++;				
			ProdID=rs.getString(1);
			Stock=rs.getInt(2);
			BillAmmount=rs.getFloat(3);
			
	 	
if(iCnt%2==0){	
%><tr class=row_even ><%
}else{
%><tr class=row_odd > <%
}
%>
	<td><%=ProdID%></td>
  	<td><%=Stock%></td>
  	<td><%=BillAmmount%></td>
  	</tr>	
<input type="hidden" name="strStartDate" value=<%=strStartDate%>>
<input type="hidden" name="strEndDate" value=<%=strEndDate%>>

<%
	
}

	}
	else{
		//System.out.println("No Records");

		%>
		
			<center>
			<h3>Sorry No records Found</h3>
			<A href="Report.jsp"> Back </A>
			<center>

		<%
	}
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>
</center>
</center>

</table>


</body>
</html>