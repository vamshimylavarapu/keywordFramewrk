package com.xl.samples;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class XldemoTest {

	public static void main(String[] args) throws IOException 
	{
		FileInputStream fi=new FileInputStream("E:\\marks.xlsx");
		XSSFWorkbook wbook=new XSSFWorkbook(fi);
		 XSSFSheet wc=wbook.getSheet("Sheet0");
		
		XSSFRow row=wc.getRow(1);
		XSSFCell cell=row.getCell(1);
		/*cell=row.createCell(5);
		cell.setCellValue("pass");*/
		/*FileOutputStream fo=new FileOutputStream("D:\\exampel.xlsx");
		wbook.write(fo);
		fo.close();
		fi.close();*/
		 int rc=wc.getLastRowNum();
		 System.out.println(rc);
		 
		 int cellvalue=row.getLastCellNum();
		 System.out.println(cellvalue);
		 String celldata=cell.getStringCellValue();
		 
		 System.out.println(celldata);
				 
		 
		 
		 
		

	}

}
