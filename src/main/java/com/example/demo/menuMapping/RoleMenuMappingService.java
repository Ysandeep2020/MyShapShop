package com.example.demo.menuMapping;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RoleMenuMappingService {
	ModuleAndMenuResponse fetchModuleAndMenuByRole(String roleName);
	RoleAndMenuResponse fetchRoleBasedMenu(String roleName);
	
	Map<String, String> addRoleBasedMenu(HttpServletRequest request);

}
