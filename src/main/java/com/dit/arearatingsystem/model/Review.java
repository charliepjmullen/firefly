package com.dit.arearatingsystem.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity(name="review")
public class Review {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	Long id;
	String comment;
	double longitude;
	double latitude;
	String address;
    String username;
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	User user;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Review(Long id, String comment, double longitude, double latitude, String address, User user) {
		super();
		this.id = id;
		this.comment = comment;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
		this.user = user;
	}
	
	public Review(Long id, String comment, double longitude, double latitude, String address, String username) {
		super();
		this.id = id;
		this.comment = comment;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
		this.username = username;
	}
	
	public Review(Long id,  double longitude, double latitude, String address, User user) {
		super();
		this.id = id;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
		this.user = user;
	}
	
	public Review(Long id,  double longitude, double latitude, String address) {
		super();
		this.id = id;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
	}
	
	public Review(Long id, String comment, String username) {
		super();
		this.id = id;
		this.comment = comment;
		this.username = username;
	}
	
	public Review( String comment, String username) {
		super();
		
		this.comment = comment;
		this.username = username;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	

}
