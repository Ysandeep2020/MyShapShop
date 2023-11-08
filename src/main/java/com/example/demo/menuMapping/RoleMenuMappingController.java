package com.example.demo.menuMapping;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.login.UserRole;
import com.example.demo.login.UserRoleRepository;

@Controller
@RequestMapping("/role-menu-mapping")
public class RoleMenuMappingController {

	@Autowired
	RoleMenuMappingService mappingService;
	@Autowired
	UserRoleRepository roleRepository;
	@Autowired
	MenuMasterRepository menuMasterRepository;

	@GetMapping("/list")
	public String listModuleMapping(Model model) {
		// model.addAttribute("students", studentService.getAllStudents());
		mappingService.fetchRoleBasedMenu("Admin");
		return "menuMapping/menuMappingList";
	}

	@GetMapping("/add")
	public String addModuleMapping(Model model) {
		List<UserRole> roles = roleRepository.findAll();
		List<MenuMaster> menus = menuMasterRepository.findAll();
		// model.addAttribute("students", studentService.getAllStudents());
		model.addAttribute("roles", roles);
		model.addAttribute("menus", menus);
		return "menuMapping/addMenuMapping";
	}

	@ResponseBody
	@PostMapping("/save")
	public Map<String, String> saveModuleMapping(HttpServletRequest request, Model model) {
		return mappingService.addRoleBasedMenu(request);
	}

}
