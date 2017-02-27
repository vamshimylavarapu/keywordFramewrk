package com.pomproject.tests;

import org.openqa.selenium.support.PageFactory;
import org.testng.annotations.Test;

import com.pomproject.constants.Ohrmconstants;
import com.pomproject.pages.AdminHomepage;
import com.pomproject.pages.Loginpage;

public class AdminLoginTest extends Ohrmconstants 
{

	@Test
	public void logInapp()
	{
		
		Loginpage lp=PageFactory.initElements(driver, Loginpage.class);
		lp.login("Admin","admin");
		AdminHomepage ahme=PageFactory.initElements(driver,AdminHomepage.class);
		ahme.iswelcomeadmin();
		ahme.logOut();
		
		
	}

	
	
	
	
	
}
