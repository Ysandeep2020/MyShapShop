package com.example.demo.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/districts") 
public class DistrictController {
	@Autowired
	private DistrictService districtService;

//	@GetMapping
//	public List<District> getAllDistricts() {
//		return districtService.getAllDistricts();
//	}
    @ResponseBody
	@PostMapping("/{stateId}")
	public List<District> getDistrictsByState(@PathVariable Long stateId) {
		return districtService.getDistrictsByState(stateId);
	}

	// Add more endpoints as needed
}
