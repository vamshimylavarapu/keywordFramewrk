package com.xl.samples;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;

public class Stringdemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		String str="ibkcskjfkfljfjfl";
		String str1=str.replaceAll("\\s"," ");
		str.toLowerCase();
		str.toUpperCase();
		str.trim();
		System.out.println(str.lastIndexOf(6));*/
		//System.out.println(str1);
		String str2="Hello world";
		String revstring="";
		 
		/*for(int i=str2.length()-1;i>=0;--i){
		revstring +=str2.charAt(i);
		}
		 
		System.out.println(revstring);

	}*/
		
		System.setProperty("webdriver.ie.driver", "D:\\IEDriverServer.exe"); 
		WebDriver driver=new InternetExplorerDriver();
		driver.get("http://www.google.com");
		driver.quit();
		
		
	}

}
