package com.dit.arearatingsystem.parser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class ParseHousePrices {
   
	public ArrayList<Double> housePrices = new ArrayList<>();
	double average;
	public double ParseHousePrice(double latitude, double longitude) {
	      Connection c = null;
	      Statement stmt = null;
	      
	      housePrices.clear();
	      try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/arearatingpgdb",
	            "postgres", "root");
	         c.setAutoCommit(false);
	         System.out.println("Opened House Price database successfully");

	         stmt = c.createStatement();
	         ResultSet rs = stmt.executeQuery( "SELECT * FROM house_prices WHERE ST_DWithin(ST_MakePoint(latitude,longitude)::geography,ST_MakePoint("+ latitude + "," + longitude +")::geography,1000)" );
	         while ( rs.next() ) {
	            double  price = rs.getDouble("price");
	            System.out.println();
	            housePrices.add(price);
	         }
	         rs.close();
	         stmt.close();
	         c.close();
	      } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         System.exit(0);
	      }
	      
	      int sum = 0;
	      double total = 0;
	      if(!housePrices.isEmpty()) {
	    	    for (double houseprice : housePrices) {
	    	         total = sum += houseprice;
	    	    }
	    	    double average2 = total/housePrices.size();
	    	    average = (double)Math.round(average2 * 100.0)/100.0;
	    	  }

	      System.out.println("Operation done successfully");
	      
	    
		return average;
	   }
	
	  public List<Double> getList(){
		return housePrices;
    	  
      }
	}