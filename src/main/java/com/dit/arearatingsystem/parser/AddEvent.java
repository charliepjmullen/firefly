package com.dit.arearatingsystem.parser;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dit.arearatingsystem.model.Event;

public class AddEvent {

	public AddEvent() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<Event> events = new ArrayList<>();
	
	public void addEvent(String eventname, String description, String username,
			             String address, String date, String starttime, String endtime, String longitude,
			             String latitude) {
		
		Connection c = null;
		Statement stmt = null;
		
		  try {
		         Class.forName("org.postgresql.Driver");
		         c = DriverManager
		            .getConnection("postgres://vboafkstvyrmoi:2767af4821495805b2f3555f0b9b3ec492c12ff3f4f066bbc080e22a87ddeb5f@ec2-54-247-123-231.eu-west-1.compute.amazonaws.com:5432/d6788da6nv1p7a",
		            "2767af4821495805b2f3555f0b9b3ec492c12ff3f4f066bbc080e22a87ddeb5f", "vboafkstvyrmoi");
		         c.setAutoCommit(false);

		         stmt = c.createStatement();
		       /*  int rs = stmt.executeUpdate( "INSERT INTO event VALUES '" +eventname +" ','" +description+"','" +username + "','" +address+"', '"+ date + "','"+starttime+"', '"+endtime+"', (nextval('eid_seq'::regclass));" );
		         
		         //System.out.println("Successfully added: " +  comment + longitude + latitude + address + username);
		         while ( rs.next() ) {
		            Review  review = rs.getDouble("price");
		            System.out.println();
		            housePrices.add(price);
		         }
		         //rs.close();
		         c.commit();
		         stmt.close();
		         c.close();*/       
		         
		      } catch ( Exception e ) {
		         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		         System.exit(0);
		      }
			
		}

	
		
		
	}


