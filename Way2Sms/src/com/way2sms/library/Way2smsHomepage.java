package com.way2sms.library;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.server.browserlaunchers.Sleeper;

import com.way2sms.constants.Way2smsConstants;

public class Way2smsHomepage extends  Way2smsConstants
{

	public String userid,password;
	public String number,msg;
	
	
	public boolean logIn(String username,String password)
	{
		driver.findElement(By.id("username")).sendKeys(username);
		driver.findElement(By.id("password")).sendKeys(password);
		driver.findElement(By.id("loginBTN")).click();
		if(driver.findElement(By.linkText("Logout")).isDisplayed())
		{
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public boolean sendsms(String number,String msg) throws InterruptedException
	
	{		
	
		driver.findElement(By.xpath("//div[1]/div[1]/div[2]/div[1]/input")).click();
		Sleeper.sleepTight(2);
		driver.findElement(By.xpath("html/body/div[7]/div[1]/ul/li[2]/a")).click();
		//driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		driver.switchTo().frame(driver.findElement(By.id("frame")));
		Sleeper.sleepTight(2);
		driver.findElement(By.id("mobile")).click();
		driver.findElement(By.id("mobile")).sendKeys(number);
		
		driver.findElement(By.id("message")).sendKeys(msg);
		driver.findElement(By.id("Send")).click();
		
		if(driver.findElement(By.xpath("html/body/div[3]")).isDisplayed()){
			return true;
		}
		else
		{
			return false;
		}
	
	}
		
	public boolean logout()
	{
		driver.findElement(By.linkText("Logout")).click();
		if (driver.findElement(By.id("loginBTN")).isDisplayed()) 
		{
		
			return true;
		}
		return false;
	}
	
	
	
	
}
