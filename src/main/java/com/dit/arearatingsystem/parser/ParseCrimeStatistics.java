package com.dit.arearatingsystem.parser;

import java.io.*; 
import java.util.ArrayList;

import org.jsoup.*; 
import org.jsoup.nodes.Document; 
 
import org.jsoup.select.Elements;

public class ParseCrimeStatistics {
	
	double average = 2323.26;
	double rating = 0;

	
 	public double ParseCrime(String gardaStation_name) {
	try {
		 
		String crimeReport = "";

		ArrayList<Integer> crimeStats = new ArrayList<Integer>();
		crimeStats.clear();
		
		if(gardaStation_name.equals("Airport Police Station")) {
			crimeReport = "Dublin Airport.html";
		} else if(gardaStation_name.equals("Balbriggan Garda Station")) {
				crimeReport = "Balbriggan.html";
		} else if(gardaStation_name.equals("Ballymun Garda Station")) {
			     crimeReport = "Ballymun.html";
		} else if(gardaStation_name.equals("Ballyfermot Garda Station")) {
			crimeReport = "Ballyfermot.html";
	    } else if(gardaStation_name.equals("blackrock police station")) {
			crimeReport = "Blackrock.html";
	    } else if(gardaStation_name.equals("Blanchardstown Garda Station")) {
			crimeReport = "Blanchardstown.html";
	    } else if(gardaStation_name.equals("Bridewell Garda Station")) {
			crimeReport = "Bridewell.html";
	    } else if(gardaStation_name.equals("Garda Station")) {
			crimeReport = "Cabinteely.html";
	    } else if(gardaStation_name.equals("Cabra Garda Station")) {
			crimeReport = "Cabra.html";
	    } else if(gardaStation_name.equals("Clondalkin")) {
			crimeReport = "Clondalkin.html";
	    } else if(gardaStation_name.equals("Clontarf Garda Station")) {
			crimeReport = "Clontarf.html";
	    } else if(gardaStation_name.equals("Coolock Garda Station")) {
			crimeReport = "Coolock.html";
	    } else if(gardaStation_name.equals("Crumlin Garda Station")) {
			crimeReport = "Crumlin.html";
	    } else if(gardaStation_name.equals("Donnybrook Garda Station")) {
			crimeReport = "Donnybrook.html";
	    } else if(gardaStation_name.equals("Dun Laoghaire District Garda Station")) {
			crimeReport = "Dun Laoghaire.html";
	    } else if(gardaStation_name.equals("Dundrum Garda Station")) {
			crimeReport = "Dundrum.html";
	    } else if(gardaStation_name.equals("Finglas Garda Station")) {
			crimeReport = "Finglas.html";
	    } else if(gardaStation_name.equals("Fitzgibbon Street Garda Station")) {
			crimeReport = "Fitzgibbon Street.html";
	    } else if(gardaStation_name.equals("Garristown")) {
			crimeReport = "Garristown.html";
	    } else if(gardaStation_name.equals("Howth Garda Station")) {
			crimeReport = "Howth.html";
	    } else if(gardaStation_name.equals("Irishtown Garda Station")) {
			crimeReport = "Irishtown.html";
	    } else if(gardaStation_name.equals("Kevin Street District Garda Station")) {
			crimeReport = "Kevin Street.html";
	    } else if(gardaStation_name.equals("Kilmainham Garda Station")) {
			crimeReport = "Kilmainham.html";
	    } else if(gardaStation_name.equals("Lucan Garda Station")) {
			crimeReport = "Lucan.html";
	    } else if(gardaStation_name.equals("Lusk Garda Station")) {
			crimeReport = "Lusk.html";
	    } else if(gardaStation_name.equals("Malahide Garda Station")) {
			crimeReport = "Malahide.html";
	    } else if(gardaStation_name.equals("Mountjoy Garda Station")) {
			crimeReport = "Mountjoy.html";
	    } else if(gardaStation_name.equals("Pearse Street Garda Station")) {
			crimeReport = "Pearse Street.html";
	    } else if(gardaStation_name.equals("Raheny")) {
			crimeReport = "Raheny.html";
	    } else if(gardaStation_name.equals("Rathcoole Garda Station")) {
			crimeReport = "Rathcoole.html";
	    } else if(gardaStation_name.equals("Rathfarnham Garda Station")) {
			crimeReport = "Rathfarnam.html";
	    } else if(gardaStation_name.equals("Rathmines Garda Station")) {
			crimeReport = "Rathmines.html";
	    } else if(gardaStation_name.equals("Ronanstown Garda Station")) {
			crimeReport = "Ronanstown.html";
	    } else if(gardaStation_name.equals("Santry Garda Station")) {
			crimeReport = "Santry.html";
	    } else if(gardaStation_name.equals("Garda Shankill")) {
			crimeReport = "Shankill.html";
	    } else if(gardaStation_name.equals("Skerries Garda Station")) {
			crimeReport = "Skerries.html";
	    } else if(gardaStation_name.equals("Store Street District Garda Station")) {
			crimeReport = "Store Street.html";
	    } else if(gardaStation_name.equals("Crumlin Garda Station")) {
			crimeReport = "Sundrive Road.html";
	    } else if(gardaStation_name.equals("Swords Garda Station")) {
			crimeReport = "Swords.html";
	    } else if(gardaStation_name.equals("Tallaght Garda Station")) {
			crimeReport = "Tallaght.html";
	    } else if(gardaStation_name.equals("Terenure Garda Station")) {
			crimeReport = "Terenure.html";
	    } else if(gardaStation_name.equals(null)) {
	    	System.out.println("error");
	    }
		

		File input = new File(crimeReport);
		Document doc = Jsoup.parse(input, "UTF-8");

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
			
			// Calculates the average number of crimes a station deals with over the span of 6 years to 2 decimal places
			double sum2 = sum/6;
	        double result = Math.round(sum2 * 100.0) / 100.0;

	        double rating2 = 1 + (result - 70.00)*(10-1)/(10000.00- 70.00);
	        rating =  Math.round(rating2 * 100.0) / 100.0;


	}catch (IOException e) {
		e.printStackTrace();
	}

	return rating;
}
	}
