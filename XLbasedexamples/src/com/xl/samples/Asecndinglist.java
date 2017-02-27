package com.xl.samples;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Asecndinglist {
	public static void main(String[] args){
		 
	    List<String> stringList = new ArrayList<>();
	    stringList.add("Suzuki");
	    stringList.add("Honda");
	    stringList.add("Toyota");
	    stringList.add("Ford");
	    stringList.add("Ford");
	    stringList.add("Renault");
	    stringList.add("Hyundai");
	 
	    // before sorting
	    System.out.println(stringList);
	 
	    // sort the list
	    Collections.sort(stringList);
	 
	    // after sorting
	    System.out.println(stringList);
	}

}
