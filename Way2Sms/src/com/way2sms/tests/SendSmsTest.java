package com.way2sms.tests;

import org.openqa.selenium.server.browserlaunchers.Sleeper;
import org.testng.Assert;
import org.testng.annotations.Test;

import com.way2sms.constants.Way2smsConstants;
import com.way2sms.library.Way2smsHomepage;

public class SendSmsTest extends Way2smsConstants
{
	
	
	public void Sendsms() throws InterruptedException
	{
	
		
		boolean result;
		Sleeper.sleepTightInSeconds(5);
		Way2smsHomepage whme=new Way2smsHomepage();
		whme.number="8885673508";
		whme.msg="hi avinash,how are you";
		result=whme.sendsms(whme.number, whme.msg);
		Assert.assertTrue(result);
		
		
		
	}
	
	
	
	
	
}
