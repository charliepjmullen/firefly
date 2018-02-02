package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.HousePrice;

@Repository
public interface HousePriceRepository extends JpaRepository<HousePrice, Long>{

}