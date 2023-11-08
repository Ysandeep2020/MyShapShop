package com.example.demo.students;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudentController {

	private StudentService studentService;

	public StudentController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}

	@GetMapping("/checkLinkReferralCode")
	@ResponseBody
	public Map<String, Object> checkLinkRef(@RequestParam String linkReferralCode) {
		Map<String, Object> returnMap = new HashMap<>();
		boolean exist = studentService.existsByLinkRefcode(linkReferralCode);
		if (!exist) {
			returnMap.put("unsuccess", "subscribed !");
			return returnMap;
		}
		returnMap.put("success", "subscribed !");
		return returnMap;
	}

	// handler method to handle list students and return mode and view
	@GetMapping("/students")
	public String listStudents(Model model) {
		model.addAttribute("students", studentService.getAllStudents());
		return "students/studentsList";
	}

	@GetMapping("/add")
	public String goAdd() {
		return "students/addStudent";
	}

	@GetMapping("/students-new")
	public String studentForm(Model model) {
		// create student object to hold student form data
		Student student = new Student();
		model.addAttribute("student", student);
		return "students/addStudent";
	}

	@GetMapping("/students-edit/{id}")
	public String editStudentForm(@PathVariable Long id, Model model) {
		Student student = studentService.getStudentById(id);
		model.addAttribute("student", student);
		return "students/editStudent";
	}

	@GetMapping("/students-edit")
	public String editStudentForm(Model model) {
		Student student = studentService.getStudentById(1l);
		model.addAttribute("student", student);
		return "students/editStudent";
	}

	@ResponseBody
	@PostMapping("/students/save")
	public Map<String, Object> createStudentForm(HttpServletRequest request) {
		Map<String, Object> returnMap = new HashMap<>();

		String fName = request.getParameter("firstName");
		String lName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String course = request.getParameter("course");
		String linkReferralCode = request.getParameter("linkReferralCode");
		Student st = new Student();
		st.setFirstName(fName);
		st.setLastName(lName);
		st.setEmail(email);
		st.setMobile(mobile);
		st.setCourse(course);
		st.setLinkReferralCode(linkReferralCode);
		st.setCreatedOn(new Date());
		// st.set
		studentService.saveStudent(st);
		returnMap.put("status", "Success");
		// create student object to hold student form data
		// Student student = new Student();
		// model.addAttribute("student", student);
		return returnMap;

	}

	@PostMapping("/students/edit")
	public String editStudentForm(HttpServletRequest request) {
		String fName = request.getParameter("firstName");
		String lName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String course = request.getParameter("course");
		String linkReferralCode = request.getParameter("linkReferralCode");
		Student st = new Student();
		st.setFirstName(fName);
		st.setLastName(lName);
		st.setEmail(email);
		st.setMobile(mobile);
		st.setCourse(course);
		st.setLinkReferralCode(linkReferralCode);
		st.setCreatedOn(new Date());
		// st.set
		studentService.saveStudent(st);

		// create student object to hold student form data
		// Student student = new Student();
		// model.addAttribute("student", student);
		return "redirect:/students";

	}

	@PostMapping("/students")
	public String saveStudent(@ModelAttribute Student student, Model model) {
		// Student studentOut = studentService.saveStudent(student);

//		if (studentOut != null) {
//			return "redirect:/index";
//		} else {
//			model.addAttribute("message", "Referral code is Incorrect");
//			return "create_student";
//		}
		return "";
	}

	@PostMapping("/students/{id}")
	public String updateStudent(@PathVariable Long id, @ModelAttribute Student student, Model model) {

		// get student from database by id
		Student existingStudent = studentService.getStudentById(id);
		existingStudent.setId(id);
		existingStudent.setFirstName(student.getFirstName());
		existingStudent.setLastName(student.getLastName());
		existingStudent.setEmail(student.getEmail());
		existingStudent.setMobile(student.getMobile());
		existingStudent.setCourse(student.getCourse());
		// save updated student object
		studentService.updateStudent(existingStudent);
		return "redirect:/students";
	}

	// handler method to handle delete student request
//	http://localhost:8585/students-delete/4
	@ResponseBody
	@DeleteMapping("/students-delete/{id}")
	public Map<String, Object> deleteStudent(@PathVariable Long id) {
		Map<String, Object> returnMap = new HashMap<>();
		studentService.deleteStudentById(id);
		returnMap.put("status", "Success");
		return returnMap;
	}

////	@GetMapping("/students/refTree")
//	public String getRefTree(@PathVariable Long id) {
//		studentService.getRefTree(id);
//		return "redirect:/students";
//	}
}
