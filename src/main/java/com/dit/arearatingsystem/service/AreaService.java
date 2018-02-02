package com.dit.arearatingsystem.service;

import com.dit.arearatingsystem.model.Area;

public interface AreaService {
	void save(Area area);
	
	Area findByAddress(String address);

}
