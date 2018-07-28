package com.dit.arearatingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository; 


import com.dit.arearatingsystem.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    

}
