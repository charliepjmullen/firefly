package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dit.arearatingsystem.model.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long>{

}
