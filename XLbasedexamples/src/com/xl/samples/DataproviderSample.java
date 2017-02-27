package com.xl.samples;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class DataproviderSample 
{

	@Test(dataProvider = "loginData")
	public void logIntest(String uid,String pwd)
	{
		System.out.println(uid+"===="+pwd);
	}
	
	@DataProvider
	public Object[][] loginData()
	{
		Object[][] data=new Object[3][2];
		data[0][0]="uid";
		data[0][1]="pwd";
		data[1][0]="uid1";
		data[1][1]="pwd1";
		data[2][0]="uid3";
		data[2][1]="pwd3";
		
		return data;
	}
	
	
	
	
}
