package com.utils;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;

import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;

public class Generics extends PrimusBankConstants
{

	public void inputdata(String locater,String data)
	{
		driver.findElement(By.id(locater)).sendKeys(data);
		
	}
	public void selectdata(String locater,String selectdata)
	{
		Select s1=new Select(driver.findElement(By.id(locater)));
		s1.selectByVisibleText(selectdata);
	}
	
	
}
