package com.example.demo.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private UserLoginRepository userLoginRepository;
	@Autowired
	private UserRoleRepository userRoleRepository;


	@PostMapping("/SaveRegistration")
	public String SaveRegistration(HttpServletRequest request, LoginDto dto) {
		HttpSession session = request.getSession(false);
		Map<String, Object> loginDto = (Map<String, Object>) session.getAttribute("loginDto");
		// dto.setCreatedBy((long) loginDto.get("user_login_pk"));
		dto.setStatus("1");
		registerService.saveUserRegister(dto);
		return "main";
	}

	@PostMapping("/validate-login")
	public String validateLogin(HttpServletRequest request, ModelMap model) {
		HashMap<String, Object> map = new HashMap<>(); // log.info("username1 -> {}",
		String usename = request.getParameter("username");
		// log.info("Pass1 -> {}",
		String password = request.getParameter("password");
		map.put("username", request.getParameter("username"));
		map.put("password", request.getParameter("password"));
		Authentication authentication;
		try {
			authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					map.get("username").toString(), map.get("password").toString()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
		} catch (Exception ex) {
			if (ex instanceof LockedException || ex instanceof DisabledException) {
				model.put("authMessage", "ErrorMessages.USER_ACCOUNT_DISABLE");
			} else {
				model.put("authMessage", "ErrorMessages.INVALID_USERNAME_AND_PASSWORD ");
			}
			return "login";
		}
		if (authentication == null || !authentication.isAuthenticated()) {
			model.put("authMessage", "ErrorMessages.INVALID_USERNAME_AND_PASSWORD");
			return "login";
		} else {
			HttpSession session = request.getSession(true); //
//	  regService.updateLogin(request);
			userLoginRepository.findByUsername("username");
			Map<String, Object> dto = userRoleRepository.getBasicInformation(map.get("username").toString());
			session.setAttribute("loginDto", dto);

			// check company // boolean selfCompanyRegistered = //
			// regService.checkSelfCompanyRegistered(request.getParameter("username"));
			return "redirect:/";

		}
		
		
		
		
	}
}
