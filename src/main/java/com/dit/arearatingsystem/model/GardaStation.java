package com.dit.arearatingsystem.model;

import java.util.List;    

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class GardaStation {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int gardaStation_id;
	private String gardaStation_name;
	private double gardaStation_latitude;
	private double gardaStation_longitude;
	
	
	public GardaStation() {
		// TODO Auto-generated constructor stub
	}


	public GardaStation(int gardaStation_id, String gardaStation_name, double gardaStation_latitude,
			double gardaStation_longitude) {
		super();
		this.gardaStation_id = gardaStation_id;
		this.gardaStation_name = gardaStation_name;
		this.gardaStation_latitude = gardaStation_latitude;
		this.gardaStation_longitude = gardaStation_longitude;
	}
	
	public GardaStation(String gardaStation_name) {
		this.gardaStation_name = gardaStation_name;
	}



	public int getGardaStation_id() {
		return gardaStation_id;
	}


	public void setGardaStation_id(int gardaStation_id) {
		this.gardaStation_id = gardaStation_id;
	}


	public String getGardaStation_name() {
		return gardaStation_name;
	}


	public void setGardaStation_name(String gardaStation_name) {
		this.gardaStation_name = gardaStation_name;
	}


	public double getGardaStation_latitude() {
		return gardaStation_latitude;
	}


	public void setGardaStation_latitude(double gardaStation_latitude) {
		this.gardaStation_latitude = gardaStation_latitude;
	}


	public double getGardaStation_longitude() {
		return gardaStation_longitude;
	}


	public void setGardaStation_longitude(double gardaStation_longitude) {
		this.gardaStation_longitude = gardaStation_longitude;
	}




}
