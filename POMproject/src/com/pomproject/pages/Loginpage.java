package com.pomproject.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import com.pomproject.constants.Ohrmconstants;

public class Loginpage  extends Ohrmconstants
{

	@FindBy(id="txtUsername") WebElement uid;
	@FindBy(id="txtPassword") WebElement pwd;
	@FindBy(id="btnLogin") WebElement login;
	
	
	public void login(String userid,String pasword)
	{
		uid.sendKeys(userid);
		pwd.sendKeys(pasword);
		login.click();
		
	}
	
	
	
	
}
