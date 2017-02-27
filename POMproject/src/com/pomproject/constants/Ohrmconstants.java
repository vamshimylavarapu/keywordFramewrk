package com.pomproject.constants;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;

public class Ohrmconstants 
{

	public static WebDriver driver=new FirefoxDriver();
	public String url="http://orangehrm.qedgetech.com";
	
	@BeforeSuite
	public void LaunchApp()
	{
		driver.manage().deleteAllCookies();
		driver.get(url);
	}
	
	@AfterSuite
	public void Closeapp()
	{
		driver.close();
	}
	
	
	
	
	
	
}
