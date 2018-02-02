package com.dit.arearatingsystem.model;

import javax.persistence.Entity; 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Area {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int area_id;
	private String areaName;
	private double longitude;
	private double latitude;
	

	
	public Area() {
		
	}
	
	public Area(int area_id) {
		super();
		this.area_id = area_id;
	}
	
	public Area(String areaName) {
		super();
		this.areaName = areaName;
	}
	
	public Area(int area_id, String areaName) {
		super();
		this.area_id = area_id;
		this.areaName = areaName;
	}
	
	public Area(int area_id, String areaName, double longitude, double latitude) {
		super();
		this.area_id = area_id;
		this.areaName = areaName;
		this.longitude = longitude;
		this.latitude = latitude;
	}

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


}
