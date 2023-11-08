package com.example.demo.login;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.connection.UserAndChildsResponse;
import com.example.demo.connection.UserConnection;
import com.example.demo.connection.UserConnectionService;
import com.example.demo.connection.UserHierarchyResult;
import com.example.demo.connection.UserHierarchyService;
import com.example.demo.location.District;
import com.example.demo.location.DistrictService;
import com.example.demo.location.State;
import com.example.demo.location.StateService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	private RegisterService registerService;
	@Autowired
	private UserConnectionService connectionService;
	@Autowired
	private StateService stateService;
	@Autowired
	private DistrictService districtService;
	@Autowired
	private UserHierarchyService hierarchyService;

	// handler method to handle list students and return mode and view
	@GetMapping
	public String listUser(Model model) {
		model.addAttribute("users", registerService.getAllUsers());
		return "user/userList";
	}

	@GetMapping("/refList")
	public String userReferenceList(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());
		List<UserHierarchyResult> userHierarchyResults = hierarchyService.getUserHierarchyResults(user.getUniqueId());

		model.addAttribute("user", user);
		model.addAttribute("userHierarchyResults", userHierarchyResults);

		return "user/userRefList";
	}

	@GetMapping("/kyc")
	public String thisweekletter(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());

		model.addAttribute("users", user);
		return "user/kyc";
	}

	@GetMapping("/edit")
	public String editStudentForm(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());
		List<State> states = stateService.getAllStates();
		List<District> districts = districtService.getAllDistricts();
		model.addAttribute("user", user);
		model.addAttribute("states", states);
		model.addAttribute("districts", districts);
		return "user/editUser";
	}

	@PostMapping("/edit")
	public String editStudentForm(HttpServletRequest request) {
//		String fName = request.getParameter("firstName");
//		String lName = request.getParameter("lastName");
//		String email = request.getParameter("email");
//		String mobile = request.getParameter("mobile");
//		String course = request.getParameter("course");
//		String linkReferralCode = request.getParameter("linkReferralCode");

		// create student object to hold student form data
		// Student student = new Student();
		// model.addAttribute("student", student);
		return "redirect:/students";

	}

	@GetMapping("/newSeller")
	public String newSeller(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());
		System.out.println("User {}" + user);
		// list of states
		List<State> states = stateService.getAllStates();
		List<District> districts = districtService.getAllDistricts();
		model.addAttribute("user", user);
		model.addAttribute("states", states);
		model.addAttribute("districts", districts);
		return "user/newSeller";
	}

	@ResponseBody
	@PostMapping("/saveSeller")
	public Map<String, Object> saveSeller(HttpServletRequest request, @Valid LoginDto dto) {
		Map<String, Object> saveUserRegister = registerService.saveUserRegister(dto);
		return saveUserRegister;
	}

	@ResponseBody
	@PostMapping("/pan-update/{id}")
	public String updatePanNumber(HttpServletRequest request, @PathVariable Long id) {
		return registerService.updatePan(request, id);

	}

	@ResponseBody
	@PostMapping("/gst-update/{id}")
	public String updateGstNumber(HttpServletRequest request, @PathVariable Long id) {
		return registerService.updateGst(request, id);

	}

	@ResponseBody
	@GetMapping("/uId/{uniqueId}")
	public Map<String, Object> checkUniqueId(Principal p, @PathVariable String uniqueId) {
		return registerService.existByUniqueId(uniqueId);

	}

	@ResponseBody
	@GetMapping("/{uniqueId}")
	public UserMaster fetchByUniqueId(@PathVariable String uniqueId) {
		return registerService.getUserByUniqueId(uniqueId);

	}

	@ResponseBody
	@PostMapping("/basic-update/{id}")
	public String updateBasicDetails(@PathVariable Long id, LoginDto loginDto) {
		return registerService.updateBasicDetails(loginDto, id);

	}

	@GetMapping("/userRef")
	public String userReference(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());
		List<UserConnection> userConnections = connectionService.findChilds(user.getUniqueId());
		System.out.println("User {}" + user);
		System.out.println("User {}" + userConnections);

		model.addAttribute("user", user);
		model.addAttribute("userConns", userConnections);

		return "user/userRef";
	}

	@ResponseBody
	@GetMapping("/childs/{uid}")
	public UserAndChildsResponse userChilds(@PathVariable String uid, Model model) {
		// UserMaster user = registerService.getUserByEmail();
		UserMaster user = registerService.getUserByUniqueId(uid);
		List<UserConnection> userConnections = connectionService.findChilds(user.getUniqueId());
		UserAndChildsResponse response = new UserAndChildsResponse();
		response.setUser(user);
		response.setUserConnections(userConnections);
		return response;
	}

	@ResponseBody
	@GetMapping("/parent/{uid}")
	public UserAndChildsResponse userParent(@PathVariable String uid, Model model) {
		// UserMaster user = registerService.getUserByEmail();
		UserMaster user = registerService.getUserByUniqueId(uid);
		UserConnection userConnections = connectionService.findParent(user.getUniqueId());
		UserAndChildsResponse response = new UserAndChildsResponse();
		response.setUser(user);
		response.setUserConnection(userConnections);
		return response;
	}

	private void getUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Map<String, Object> loginDto = (Map<String, Object>) session.getAttribute("loginDto");
		// dto.setCreatedBy((long) loginDto.get("user_login_pk"));
	}

}
