package com.example.demo.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/states")
public class StateController {
	@Autowired
	private StateService stateService;

	@GetMapping
	public List<State> getAllStates() {
		return stateService.getAllStates();
	}

	// Add more endpoints as needed
}
