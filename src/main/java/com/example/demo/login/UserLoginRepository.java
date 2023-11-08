package com.example.demo.login;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLoginRepository extends JpaRepository<UserLogin, Long> {

	UserLogin findByUsername(String username);

}
