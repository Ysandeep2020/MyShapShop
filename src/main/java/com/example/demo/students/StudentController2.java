package com.example.demo.students;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class StudentController2 {

	private StudentService studentService;

	public StudentController2(StudentService studentService) {
		super();
		this.studentService = studentService;
	}

	@GetMapping("/checkLinkReferralCode")
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
	public List<Student> listStudents(Model model) {
		return studentService.getAllStudents();

	}

	@GetMapping("/students/new")
	public String createStudentForm(Model model) {
		// create student object to hold student form data
		Student student = new Student();
		model.addAttribute("student", student);
		return "student created";

	}

	@PostMapping("/students")
	public String saveStudent(@ModelAttribute Student student, Model model) {
//		Student studentOut = studentService.saveStudent(student);
		Student studentOut =null;
		if (studentOut != null) {
			return "redirect:/index";
		} else {
			model.addAttribute("message", "Referral code is Incorrect");
			return "student updated";
		}
	}

	@GetMapping("/students/edit/{id}")
	public String editStudentForm(@PathVariable Long id, Model model) {
		model.addAttribute("student", studentService.getStudentById(id));
		return "edit_student";
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
		return "updated";
	}

	// handler method to handle delete student request

	@GetMapping("/students/{id}")
	public String deleteStudent(@PathVariable Long id) {
		studentService.deleteStudentById(id);
		return "deleted";
	}

////	@GetMapping("/students/refTree")
//	public String getRefTree(@PathVariable Long id) {
//		studentService.getRefTree(id);
//		return "redirect:/students";
//	}
}
