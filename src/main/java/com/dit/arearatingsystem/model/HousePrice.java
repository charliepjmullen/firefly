package com.dit.arearatingsystem.model;

import javax.persistence.Entity; 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class HousePrice {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int housePrice_id;
	private double housePrice;
	private double latitude;
	private double longitude;
	private int number_of_houses;
	
	public HousePrice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HousePrice(int housePrice_id, double housePrice) {
		super();
		this.housePrice_id = housePrice_id;
		this.housePrice = housePrice;
	
	}
	
	public HousePrice(int housePrice_id, double housePrice, double latitude ,double longitude) {
		super();
		this.housePrice_id = housePrice_id;
		this.housePrice = housePrice;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public HousePrice(int housePrice_id, double latitude ,double longitude) {
		super();
		this.housePrice_id = housePrice_id;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public HousePrice(int housePrice_id, double housePrice, double latitude ,double longitude, int number_of_houses) {
		super();
		this.housePrice_id = housePrice_id;
		this.housePrice = housePrice;
		this.latitude = latitude;
		this.longitude = longitude;
		this.number_of_houses = number_of_houses;
	}
	
	public HousePrice(int housePrice_id, double housePrice,  int number_of_houses) {
		super();
		this.housePrice_id = housePrice_id;
		this.housePrice = housePrice;
		this.number_of_houses = number_of_houses;
	}
	

	public int getHousePrice_id() {
		return housePrice_id;
	}

	public void setHousePrice_id(int housePrice_id) {
		this.housePrice_id = housePrice_id;
	}

	public double getHousePrice() {
		return housePrice;
	}

	public void setHousePrice(double housePrice) {
		this.housePrice = housePrice;
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

	
	public int getNumber_of_houses() {
		return number_of_houses;
	}

	public void setNumber_of_houses(int number_of_houses) {
		this.number_of_houses = number_of_houses;
	}
	
	
}
