package com.example.demo.menuMapping;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.login.UserRole;
import com.example.demo.login.UserRoleRepository;

@Service
public class RoleMenuMappingServiceImpl implements RoleMenuMappingService {

	@Autowired
	private RoleMenuMappringRepository mappringRepository;

	@Autowired
	private UserRoleRepository userRoleRepository;
	@Autowired
	private MenuMasterRepository menuMasterRepository;

	@Override
	public ModuleAndMenuResponse fetchModuleAndMenuByRole(String roleName) {
		List<Map<String, Object>> moduleAndMenuByRole = mappringRepository.getModuleAndMenuByRole(roleName);
		Set<ModuleDto> moduleDtos = new HashSet<>();
		List<MenuDto> menuDtos = new ArrayList<>();

		for (Map<String, Object> map : moduleAndMenuByRole) {
			ModuleDto moduleDto = new ModuleDto();
			Object moduleId = map.get("moduleId");
			moduleDto.setId(((BigInteger) moduleId).longValue());
			moduleDto.setModuleName((String) map.get("module_name"));
			moduleDtos.add(moduleDto);

			MenuDto menuDto = new MenuDto();
			menuDto.setModuleId(((BigInteger) moduleId).longValue());
			menuDto.setId(((BigInteger) map.get("menuId")).longValue());
			menuDto.setMenuUrl((String) map.get("menu_url"));
			menuDto.setMenuName((String) map.get("menu_name"));
			menuDtos.add(menuDto);
		}

		ModuleAndMenuResponse response = new ModuleAndMenuResponse();
		response.setModuleDtos(new ArrayList<>(moduleDtos));
		response.setMenuDtos(menuDtos);

		return response;
	}

	@Override
	public RoleAndMenuResponse fetchRoleBasedMenu(String roleName) {

		List<Map<String, Object>> menusByRole = mappringRepository.getMenuByRole(roleName);

		List<MenuDto> menuDtos = new ArrayList<>();
		String role = "";
		for (Map<String, Object> map : menusByRole) {
			role = (String) map.get("role_name");
			MenuDto menuDto = new MenuDto();
			menuDto.setId(((BigInteger) map.get("menuId")).longValue());
			menuDto.setMenuName((String) map.get("menu_name"));
			menuDtos.add(menuDto);
		}
		RoleAndMenuResponse response = new RoleAndMenuResponse();
		response.setRole(role);
		response.setMenuDtos(menuDtos);
		return response;
	}

	@Override
	public Map<String, String> addRoleBasedMenu(HttpServletRequest request) {
		Map<String, String> mapReturn = new HashMap<>();
		String role = request.getParameter("role");
		String[] menus = request.getParameterValues("menus");
		Long roleId = Long.valueOf(role);
		Optional<UserRole> userOpt = userRoleRepository.findById(roleId);
		UserRole userRole = userOpt.get();

		// for(String m)
		for (String menu : menus) {
			Long menuId = Long.valueOf(menu);
			boolean existsByRoleIdAndMenuMasterId = mappringRepository.existsByRoleIdAndMenuMasterId(role, menu);

			if (existsByRoleIdAndMenuMasterId) {
				mapReturn.put("status", "error");
				mapReturn.put("message", "already exist");
				return mapReturn;
			}
			Optional<MenuMaster> menuOpt = menuMasterRepository.findById(menuId);
			MenuMaster menuMaster = menuOpt.get();
			RoleMenuMapping rme = new RoleMenuMapping();
			rme.setMenuMasterId(menu);
			rme.setRoleId(role);
			mappringRepository.save(rme);
		}
		mapReturn.put("status", "success");
		return mapReturn;
	}

}
