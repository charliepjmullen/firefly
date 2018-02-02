package com.dit.arearatingsystem.parser;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

import org.jsoup.*; 
import org.jsoup.nodes.Document; 
import org.jsoup.nodes.Element; 
import org.jsoup.select.Elements;

public class ParseCrimeStatistics {

	//public static void main(String[]args) {
	
	double average = 2323.26;
	double rating = 0;
		
	public void ParseCrime(String gardaStation) {
	try {
		 
		
		String crimeReport = "";
		
		
		
		
		ArrayList<Integer> crimeStats = new ArrayList<Integer>();
		crimeStats.clear();
		
		if(gardaStation.equals("Airport")) {
			crimeReport = "Dublin Airport.html";
		} else if(gardaStation.equals("Balbriggan")) {
				crimeReport = "Balbriggan.html";
		} else if(gardaStation.equals("Ballymun")) {
			     crimeReport = "Ballymun.html";
		} else if(gardaStation.equals("Ballyfermot")) {
			crimeReport = "Ballyfermot.html";
	    } else if(gardaStation.equals("Blackrock")) {
			crimeReport = "Blackrock.html";
	    } else if(gardaStation.equals("Blanchardstown")) {
			crimeReport = "Blanchardstown.html";
	    } else if(gardaStation.equals("Bridewell")) {
			crimeReport = "Bridewell.html";
	    } else if(gardaStation.equals("Cabinteely")) {
			crimeReport = "Cabinteely.html";
	    } else if(gardaStation.equals("Cabra")) {
			crimeReport = "Cabra.html";
	    } else if(gardaStation.equals("Clondalkin")) {
			crimeReport = "Clondalkin.html";
	    } else if(gardaStation.equals("Clontarf")) {
			crimeReport = "Clontarf.html";
	    } else if(gardaStation.equals("Coolock")) {
			crimeReport = "Coolock.html";
	    } else if(gardaStation.equals("Crumlin")) {
			crimeReport = "Crumlin.html";
	    } else if(gardaStation.equals("Donnybrook")) {
			crimeReport = "Donnybrook.html";
	    } else if(gardaStation.equals("Dun Laoghaire")) {
			crimeReport = "Dun Laoghaire.html";
	    } else if(gardaStation.equals("Dundrum")) {
			crimeReport = "Dundrum.html";
	    } else if(gardaStation.equals("Finglas")) {
			crimeReport = "Finglas.html";
	    } else if(gardaStation.equals("Fitzgibbon Street")) {
			crimeReport = "Fitzgibbon Street.html";
	    } else if(gardaStation.equals("Garristown")) {
			crimeReport = "Garristown.html";
	    } else if(gardaStation.equals("Howth")) {
			crimeReport = "Howth.html";
	    } else if(gardaStation.equals("Irishtown")) {
			crimeReport = "Irishtown.html";
	    } else if(gardaStation.equals("Kevin Street")) {
			crimeReport = "Kevin Street.html";
	    } else if(gardaStation.equals("Kilmainham")) {
			crimeReport = "Kilmainham.html";
	    } else if(gardaStation.equals("Lucan")) {
			crimeReport = "Lucan.html";
	    } else if(gardaStation.equals("Lusk")) {
			crimeReport = "Lusk.html";
	    } else if(gardaStation.equals("Malahide")) {
			crimeReport = "Malahide.html";
	    } else if(gardaStation.equals("Mountjoy")) {
			crimeReport = "Mountjoy.html";
	    } else if(gardaStation.equals("Pearse Street")) {
			crimeReport = "Pearse Street.html";
	    } else if(gardaStation.equals("Raheny")) {
			crimeReport = "Raheny.html";
	    } else if(gardaStation.equals("Rathcoole")) {
			crimeReport = "Rathcoole.html";
	    } else if(gardaStation.equals("Rathfarnam")) {
			crimeReport = "Rathfarnam.html";
	    } else if(gardaStation.equals("Rathmines")) {
			crimeReport = "Rathmines.html";
	    } else if(gardaStation.equals("Ronanstown")) {
			crimeReport = "Ronanstown.html";
	    } else if(gardaStation.equals("Santry")) {
			crimeReport = "Santry.html";
	    } else if(gardaStation.equals("Shankill")) {
			crimeReport = "Shankill.html";
	    } else if(gardaStation.equals("Skerries")) {
			crimeReport = "Skerries.html";
	    } else if(gardaStation.equals("Store Street")) {
			crimeReport = "Store Street.html";
	    } else if(gardaStation.equals("Sundrive Road")) {
			crimeReport = "Sundrive Road.html";
	    } else if(gardaStation.equals("Swords")) {
			crimeReport = "Swords.html";
	    } else if(gardaStation.equals("Tallaght")) {
			crimeReport = "Tallaght.html";
	    } else if(gardaStation.equals("Terenure")) {
			crimeReport = "Terenure.html";
	    }
		
		
		
			

		File input = new File(crimeReport);
		Document doc = Jsoup.parse(input, "UTF-8");//, "http://www.cso.ie");

		Elements numbers = doc.select("td");
		Elements titles = doc.select("th");


	
		for(int i=9; i<titles.size(); i++)
		{
			  
		    for(int j=0; j<6; j++)
		    {
		    	String number = numbers.get((i-9)*6+j).text();
		    	int foo = Integer.parseInt(number);
		    	crimeStats.add(foo);
		    }
		}
		
		
		int i;
		double sum = 0;
		for(i = 1; i < crimeStats.size(); i++) 
		    sum += crimeStats.get(i);
	        //double sum2 = sum/crimeStats.size();
			
			// Calculates the average number of crimes a station deals with over the span of 6 years to 2 decimal places
			double sum2 = sum/6;
	        double result = Math.round(sum2 * 100.0) / 100.0;
	        //System.out.println(sum);
	        //System.out.println(result);
	       
	        double rating2 = (result / average * 100) / 50;
	        rating =  Math.round(rating2 * 100.0) / 100.0;
	       
	        System.out.println("Rating: " + rating );
	        System.out.println(" ");


	
	}catch (IOException e) {
		e.printStackTrace();
	}
	//System.out.println(rating);
	//return rating;
}
	}




