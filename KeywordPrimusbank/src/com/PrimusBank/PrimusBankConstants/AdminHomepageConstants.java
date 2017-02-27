package com.PrimusBank.PrimusBankConstants;

import org.openqa.selenium.server.browserlaunchers.Sleeper;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;

import com.PrimusBank.Library.AdminHomepage;
import com.PrimusBank.Library.PrimusBankHomepage;

public class AdminHomepageConstants extends PrimusBankConstants
{

	@BeforeClass
	public void adminlogIn() throws InterruptedException
	{


		Sleeper.sleepTight(5);
		PrimusBankHomepage ahome=new PrimusBankHomepage();
		
		ahome.adminuid="Admin";
		ahome.adminpwd="Admin";
		ahome.adminLogin(ahome.adminuid,ahome.adminpwd);
		
	}
	
	@AfterClass
	public void adminLogout() throws InterruptedException
	
	{
	
		Thread.sleep(5000);
		System.out.println("====Inside adminLogout of AdminHomePageConstants===");
		AdminHomepage ahme=new AdminHomepage();
		ahme.adminLogout1();
		
	}

	
	
}
