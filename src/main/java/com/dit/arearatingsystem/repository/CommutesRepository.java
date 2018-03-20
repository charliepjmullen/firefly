package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;      
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.Commutes;

@Repository
public interface CommutesRepository extends JpaRepository<Commutes,Long>{

}
