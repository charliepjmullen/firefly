package com.dit.arearatingsystem.repository;

import org.springframework.data.repository.query.Param;     

import org.springframework.data.domain.Pageable;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.GardaStation;

@Repository
public interface GardaStationRepository extends JpaRepository<GardaStation, Long>{
	
	//GardaStationRepository gpa = List<GardaStation>();
	
	static final String HAVERSINE_PART = "(6371 * acos(cos(radians(:latitude)) * cos(radians(garda_station_latitude)) * cos(radians(garda_station_longitude) - radians(:longitude)) + sin(radians(:latitude)) * sin(radians(garda_station_latitude))))";

	@Query(value = "SELECT gardaStation_name FROM GardaStation ORDER BY "+HAVERSINE_PART + " DESC")// LIMIT 1")
	GardaStation findByGarda_Station_LatitudeAndGarda_Station_Longitude(@Param("latitude") final double latitude, @Param("longitude") final double longitude);
	
	/*@Query(value = "SELECT gardaStation_name FROM GardaStation ORDER BY "+HAVERSINE_PART + " DESC")// LIMIT 1")
	GardaStation findByGarda_Station_LatitudeAndGarda_Station_Longitude( Pageable limit, @Param("latitude") final double latitude, @Param("longitude") final double longitude);*/

	
//	@Query("SELECT g FROM GardaStation g " +s
//		   "ORDER BY ((gardaStation_latitude - latitude)*" +
//			         "(gardaStation_latitude - latitude))+ " +
//			         "((gardaStation_longitude - longitude)*" +
//			         "(gardaStation_longitude - longitude))")
//	public GardaStation findTopByGardaStation_LatitudeAndGardaStation_Longitude(@Param("latitude") double latitude, @Param("longitude")double longitude);
}