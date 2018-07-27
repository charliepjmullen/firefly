package com.dit.arearatingsystem.parser;

import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dit.arearatingsystem.model.Event;
import com.dit.arearatingsystem.model.Review; 

public class SeeAllEvents {

	public ArrayList<Event> events = new ArrayList<>();
	public ArrayList <Event> getAllEvents(){
		/*
		Connection c = null;
	      Statement stmt = null;
	      
	      
	      events.clear();
		
		try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/fireflypgdb",
	            "postgres", "root");
	         c.setAutoCommit(false);
	         System.out.println("Opened House Price database successfully");

	         stmt = c.createStatement();
	         ResultSet rs = stmt.executeQuery( "SELECT * FROM events WHERE ST_DWithin(ST_MakePoint(latitude,longitude)::geography,ST_MakePoint("+ latitude + "," + longitude +")::geography,1000)" );
	         while ( rs.next() ) {
	            double  price = rs.getDouble("price");
	            System.out.println();
	            housePrices.add(price);
	        	Event event = new Event();
	        	String eventname = rs.getString("eventname");
	        	String description = rs.getString("description");
	        	String username = rs.getString("username");
	        	String address;
	        	Long start_time;
	        	Long end_time;
	        	double latitude;
	        	double longitude;
	        	String address
	        	review.setComment(comment);
	        	review.setUsername(username);
	        	review.setAddress(address);
	        	reviews.add(review);
	        	
	         }
	         rs.close();
	         stmt.close();
	         c.close();
	      } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         System.exit(0);
	      }*/
		
		Event event = new Event(1L, "Test 1", "Test Description", "123 Fake Street", "5:00", "9:00", 38.691776, -9.423874);
		events.add(event);
		
    	/*String eventname = event.setEvent_Name(test);
    	String description = event.setEvent_Description("description");
    	String username = rs.getString("username");
    	String address;
    	Long start_time;
    	Long end_time;
    	double latitude;
    	double longitude;*/
		
		return events;
		
	}
	

}
