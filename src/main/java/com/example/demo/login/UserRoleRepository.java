package com.example.demo.login;

import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRoleRepository extends JpaRepository<UserRole, Long> {
	@Query(nativeQuery = true, value = "select user_master.id as user_master_id,\r\n"
			+ "           user_master.first_name,\r\n"
			+ "             user_master.email,\r\n"
			+ "            user_master.status,\r\n"
			+ "           user_login.username,\r\n"
			+ "            user_login.id as user_login_id \r\n"
			+ "             from user_master \r\n"
			+ "            inner join user_login on user_master.email  = user_login.username \r\n"
			+ "            where user_login.username =:email")
    Map<String, Object> getBasicInformation(String email);

}
