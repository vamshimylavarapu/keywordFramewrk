package com.project.tests;

import java.io.IOException;

import org.testng.annotations.Test;

import com.PrimusBank.Library.AdminHomepage;
import com.PrimusBank.Library.BankerHomepage;
import com.PrimusBank.Library.CustomerHomePage;
import com.PrimusBank.Library.PrimusBankHomepage;
import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;
import com.utils.XLutils;

public class KeywordTest extends PrimusBankConstants
{

	public String xlfile="D:\\LogIn.xlsx";
	public String sheet1="Sheet1";
	public String sheet2="Sheet2";
	PrimusBankHomepage phme=new PrimusBankHomepage();
	AdminHomepage ahme=new AdminHomepage();
	BankerHomepage bhme=new BankerHomepage();
	CustomerHomePage chme=new CustomerHomePage();
	
	@Test
	public void LogIntest() throws IOException, InterruptedException
	{
	String tsexc,tsid,tcid,keyword,tsres,tcres,tc;
	int tccount=XLutils.getRowcoun(xlfile,sheet1);
	int tscount=XLutils.getRowcoun(xlfile,sheet2);
	boolean res=false;
	
	for (int i = 1; i<=tccount; i++) 
	{
	tsexc=XLutils.getcelldata(xlfile,sheet1,i,2);
	
	if (tsexc.equalsIgnoreCase("y")) 
	{
		
		tcid=XLutils.getcelldata(xlfile, sheet1, i, 0);
		System.out.println("successfully enters if condition equals");
		for (int j = 1; j <=tscount; j++)
		{		
			tsid=XLutils.getcelldata(xlfile, sheet2, j, 0);
			if (tsid.equalsIgnoreCase(tcid)) 
			{
			
				keyword=XLutils.getcelldata(xlfile, sheet2, j, 4);
				
				
				System.out.println("starting switch case");
				switch (keyword.toLowerCase()) 
				{
				
				case "AdminLogIn":
					phme.adminuid="Admin";
					phme.adminpwd="Admin";
				res=phme.adminLogin(phme.adminuid,phme.adminpwd);
				System.out.println("admin login sucess");
					break;
				 case "adminlogout":
					 ahme.adminLogout1();
					 System.out.println("adminlogout sucess");
					 break;
				 case "bankerlogin":
					 phme.branchname="Ameerpet";
					 phme.bankeruid="john";
					 phme.bankerpwd="demo";
					 res=phme.bankerLogin(phme.branchname,phme.bankeruid,phme.bankerpwd);
					 break;
				 case "bankerlogout":
					 bhme.bankerLogout();
					 break;
				 case "customerlogin":
					 phme.custuid="sandeep";
					 phme.custpwd="sandeep";
					 res=phme.customerLogin(phme.custuid,phme.custpwd);
					 break;
				 case "customerlogout":
					 chme.customerLogout();
					 break;
				}

			
			if (res) 
			{
				tsres="pass";
				XLutils.setcelldata(xlfile, sheet2, j, 3,"pass");
				XLutils.fillgreencolor(xlfile, sheet2, j, 3);
			}
			else
			{	
				tsres="fail";
				XLutils.setcelldata(xlfile, sheet2, j, 3,"fail");
				XLutils.fillRedColor(xlfile, sheet2, j, 3);
			}
			tcres=XLutils.getcelldata(xlfile, sheet1, i, 3);
			if (!tcres.equalsIgnoreCase("fail")) 
			{
			
				 tc=XLutils.setcelldata(xlfile, sheet1, i, 3, tsres);
				if (tc.equalsIgnoreCase("pass")) 
				{
				XLutils.setcelldata(xlfile, sheet1, i, 3, "pass");
				XLutils.fillgreencolor(xlfile, sheet1, i, 3);
				}
			}
			}
		
		}
	}
			/*if (!tsid.equalsIgnoreCase(tcid)) 
			{
			
				XLutils.setcelldata(xlfile, sheet1, i, 3,"pass");
				XLutils.fillgreencolor(xlfile, sheet1, i, 3);
				
			}	
			else
				
			{
				XLutils.setcelldata(xlfile, sheet1, i, 3,"fail");
				XLutils.fillgreencolor(xlfile, sheet1, i, 3);
			}
			}*/
	
			else
			{
				XLutils.setcelldata(xlfile, sheet1,i,3,"Blocked");
				XLutils.fillRedColor(xlfile, sheet1, i, 3);
			}
			}
	}		
	}
		
	