//if(result <= average*0.10) {
//	   rating = 1;
//}
//else if (result > average*0.10 &&  result <= average*0.20) {
//	   rating = 1.5;
//}
//else if (result > average*0.20 &&  result <= average*0.25){
//	   rating = 2;
//}
//else if (result > average*0.25 &&  result <= average*0.30){
//	   rating = 2.5;
//}
//else if (result > average*0.30 &&  result <= average*0.35){
//	   rating = 3;
//}
//else if (result > average*0.35 &&  result <= average*0.40){
//	   rating = 3.5;
//}
//else if (result > average*0.40 &&  result <= average*0.45){
//	   rating = 4;
//}
//else if (result > average*0.45 &&  result <= average*0.50){
//	   rating = 4.5;
//}
//else if (result > average*0.50 &&  result <= average*0.55){
//	   rating = 5;
//}
//else if (result > average*0.55 &&  result <= average*0.60){
//	   rating = 5.5;
//}
//else if (result > average*0.60 &&  result <= average*0.65){
//	   rating = 6;
//}
//else if (result > average*0.65 &&  result <= average*0.70){
//	   rating = 6.5;
//}
//else if (result > average*0.70 &&  result <= average*0.75){
//	   rating = 7;
//}
//else if (result > average*0.75 &&  result <= average*0.80){
//	   rating = 7.5;
//}
//else if (result > average*0.80 &&  result <= average*0.85){
//	   rating = 8;
//}
//else if (result > average*0.85 &&  result <= average*0.90){
//	   rating = 8.5;
//}
//else if (result > average*0.90 &&  result <= average*0.95){
//	   rating = 9;
//}
//else if (result > average*0.95 &&  result <= average*1){
//	   rating = 9.5;
//}
//else if (result > 1){
//	   rating = 10;
//}

