package com.dit.arearatingsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long event_Id;
	private String event_Name;
	private String event_Description;
	private String address;
	private String start_time;
	private String end_time;
	private double latitude;
	private double longitude;
	private int attendees_number;
	
	
	
	public Event() {
		// TODO Auto-generated constructor stub
	}


	
	
	public Event(Long event_Id, String event_Name, String event_Description, String address, String start_time,
			String end_time, double latitude, double longitude, int attendees_number) {
		super();
		this.event_Id = event_Id;
		this.event_Name = event_Name;
		this.event_Description = event_Description;
		this.address = address;
		this.start_time = start_time;
		this.end_time = end_time;
		this.latitude = latitude;
		this.longitude = longitude;
		this.attendees_number = attendees_number;
	}

	public Event(Long event_Id, String event_Name, String event_Description, String address, String start_time,
			String end_time, double latitude, double longitude) {
		super();
		this.event_Id = event_Id;
		this.event_Name = event_Name;
		this.event_Description = event_Description;
		this.address = address;
		this.start_time = start_time;
		this.end_time = end_time;
		this.latitude = latitude;
		this.longitude = longitude;
		
	}

	public Event(String event_Name, String event_Description, String address, String start_time,
			String end_time, double latitude, double longitude, int attendees_number) {
		super();
		this.event_Name = event_Name;
		this.event_Description = event_Description;
		this.address = address;
		this.start_time = start_time;
		this.end_time = end_time;
		this.latitude = latitude;
		this.longitude = longitude;
		this.attendees_number = attendees_number;
	}


	public Long getEvent_Id() {
		return event_Id;
	}



	public void setEvent_Id(Long event_Id) {
		this.event_Id = event_Id;
	}



	public String getEvent_Name() {
		return event_Name;
	}



	public void setEvent_Name(String event_Name) {
		this.event_Name = event_Name;
	}



	public String getEvent_Description() {
		return event_Description;
	}



	public void setEvent_Description(String event_Description) {
		this.event_Description = event_Description;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getStart_time() {
		return start_time;
	}



	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}



	public String getEnd_time() {
		return end_time;
	}



	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}



	public double getLatitude() {
		return latitude;
	}



	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}



	public double getLongitude() {
		return longitude;
	}



	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}



}