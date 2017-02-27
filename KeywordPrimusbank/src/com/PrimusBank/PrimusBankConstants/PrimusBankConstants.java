package com.PrimusBank.PrimusBankConstants;


import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;

import com.PrimusBank.Library.AdminHomepage;
import com.PrimusBank.Library.PrimusBankHomepage;

public class PrimusBankConstants 
{

	
	public static WebDriver driver=new FirefoxDriver();
	
	public static String url="http://primusbank.qedgetech.com";
	
	
	@BeforeSuite
	public static void launchApp()
	{
		
		
		driver.get(url);
		driver.manage().deleteAllCookies();
		driver.manage().timeouts().implicitlyWait(20,TimeUnit.SECONDS);
		
	}
	
	
	@AfterSuite
	public static void closeApp()
	{
		
		driver.close();
		
	}
	
	
	
}
