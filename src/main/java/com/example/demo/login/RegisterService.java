package com.example.demo.login;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RegisterService {

	public Map<String, Object> saveUserRegister(LoginDto dto);

	public List<UserMaster> getAllUsers();

	UserMaster getUserById(Long id);

	public String updatePan(HttpServletRequest request, Long id);

	public String updateGst(HttpServletRequest request, Long id);

	public String updateBasicDetails(LoginDto loginDto, Long id);

	public UserMaster getUserByEmail(String name);

	UserMaster getUserByUniqueId(String uid);

	public Map<String, Object> existByUniqueId(String uniqueId);
}