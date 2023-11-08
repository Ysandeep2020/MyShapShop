package com.example.demo.earnings;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.login.RegisterService;
import com.example.demo.login.UserMaster;

@Controller
@RequestMapping("/earning")
public class EarningsController {
	@Autowired
	private RegisterService registerService;

// handler method to handle list students and return mode and view
	@GetMapping("/check-this-week")
	public String checkThisWeek(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());

		model.addAttribute("users", user);
		return "earning/checkthisweek";
	}

	@GetMapping("/this-week-letter")
	public String thisweekletter(Principal p, Model model) {
		UserMaster user = registerService.getUserByEmail(p.getName());

		model.addAttribute("users", user);
		return "earning/thisweekletter";
	}

}