package com.way2sms.tests;

import org.openqa.selenium.server.browserlaunchers.Sleeper;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.way2sms.constants.Way2smsConstants;
import com.way2sms.library.Way2smsHomepage;

public class Logintest extends Way2smsConstants
{

	Way2smsHomepage userhome=new Way2smsHomepage();
	@Test
	public void Login()
	
	{
		boolean res;
	
		//Way2smsHomepage userhome=new Way2smsHomepage();
		userhome.userid="8125143171";
		userhome.password="09561";
		res=userhome.logIn(userhome.userid, userhome.password);
		Assert.assertTrue(res);
		/*reslogout=userhome.logout();
		Assert.assertTrue(reslogout);
		System.out.println("logout successfully");*/
		
		
	}
	@Test
	public void Sendsms() throws InterruptedException
	{
	
		
		boolean result;
		Sleeper.sleepTightInSeconds(5);
		//Way2smsHomepage whme=new Way2smsHomepage();
		
		userhome.number="9912649993";
		userhome.msg="hi sunil mama em dng how r u";
		
		result=userhome.sendsms(userhome.number, userhome.msg);
		Assert.assertTrue(result);
		
		
		
	}
	
	
	
	
	
}
