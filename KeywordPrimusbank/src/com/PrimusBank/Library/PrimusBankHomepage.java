package com.PrimusBank.Library;


import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import com.PrimusBank.PrimusBankConstants.PrimusBankConstants;

public class PrimusBankHomepage extends PrimusBankConstants
{

	public String adminuid;
	public String adminpwd;
	public String branchname;
	public String bankeruid;
	public String bankerpwd;
	public String custuid;
	public String custpwd;
	
	public  void logIn(String uid,String pwd)
	{
	
		driver.findElement(By.id("txtuId")).sendKeys(uid);
		driver.findElement(By.id("txtPword")).sendKeys(pwd);
		driver.findElement(By.id("login")).click();
		
		
	}
	public boolean adminLogin(String uid,String pwd) throws InterruptedException
	{
		
		System.out.println("admin Login Started");
		Thread.sleep(5000);
		String expect,actual;
		expect="Adminflow";
		logIn(uid,pwd);
		actual=driver.getCurrentUrl();
		if(actual.toLowerCase().contains(expect.toLowerCase()))
		{
			return true;
		}
		else
		{
		return false;
		}
	}
	
	public boolean bankerLogin(String branchname,String uid,String pwd) throws InterruptedException
	{
		System.out.println("create Banker Login Created");
		Thread.sleep(5000);
		String expect,actual;
		WebElement branchselection=driver.findElement(By.id("drlist"));
	    Select branch= new Select(branchselection);
	    branch.selectByVisibleText(branchname);
	    logIn(uid, pwd);
	    expect="Bankers_flow";
	    actual=driver.getCurrentUrl();
	    if(actual.toLowerCase().contains(expect.toLowerCase()))
	    		{
	    	return true;
	    		}
	    else {
			return false;
		}
	    
	    
		
		
	}
	public boolean customerLogin(String uid,String pwd) throws InterruptedException
	{
		System.out.println("customer login started");
		Thread.sleep(5000);
		driver.findElement(By.id("personal")).click();
		driver.findElement(By.id("idtxt")).sendKeys(uid);
		driver.findElement(By.id("pswdtxt")).sendKeys(pwd);
		driver.findElement(By.id("btnGO")).click();
		/*kohli
		dass*/
		if(driver.findElement(By.xpath("//table/tbody/tr[2]/td/table/tbody/tr[2]/td/a/img")).isDisplayed())
		
		{
			return true;
		}
		else {
			return false;
		}
		
		
		
		
		
	}
	
	
	
	
	
	
}
