package com.dit.arearatingsystem.parser;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dit.arearatingsystem.model.Event;
import com.dit.arearatingsystem.repository.EventRepository;

@Controller
public class AddEvent {

	@Autowired
	private EventRepository eventRepository;
	
	public AddEvent() {
		// TODO Auto-generated constructor stub
	}
	
	//public ArrayList<Event> events = new ArrayList<>();
	
	public void addEvent(String eventname, String description, String username,
			             String address, String date, String starttime, String endtime, String longitude,
			             String latitude) {
		
		Event e = new Event(eventname,  description, address, starttime, endtime, Double.valueOf(longitude), Double.valueOf(latitude), 0);
		//System.out.println(eventRepository.toString());
		eventRepository.save(e);
		
	//	Connection c = null;
	//	Statement stmt = null;
		
	/*	  try {
		         Class.forName("org.postgresql.Driver");
		         c = DriverManager
		            .getConnection("jdbc:postgres://yepcjaejacsils:9609081e79300beb7f1df7e1244025e7778dfbeccc1f47a30595b96b673e68fc@ec2-54-217-235-137.eu-west-1.compute.amazonaws.com:5432/d79u6pllphqn3b",
		            "yepcjaejacsils", "9609081e79300beb7f1df7e1244025e7778dfbeccc1f47a30595b96b673e68fc");
		         c.setAutoCommit(false);

		         stmt = c.createStatement();
				int rs = stmt.executeUpdate( "INSERT INTO event VALUES '" +eventname +" ','" +description+"','" +username + "','" +address+"', '"+ date + "','"+starttime+"', '"+endtime+"', (nextval('eid_seq'::regclass));" );
		         
		         //System.out.println("Successfully added: " +  comment + longitude + latitude + address + username);
		         while ( rs.next() ) {
		            Review  review = rs.getDouble("price");
		            System.out.println();
		            housePrices.add(price);
		         }
		         //rs.close();
		         c.commit();
		         stmt.close();
		         c.close();     
		         
		      } catch ( Exception e ) {
		         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		         System.exit(0);
		      }
			*/
		}

	
		
		
	}


