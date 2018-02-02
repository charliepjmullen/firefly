package com.dit.arearatingsystem.service;

import com.dit.arearatingsystem.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
