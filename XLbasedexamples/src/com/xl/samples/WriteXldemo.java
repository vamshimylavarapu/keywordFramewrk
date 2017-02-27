package com.xl.samples;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class WriteXldemo
{

	
	public static void main(String[] args) throws IOException 
	{
		FileInputStream fi=new FileInputStream("E:\\marks.xlsx");
		XSSFWorkbook wbook=new XSSFWorkbook(fi);
		 XSSFSheet wc=wbook.getSheet("Sheet0");
		 XSSFRow row=wc.getRow(3);
		 XSSFCell cell=row.createCell(4);
		 cell.setCellValue("pass");
		 FileOutputStream fo=new FileOutputStream("E:\\marks.xlsx");
		 wbook.write(fo);
		 fo.close();
		 fi.close();
		 
		 
	}
	
	
}
