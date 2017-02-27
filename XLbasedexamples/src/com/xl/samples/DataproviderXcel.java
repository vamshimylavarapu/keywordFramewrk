package com.xl.samples;

import java.io.IOException;



import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class DataproviderXcel
{

	
	@Test(dataProvider="logInSample")
	public void logIntest(String branchname,String uid,String pwd) throws IOException
	{
		System.out.println(branchname+uid+pwd);
	}
	
	@DataProvider
	public Object[][] logInSample() throws IOException
	{
		
		// getting data from xlsheet using generics class
		int rowcount=XLutils.getRowcoun("D:\\vamshi1.xlsx","Sheet1");
		int cellcount=XLutils.getcellcount("D:\\vamshi1.xlsx","Sheet1",1);
		System.out.println(rowcount);
		System.out.println(cellcount);
		Object[][] data=new Object[rowcount][cellcount];
		
		for (int i = 1; i<=rowcount; i++) 
		{
		
			data[i-1][0]=XLutils.getcelldata("D:\\vamshi1.xlsx","Sheet1",i,0);
			//System.out.println(data[i-1][0]);
			data[i-1][1]=XLutils.getcelldata("D:\\vamshi1.xlsx","Sheet1",i,1);
			data[i-1][2]=XLutils.getcelldata("D:\\vamshi1.xlsx","Sheet1",i,2);
			
		}
		System.out.println(data);
		return data;
		
	
		
		
	}
	
	
}
