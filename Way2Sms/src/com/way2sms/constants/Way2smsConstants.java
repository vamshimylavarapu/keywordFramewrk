package com.way2sms.constants;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.server.browserlaunchers.Sleeper;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;


public class Way2smsConstants 
{

	public static WebDriver driver=new FirefoxDriver();
	
	public String url="http://site21.way2sms.com/content/index.html";
	
	@BeforeSuite
	public void launchApp()
	{
		driver.manage().deleteAllCookies();
		driver.get(url);
		Sleeper.sleepTightInSeconds(2);
		
	}
	
	
	 
	public void Closeapp()
	{
		driver.close();
	}
	
	
	
	
	
}
