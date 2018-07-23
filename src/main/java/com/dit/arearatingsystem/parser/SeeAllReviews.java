package com.dit.arearatingsystem.parser;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dit.arearatingsystem.model.Review;

public class SeeAllReviews {

	public ArrayList<Review> reviews = new ArrayList<>();
	
	public ArrayList<Review> getAllReviews(double latitude, double longitude){
		
		  Connection c = null;
	      Statement stmt = null;
	      
	      
	      reviews.clear();
		
		try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/arearatingpgdb",
	            "postgres", "root");
	         c.setAutoCommit(false);
	        /* System.out.println("Opened House Price database successfully");*/

	         stmt = c.createStatement();
	         ResultSet rs = stmt.executeQuery( "SELECT * FROM reviews WHERE ST_DWithin(ST_MakePoint(latitude,longitude)::geography,ST_MakePoint("+ latitude + "," + longitude +")::geography,1000)" );
	         while ( rs.next() ) {
	            /*double  price = rs.getDouble("price");
	            System.out.println();
	            housePrices.add(price);*/
	        	Review review = new Review();
	        	String comment = rs.getString("comment");
	        	String address = rs.getString("address");
	        	String username = rs.getString("user");
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
	      }
		
		return reviews;
		
	}

}
