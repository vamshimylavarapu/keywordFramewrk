package com.project.tests;

import java.io.IOException;

import org.testng.annotations.Test;

import com.PrimusBank.Library.AdminHomepage;
import com.PrimusBank.Library.BankerHomepage;
import com.PrimusBank.Library.CreateBranch;
import com.PrimusBank.Library.CustomerHomePage;
import com.PrimusBank.Library.PrimusBankHomepage;
import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;
import com.utils.XLutils;

public class Keywordtest2 extends PrimusBankConstants
{

	
	public String xlfile="D:\\LogIn.xlsx";
	public String sheet1="Sheet1";
	public String sheet2="Sheet2";
	PrimusBankHomepage phme=new PrimusBankHomepage();
	AdminHomepage ahme=new AdminHomepage();
	BankerHomepage bhme=new BankerHomepage();
	CustomerHomePage chme=new CustomerHomePage();
	CreateBranch branch=new CreateBranch();
	
	@Test
	public void keywordLogintest() throws IOException, InterruptedException
	{
		String tsexc,tsid,tcid,keyword,tsres,tcres,tc;
		int tccount=XLutils.getRowcoun(xlfile,sheet1);
		int tscount=XLutils.getRowcoun(xlfile,sheet2);
		boolean res=false;
		
	
		for (int i = 1; i <=tccount; i++) 
		{
			tsexc=XLutils.getcelldata(xlfile,sheet1,i,2);
			if (tsexc.equalsIgnoreCase("y")) 
			{
				tcid=XLutils.getcelldata(xlfile, sheet1, i, 0);
				for (int j = 1; j <=tscount; j++) 
				{
				
					tsid=XLutils.getcelldata(xlfile,sheet2,j,0);
					if (tsid.equalsIgnoreCase(tcid)) 
					{
					
						
						keyword=XLutils.getcelldata(xlfile, sheet2,j,4);
						switch (keyword.toLowerCase()) 
						{
						case "adminlogin":
							phme.adminuid="Admin";
							phme.adminpwd="Admin";
							res=phme.adminLogin(phme.adminuid,phme.adminpwd);
							
							break;
						case "adminlogout":
							res=ahme.adminLogout1();
							
							break;
						case "bankerlogin":
							phme.branchname="Ameerpet";
							phme.bankeruid="jagan";
							phme.bankerpwd="jagan1234";
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
						case "createbranch":
							branch.branchname="suryapet561";
							branch.Add1="vijayacolony";
							branch.zip="50834";
							branch.country="INDIA";
							branch.state="Andhra Pradesh";
							branch.city="Hyderabad";
							res=branch.branchcreation(branch.branchname, branch.Add1,branch.zip, branch.country, branch.state, branch.city);
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
							XLutils.fillgreencolor(xlfile, sheet2, j, 3);	
						}
						tcres=XLutils.getcelldata(xlfile, sheet1, i, 3);
						if(!tcres.equalsIgnoreCase("fail"))
						{
							tc=XLutils.setcelldata(xlfile, sheet1, i, 3,tsres);
							if(tc.equalsIgnoreCase("pass"))
							{
								XLutils.setcelldata(xlfile,sheet1,i,3,"pass");
								XLutils.fillgreencolor(xlfile,sheet1,i,3);
							}
							
						}	
					}	
				}
			}
			else
			{
				XLutils.setcelldata(xlfile, sheet1,i,3,"Blocked");
				XLutils.fillRedColor(xlfile, sheet1, i, 3);
			}
		}
		
		
		
		
		
	}
	
	
	
	
	
}
