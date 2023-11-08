package com.example.demo.menuMapping;

import java.util.List;

public interface ModuleService {
	public List<ModuleMaster> getModules();
	public String setModulesWithMenus();
	public List<MenuDto> getMenus();

}
