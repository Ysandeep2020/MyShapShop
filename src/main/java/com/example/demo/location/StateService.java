package com.example.demo.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StateService {
	@Autowired
	private StateRepository stateRepository;

	public List<State> getAllStates() {
		return stateRepository.findAll();
	}

	public State findById(Long id) {
		return stateRepository.findById(id).get();
	}

	// Add more service methods as needed
}
