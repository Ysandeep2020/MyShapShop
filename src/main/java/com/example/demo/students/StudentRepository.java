package com.example.demo.students;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {

	boolean existsByReferralCode(String referralCode);

	Optional<Student> findByReferralCode(String linkReferralCode);

	List<Student> findAllByLinkId(Long id);

}
