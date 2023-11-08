package com.example.demo.menuMapping;

import java.util.List;

import lombok.Data;

@Data
public class ModuleAndMenuResponse {
	private List<ModuleDto> moduleDtos;
	private List<MenuDto> menuDtos;

	// Constructors, getters, and setters
}
