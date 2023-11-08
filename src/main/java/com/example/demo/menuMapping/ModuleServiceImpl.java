package com.example.demo.menuMapping;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleMasterRepository moduleMasterRepository;
	@Autowired
	private MenuMasterRepository masterRepository;

	public List<ModuleMaster> getModules() {
		List<ModuleMaster> modules = moduleMasterRepository.findAll();
		return modules;
	}

	public List<MenuDto> getMenus() {
		List<MenuMaster> menus = masterRepository.findAll();
		List<MenuDto> menudtos = new ArrayList<>();
		menus.stream().forEach(menu -> {
			MenuDto dto = new MenuDto();
			dto.setId(menu.getId());
			dto.setMenuName(menu.getMenuName());
			dto.setModuleId(menu.getModule().getId());
			dto.setMenuUrl(menu.getMenuUrl());
			menudtos.add(dto);
		});
		return menudtos;
	}

	@Override
	public String setModulesWithMenus() {

		List<ModuleMaster> modules = new ArrayList<>();

		return null;
	}
}
