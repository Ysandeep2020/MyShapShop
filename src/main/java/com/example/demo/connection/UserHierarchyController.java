package com.example.demo.connection;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserHierarchyController {
	private final UserHierarchyService userHierarchyService;

	@Autowired
	public UserHierarchyController(UserHierarchyService userHierarchyService) {
		this.userHierarchyService = userHierarchyService;
	}

	@GetMapping("/user-hierarchy/{parentId}")
	public List<UserHierarchyResult> getUserHierarchy(@PathVariable(name = "parentId") String parentId) {
		return userHierarchyService.getUserHierarchyResults(parentId);
	}
}
