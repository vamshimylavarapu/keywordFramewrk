package com.PrimusBank.Library;

import org.openqa.selenium.By;
import org.openqa.selenium.server.browserlaunchers.Sleeper;

import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;

public class AdminHomepage extends PrimusBankConstants
{

	public boolean adminLogout1() throws InterruptedException
	{
		System.out.println("====Inside Admin Logout AdminHomePage===");
		
		Sleeper.sleepTight(5);
		driver.findElement(By.xpath(".//tbody/tr/td[3]/a/img")).click();
	//	.//*[@id='Table_02']/tbody/tr/td[3]/a/img
		
		System.out.println("===Clicked Logout====");
		Sleeper.sleepTightInSeconds(2);
		
		if(driver.findElement(By.id("login")).isDisplayed())
		{
		return true;	
		}
		else
		{
			return false;
		}
		
	}
	public boolean adminLogout2() throws InterruptedException
	{
		System.out.println("====Inside Admin Logout AdminHomePage===");
		
		Sleeper.sleepTight(5);
		driver.findElement(By.xpath(".//*[@id='Table_01']/tbody/tr/td[3]/a/img")).click();
	//	
		
		System.out.println("===Clicked Logout====");
		Sleeper.sleepTightInSeconds(2);
		
		if(driver.findElement(By.id("login")).isDisplayed())
		{
		return true;	
		}
		else
		{
			return false;
		}
		
	}
	/*public void branchCreation()
	{
		driver.findElement(By.xpath("//table/tbody/tr[2]/td/table/tbody/tr[2]/td/a/img")).click();
		driver.findElement(By.xpath("html/body/form/div[3]/input")).click();
	    
	
	
	}*/
	
	
	
}
