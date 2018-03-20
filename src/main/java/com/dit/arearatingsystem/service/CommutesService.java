package com.dit.arearatingsystem.service;

import com.dit.arearatingsystem.model.Commutes;

public interface CommutesService {
	
	void save(Commutes area);
	
	Commutes findByAddress(String address);
}
