package com.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.tree.RowMapper;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class XLutils
{
	public static FileInputStream fi;
	public static FileOutputStream fo;
	public static XSSFWorkbook wbook;
	public static XSSFSheet wsheet;
	public static XSSFRow row;
	public static XSSFCell cell;

	public static int getRowcoun(String xlfile,String xlsheet) throws IOException
	{
		//getting total number of counts in a sheet
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		int rc=wsheet.getLastRowNum();
		//System.out.println(rc);
		return rc;
		
	}
	public static int getcellcount(String xlfile,String xlsheet,int rownum) throws IOException
	{
		
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		row=wsheet.getRow(rownum);
		
		int cellcount=row.getLastCellNum();
		//System.out.println(cellcount);
		return cellcount;
		
	}
	
	public static String getcelldata(String xlfile,String xlsheet,int rownum,int cellnum) throws IOException
	{
		
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		row=wsheet.getRow(rownum);
		cell=row.getCell(cellnum);
		String data;
		try
		{
			 data=cell.getStringCellValue();
			//System.out.println(data);
			
			
		}
		catch(Exception e)
		{
			data="";
		}
		
		//System.out.println(data);
		return data;
		
	}
	
	public static String setcelldata(String xlfile,String xlsheet,int rownum,int cellnum,String data) throws IOException
	{
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		row=wsheet.getRow(rownum);
		cell=row.createCell(cellnum);
		cell.setCellValue(data);
		//row.getCell(cellnum).setCellValue(data);
		
		fo=new FileOutputStream(xlfile);
		wbook.write(fo);
		wbook.close();
		fo.close();
		fi.close();
return data;
		
	}
	public  static void fillgreencolor(String xlfile,String xlsheet,int rownum,int cellnum) throws IOException
	{
	
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		row=wsheet.getRow(rownum);
		cell=row.getCell(cellnum);
		CellStyle style=wbook.createCellStyle();
		style.setFillForegroundColor(IndexedColors.GREEN.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(style);
		fo=new FileOutputStream(xlfile);
		wbook.write(fo);
		wbook.close();
		fo.close();
		fi.close();
		
		
	}
	public  static void fillRedColor(String xlfile,String xlsheet,int rownum,int cellnum) throws IOException
	{
	
		fi=new FileInputStream(xlfile);
		wbook=new XSSFWorkbook(fi);
		wsheet=wbook.getSheet(xlsheet);
		row=wsheet.getRow(rownum);
		cell=row.getCell(cellnum);
		CellStyle style=wbook.createCellStyle();
		style.setFillForegroundColor(IndexedColors.RED.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(style);
		fo=new FileOutputStream(xlfile);
		wbook.write(fo);
		wbook.close();
		fo.close();
		fi.close();
		
		
	}
	
}
