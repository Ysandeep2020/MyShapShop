package com.example.demo;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.login.RegisterService;
import com.example.demo.login.UserMaster;
import com.example.demo.menuMapping.MenuDto;
import com.example.demo.menuMapping.MenuMaster;
import com.example.demo.menuMapping.ModuleAndMenuResponse;
import com.example.demo.menuMapping.ModuleMaster;
import com.example.demo.menuMapping.ModuleService;
import com.example.demo.menuMapping.RoleMenuMappingService;
import com.example.demo.students.Student;
import com.example.demo.students.StudentService;

@Controller
public class AppController {

	@Autowired
	StudentService studentService;
	@Autowired
	ModuleService moduleService;

	@Autowired
	RoleMenuMappingService mappingService;
	@Autowired
	RegisterService registerService;

	@GetMapping("/home")
	public String goHome() {
		return "mainMaster";
	}

	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/")
	public String goIndexWithNon(Principal p,Model model) {

		// get list of module
		List<ModuleMaster> modules = moduleService.getModules();
//		List<MenuDto> menus = moduleService.getMenus();
		model.addAttribute("realmoduleList", modules);
//		model.addAttribute("menuList", menus);
		ModuleAndMenuResponse fetchModuleAndMenuByRole = mappingService.fetchModuleAndMenuByRole("Default");
//		ModuleAndMenuResponse fetchModuleAndMenuByRole = mappingService.fetchModuleAndMenuByRole("Student");

		// System.out.println(fetchModuleAndMenuByRole);

		model.addAttribute("moduleList", fetchModuleAndMenuByRole.getModuleDtos());
		model.addAttribute("menuList", fetchModuleAndMenuByRole.getMenuDtos());
		UserMaster user = registerService.getUserByEmail(p.getName());

		model.addAttribute("users", user);
		return "main";
	}

//	@GetMapping("/index")
//	public String goIndex(Model model) {
//
//		//
//		// get list of module
////		List<ModuleMaster> modules = moduleService.getModules();
////		List<MenuDto> menus = moduleService.getMenus();
////		model.addAttribute("moduleList", modules);
////		model.addAttribute("menuList", menus);
//		ModuleAndMenuResponse fetchModuleAndMenuByRole = mappingService.fetchModuleAndMenuByRole("Admin");
////		ModuleAndMenuResponse fetchModuleAndMenuByRole = mappingService.fetchModuleAndMenuByRole("Student");
//
//		// System.out.println(fetchModuleAndMenuByRole);
//		model.addAttribute("moduleList", fetchModuleAndMenuByRole.getModuleDtos());
//		model.addAttribute("menuList", fetchModuleAndMenuByRole.getMenuDtos());
//		return "index";
//	}

	@GetMapping("/signIn")
	public String goLogin() {
		return "login";
	}

	@GetMapping("/register")
	public String goRegisterPage() {
		return "register";
	}

	@GetMapping("/std")
	public String goRegister() {
		return "students/studentsList";
	}

//	@GetMapping("/main")
//	public String gotoMain(HttpServletRequest request, Model model) {
//		// get list of module
//		List<ModuleMaster> modules = moduleService.getModules();
////		List<MenuDto> menus = moduleService.getMenus();
//		model.addAttribute("realmoduleList", modules);
////		model.addAttribute("menuList", menus);
//		ModuleAndMenuResponse fetchModuleAndMenuByRole = mappingService.fetchModuleAndMenuByRole("Default");
//		
//		model.addAttribute("moduleList", fetchModuleAndMenuByRole.getModuleDtos());
//		model.addAttribute("menuList", fetchModuleAndMenuByRole.getMenuDtos());
//		return "main";
//	}

	@GetMapping("/edit")
	public String goEdit() {
		return "students/editStudent";
	}

	@GetMapping("/error-500")
	public String error500() {
		return "error-500";
	}

	@GetMapping("/error-404")
	public String error404() {
		return "error-404";
	}

	@GetMapping("/dashboard")
	public String goDashboard(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());

		model.addAttribute("users", user);
		return "dashboard";
	}

//	@GetMapping("/add")
//	public String goAdd() {
//		return "students/addStudent";
//	}

//	@GetMapping("/students-edit/{id}")
//	public String editStudentForm(@PathVariable Long id, Model model) {
//		Student student = studentService.getStudentById(id);
//		model.addAttribute("student", student);
//		return "students/editStudent";
//	}
//	@GetMapping("/students-edit")
//	public String editStudentForm() {
//	//	Student student = studentService.getStudentById(id);
//	//	model.addAttribute("student", student);
//		return "students/editStudent";
//	}

}
