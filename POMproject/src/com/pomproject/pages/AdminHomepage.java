package com.pomproject.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import com.pomproject.constants.Ohrmconstants;

public class AdminHomepage extends Ohrmconstants 
{

	@FindBy(linkText="Welcome Admin") WebElement welcomeid;
	@FindBy(linkText="Logout") WebElement logoutid;
	
	
	public boolean iswelcomeadmin()
	{
		if (welcomeid.isDisplayed()) 
		{
		return true;	
		}else
		{
			return false;
		}
		
	}
	
	public void logOut()
	{
		welcomeid.click();
		logoutid.click();
	}
	
	
}
