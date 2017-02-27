package com.xl.samples;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PrimusBankdbase {

	public static void main(String[] args) throws ClassNotFoundException, SQLException 
	{
		// TODO Auto-generated method stub
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection con=DriverManager.getConnection("jdbc:sqlserver://primusbank.qedgetech.com:1433;database=bankdb","sa","Admin@4321");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select max(branchid) from bankbranches");
		rs.next();
		System.out.println(rs.getInt(1));
		
	
	}

}
