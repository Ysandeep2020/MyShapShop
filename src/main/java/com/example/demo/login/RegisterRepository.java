package com.example.demo.login;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisterRepository extends JpaRepository<UserMaster, Long> {

	UserMaster findByEmail(String email);

	UserMaster findByUniqueId(String uniqueId);

	boolean existsByUniqueId(String uniqueId);

}
