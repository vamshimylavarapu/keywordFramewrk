package com.PrimusBank.Library;

import org.openqa.selenium.By;

import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;

public class BankerHomepage extends PrimusBankConstants
{

	public  boolean bankerLogout()
	{
		System.out.println("Banker log out started in banker page");
		driver.findElement
			(By.xpath("//table/tbody/tr/td[4]/table/tbody/tr/td[3]/a/img")).click();
	
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
