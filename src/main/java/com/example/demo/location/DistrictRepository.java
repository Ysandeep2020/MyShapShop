package com.example.demo.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DistrictRepository extends JpaRepository<District, Long> {

	List<District> findByStateId(Long stateId);
}
