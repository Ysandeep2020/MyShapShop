package com.example.demo.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DistrictService {
    @Autowired
    private DistrictRepository districtRepository;

    public List<District> getAllDistricts() {
        return districtRepository.findAll();
    }
    
    public List<District> getDistrictsByState(Long stateId) {
        return districtRepository.findByStateId(stateId);
    }

	public District findById(long id) {
		return districtRepository.findById(id).get();
	}
    
    // Add more service methods as needed
}
