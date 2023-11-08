package com.example.demo.students;

import java.util.List;

public interface StudentService {
	List<Student> getAllStudents();
	
	Student saveStudent(Student student);
	
	Student getStudentById(Long id);
	
	Student updateStudent(Student student);
	
	void deleteStudentById(Long id);

	public boolean existsByLinkRefcode(String linkRefcode);	
	
}
