package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.Event;

@Repository
public interface EventRepository extends JpaRepository<Event, Long>{

}
