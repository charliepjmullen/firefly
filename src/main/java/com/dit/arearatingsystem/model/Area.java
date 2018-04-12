package com.dit.arearatingsystem.model;

import javax.persistence.Entity;    
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


@Entity
public class Area {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long areaId;
	private String areaName;
	private double longitude;
	private double latitude;
	private double schools;
	private double university;
	private double bars;
	private double gym;
	private double restaurant;
	private double house_price;
	private double crime_rating;

	

	
	public Area() {
		
	}
	
	public Area(Long areaId) {
		super();
		this.areaId = areaId;
	}
	
	public Area(String areaName) {
		super();
		this.areaName = areaName;
	}
	
	public Area(Long areaId, String areaName) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
	}
	
	public Area(Long areaId, String areaName, double longitude, double latitude) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	
	public Area(Long areaId, String areaName, double longitude, double latitude, double schools, double university, double bars, double gym, double restaurant) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.longitude = longitude;
		this.latitude = latitude;
		this.schools = schools;
		this.university = university;
		this.bars = bars;
		this.gym = gym;
		this.restaurant = restaurant;
	}

	public Area(Long areaId, String areaName, double longitude, double latitude, double house_price, double crime_rating, double schools, double university, double bars, double restaurant) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.longitude = longitude;
		this.latitude = latitude;
		this.crime_rating = crime_rating;
		this.house_price = house_price;
		this.schools = schools;
		this.university = university;
		this.bars = bars;
		this.restaurant = restaurant;
	}
	
	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
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

	public double getSchools() {
		return schools;
	}

	public void setSchools(double schools) {
		this.schools = schools;
	}

	public double getUniversity() {
		return university;
	}

	public void setUniversity(double university) {
		this.university = university;
	}

	public double getBars() {
		return bars;
	}

	public void setBars(double bars) {
		this.bars = bars;
	}

	public double getGym() {
		return gym;
	}

	public void setGym(double gym) {
		this.gym = gym;
	}

	public double getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(double restaurant) {
		this.restaurant = restaurant;
	}
	

	public double getHouse_price() {
		return house_price;
	}

	public void setHouse_price(double house_price) {
		this.house_price = house_price;
	}

	public double getCrime_rating() {
		return crime_rating;
	}

	public void setCrime_rating(double crime_rating) {
		this.crime_rating = crime_rating;
	}



	

	

}
