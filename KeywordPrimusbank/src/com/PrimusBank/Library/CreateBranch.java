package com.PrimusBank.Library;

import org.openqa.selenium.By;
import org.openqa.selenium.server.browserlaunchers.Sleeper;
import org.openqa.selenium.support.ui.Select;

import com.PrimusBank.PrimusBankConstants.AdminHomepageConstants;
import com.utils.Generics;


public class CreateBranch extends AdminHomepageConstants
{
	
	public String branchname;
	public String Add1;
	public String zip;
	public String country;
	public String state;
	public String city;
	
	public boolean branchcreation(String branchname,String add1,String zip,String country,String state,String city)
	{
	
		System.out.println("creating branch creation");
		Sleeper.sleepTightInSeconds(2);
		driver.findElement(By.xpath("//td/table/tbody/tr[2]/td/a/img")).click();
		driver.findElement(By.xpath("html/body/form/div[3]/input")).click();
		
		Generics ge=new Generics();
		ge.inputdata("txtbName", branchname);
		Sleeper.sleepTight(5);
		ge.inputdata("txtAdd1",add1 );
		Sleeper.sleepTight(2);
		ge.inputdata("txtZip", zip);
		
		/*driver.findElement(By.id("txtAdd1")).sendKeys(add1);
		driver.findElement(By.id("txtZip")).sendKeys(zip);*/
		
		ge.selectdata("lst_counrtyU", country);
		Sleeper.sleepTight(3);
		ge.selectdata("lst_stateI", state);
		ge.selectdata("lst_cityI", city);
		driver.findElement(By.id("btn_insert")).click();
		
		String actual=driver.switchTo().alert().getText();
		String expected="New Branch with id";
		
		if(actual.toLowerCase().contains(expected.toLowerCase())){
			
			driver.switchTo().alert().accept();
			return true;
			
		}
		
		else{
			
			return false;
		}
	}
	
	
	
	
	
}
