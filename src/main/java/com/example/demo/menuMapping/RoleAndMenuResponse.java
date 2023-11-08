package com.example.demo.menuMapping;

import java.util.List;

import lombok.Data;

@Data
public class RoleAndMenuResponse {
	private String role;
	private List<MenuDto> menuDtos;

	// Constructors, getters, and setters
}
