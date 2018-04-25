package com.dit.arearatingsystem.parser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dit.arearatingsystem.model.Review;
import com.dit.arearatingsystem.model.User;

public class AddReview {

	public ArrayList<Review> reveiws = new ArrayList<>();
	
	public void addReview(String comment, double longitude, double latitude, String address, String username) {
		
		Connection c = null;
	    Statement stmt = null;
		
	    try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/arearatingpgdb",
	            "postgres", "root");
	         c.setAutoCommit(false);

	         stmt = c.createStatement();
	         int rs = stmt.executeUpdate( "INSERT INTO reviews VALUES (nextval('reviews_id_seq'::regclass), '" +comment +" '," +longitude+"," +latitude+", '"+address+"', '"+username+"');" );
	         
	         System.out.println("Successfully added: " +  comment + longitude + latitude + address + username);
	        /* while ( rs.next() ) {
	            Review  review = rs.getDouble("price");
	            System.out.println();
	            housePrices.add(price);
	         }*/
	         //rs.close();
	         c.commit();
	         stmt.close();
	         c.close();
	      } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         System.exit(0);
	      }
		
	}

}
