package com.xl.samples;

import java.util.List;






import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.Test;

public class Googlesample 

{
	

	@Test
	public void test()
	{
	WebDriver driver=new FirefoxDriver();
	driver.get("https://www.facebook.com"); 
	/*Sleeper.sleepTightInSeconds(5);
	WebElement element = driver.findElement(By.name("q"));
    element.sendKeys("Cheese!");
    element.submit();*/
	List<WebElement> sample=driver.findElements(By.xpath(".//*[@id]"));
	//System.out.println(sample.size());
	for (int i = 0; i <=sample.size(); i++) 
	{
	System.out.println(sample.get(i).getText().toString());	
	}
	driver.quit();
	
	/*	System.setProperty("webdriver.chrome.driver", "D:\\chromedriver.exe");

        WebDriver driver = new ChromeDriver(); 
        driver.get("http://www.google.com"); 
        WebElement element = driver.findElement(By.name("q"));
        element.sendKeys("Cheese!");
        element.submit();*/
	}
}
