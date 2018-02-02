package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;    
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.Area;
 
@Repository
public interface AreaRepository extends JpaRepository<Area, Long>{

}
