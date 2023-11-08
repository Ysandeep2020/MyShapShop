package com.example.demo.students;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

	private StudentRepository studentRepository;

	public StudentServiceImpl(StudentRepository studentRepository) {
		super();
		this.studentRepository = studentRepository;
	}

	@Override
	public List<Student> getAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public Student saveStudent(Student student) {
		// get linkPk
		Optional<Student> std = studentRepository.findByReferralCode(student.getLinkReferralCode());
		if (std.isPresent()) {
			student.setLinkId(std.get().getId());
		}
		student.setReferralCode(generateReferralCode());
		return studentRepository.save(student);
	}

	@Override
	public Student getStudentById(Long id) {
		return studentRepository.findById(id).get();
	}

	@Override
	public Student updateStudent(Student student) {
		return studentRepository.save(student);
	}

	@Override
	public void deleteStudentById(Long id) {
		studentRepository.deleteById(id);
	}

	private static String generateReferralCode() {
		final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		final int CODE_LENGTH = 8; // You can adjust the length as needed
		SecureRandom random = new SecureRandom();
		StringBuilder code = new StringBuilder(CODE_LENGTH);

		for (int i = 0; i < CODE_LENGTH; i++) {
			int randomIndex = random.nextInt(CHARACTERS.length());
			char randomChar = CHARACTERS.charAt(randomIndex);
			code.append(randomChar);
		}
		return code.toString();
	}

	@Override
	public boolean existsByLinkRefcode(String linkRefcode) {
		Map<Integer, List<Student>> map = new HashMap<>();
		int count = 1;
		long id = 1;
		// parent
		Optional<Student> std = studentRepository.findById(id);
		if (std.isPresent()) {
			long linkId = std.get().getLinkId();
			Optional<Student> parentopt = studentRepository.findById(linkId);
			if (parentopt.isPresent()) {
				String parent = parentopt.get().getFirstName();
			}
		}
		// child
		List<Student> findAllByLinkId = studentRepository.findAllByLinkId(id);
//		         sandeep
//		         
//		       govind      rakesh

		// check linkreferralcode
		return studentRepository.existsByReferralCode(linkRefcode);

	}

}
