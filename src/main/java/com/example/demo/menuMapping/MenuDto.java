package com.example.demo.menuMapping;

import lombok.Data;

@Data
public class MenuDto {
	private Long id;
	private String menuName;
	private Long moduleId;
	private String menuUrl;
}
