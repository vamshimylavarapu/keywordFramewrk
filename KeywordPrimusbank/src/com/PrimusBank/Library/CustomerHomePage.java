package com.PrimusBank.Library;

import org.openqa.selenium.By;

import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;

public class CustomerHomePage extends PrimusBankConstants
{

	public boolean customerLogout()
	{
		driver.findElement
		(By.xpath("//tbody/tr/td[4]/table/tbody/tr/td[3]/a/img")).click();
		if(driver.findElement(By.id("login")).isDisplayed())
		{
		return true;	
		}
		else
		{
			return false;
		}
	}
	
	
	
	
}
