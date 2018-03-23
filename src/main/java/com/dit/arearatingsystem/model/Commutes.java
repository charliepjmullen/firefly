package com.dit.arearatingsystem.model;

import javax.persistence.*; 


@Entity
@Table(name = "commutes")
public class Commutes {

	private Long id;
	private String address;
	private String addressnickname;
	
	public Commutes() {
		
	}
	
	public Commutes(Long id, String address, String addressnickname) {
		super();
		this.id = id;
		this.address = address;
		this.addressnickname = addressnickname;
	}
	
	public Commutes(String address) {
		super();
		this.address = address;
	}
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
     public Long getId() {
	        return id;
     }
	 
	 public void setId(Long id) {
	 	this.id = id;
	 }
		
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressnickname() {
		return addressnickname;
	}

	public void setAddressnickname(String addressnickname) {
		this.addressnickname = addressnickname;
	}

    

	 
}
