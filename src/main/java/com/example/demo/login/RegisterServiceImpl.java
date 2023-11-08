package com.example.demo.login;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.connection.UserConnection;
import com.example.demo.connection.UserConnectionRepository;
import com.example.demo.location.District;
import com.example.demo.location.DistrictService;
import com.example.demo.location.State;
import com.example.demo.location.StateRepository;
import com.example.demo.location.StateService;

@Service
public class RegisterServiceImpl implements RegisterService {
	@Autowired
	RegisterRepository registerRepository;

	@Autowired
	UserLoginRepository loginRepository;

	@Autowired
	UserConnectionRepository connectionRepository;
	@Autowired
	StateService stateService;
	@Autowired
	DistrictService districtService;

	@Transactional
	@Override
	public Map<String, Object> saveUserRegister(LoginDto dto) {
		Map<String, Object> returnMap = new HashMap<>();
		int status = StringUtils.isNotBlank(dto.getStatus()) ? Integer.parseInt(dto.getStatus()) : 0;
		// log.info("Register data -> {}", dto.toString());
		Timestamp ts = new Timestamp(new Date().getTime());
		UserMaster user = new UserMaster();
		user.setName(dto.getName());
		user.setMobile(dto.getMobile());
		user.setEmail(dto.getUsername());
		user.setCountry(dto.getCountry());
		user.setUniqueId(dto.getUniqueId());
		if (StringUtils.isNoneBlank(dto.getAddress1())) {
			user.setAddress1(dto.getAddress1());
		}
		if (StringUtils.isNoneBlank(dto.getAddress2())) {
			user.setAddress2(dto.getAddress2());
		}
		if (StringUtils.isNoneBlank(dto.getCity())) {
			user.setCity(dto.getCity());
		}
		if (StringUtils.isNoneBlank(dto.getPincode())) {
			user.setPincode(dto.getPincode());
		}
		if (StringUtils.isNoneBlank(dto.getState())) {
			user.setStateId(Long.parseLong(dto.getState()));
			State state = stateService.findById(Long.parseLong(dto.getState()));
			user.setState(state.getName());
		}
		if (StringUtils.isNoneBlank(dto.getDistrict())) {
			user.setDistrictId(Long.parseLong(dto.getDistrict()));
			District dist = districtService.findById(Long.parseLong(dto.getDistrict()));
			user.setDistrict(dist.getName());
		}
		user.setStatus(1);
		UserMaster user1 = registerRepository.findByEmail(user.getEmail());

		if (user1 != null) {
			returnMap.put("status", "error");
			returnMap.put("message", "Email is already registered!");
			return returnMap;
		}
		boolean existsByUniqueId = registerRepository.existsByUniqueId(dto.getUniqueId());
		if (existsByUniqueId) {
			returnMap.put("status", "error");
			returnMap.put("message", "Unique Id is already registered!");
			return returnMap;
		}

		user1 = registerRepository.save(user);

		UserLogin userLogin = new UserLogin();
		userLogin.setUsername(dto.getUsername());
		userLogin.setUserMasterId(user1.getId());
		/// userLogin.setPassword(dto.getPassword());
		userLogin.setLoginEnabled(true);
		userLogin.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));

		userLogin = loginRepository.save(userLogin);

		// make connection

		UserConnection userConn = new UserConnection();

		userConn.setChildId(dto.getUniqueId());
		userConn.setParentId(dto.getRefId() != null ? dto.getRefId() : null);
		// manage level

		if (dto.getRefId() != null && dto.getRefId() != "") {
			int level = connectionRepository.getLevelByChildId(dto.getRefId());
			// int newLevel = level != -1 ? level + 1 : level+2;
			userConn.setLevel(level + 1);
		} else {
			userConn.setLevel(0);
		}

		connectionRepository.save(userConn);
		// if(connectionisExist)
//			userConn.setLevel(0);
//			userConn.setChildId(dto.getUniqueId());
//			userConn.setParentId(dto.getRefId());

		/*
		 * code for designation default role access start UserRolesMapping
		 * userRoleMapping = null; String rolePks = dto.getVerificationCode(); String
		 * rolePksArr[] = null; long existingRoleMapPk = 0; long rolePkLong = 0; if
		 * (rolePks != null && rolePks.length() > 0) { for (String rolePk :
		 * rolePks.split(",")) { rolePkLong = Long.parseLong(rolePk); existingRoleMapPk
		 * = userRolesMappingRepository.getDuplicateRoleUser(rolePkLong,
		 * userLogin.getId()); if (existingRoleMapPk == 0) { userRoleMapping = new
		 * UserRolesMapping(); userRoleMapping.setUserLoginId(userLogin.getId());
		 * userRoleMapping.setUserRoleId(rolePkLong);
		 * userRolesMappingRepository.save(userRoleMapping); } } } code for designation
		 * default role access end code for default role access by default start
		 * List<UserRole> userRoleList = roleRepository.getDefaultRoleList(); if
		 * (userRoleList != null && userRoleList.size() > 0) { for (UserRole role :
		 * userRoleList) { rolePkLong = role.getId(); existingRoleMapPk =
		 * userRolesMappingRepository.getDuplicateRoleUser(rolePkLong,
		 * userLogin.getId()); if (existingRoleMapPk == 0) { userRoleMapping = new
		 * UserRolesMapping(); userRoleMapping.setUserLoginId(userLogin.getId());
		 * userRoleMapping.setUserRoleId(rolePkLong);
		 * userRolesMappingRepository.save(userRoleMapping); } } }
		 * 
		 * code for default role access by default end code for default company access
		 * by default start
		 * 
		 * List<Company> defaultCompanyList = companyRepository.findDefaultCompany();
		 * int existingCount = 0; UserCompanyAccess userCompanyAccess = null;
		 * if(defaultCompanyList!=null && defaultCompanyList.size()>0) { for(Company
		 * company: defaultCompanyList) { existingCount =
		 * userCompanyAccessRepository.getDuplicateCheckAccess(rolePkLong,
		 * userLogin.getPk()); if(existingCount==0) { userCompanyAccess = new
		 * UserCompanyAccess(); userCompanyAccess.setUserLoginPk(userLogin.getPk());
		 * userCompanyAccess.setCompanyMasterPk(company.getPk());
		 * userCompanyAccess.setCreatedBy(dto.getCreatedBy());
		 * userCompanyAccess.setCreatedDate(ts);
		 * userCompanyAccessRepository.save(userCompanyAccess); } } }
		 * 
		 */ /* code for default company access by default end */
		returnMap.put("status", "success");
		returnMap.put("message", "User added successfully");

		return returnMap;
	}

	@Override
	public List<UserMaster> getAllUsers() {
		return registerRepository.findAll();
	}

	@Override
	public UserMaster getUserById(Long id) {
		return registerRepository.findById(id).get();
	}

	@Override
	public String updatePan(HttpServletRequest request, Long id) {
		String panNumber = request.getParameter("pan");
		UserMaster user = registerRepository.findById(id).get();
		user.setPanNumber(panNumber);
		registerRepository.save(user);
		return "yes";
	}

	@Override
	public String updateGst(HttpServletRequest request, Long id) {
		String gstNumber = request.getParameter("gst");
		UserMaster user = registerRepository.findById(id).get();
		user.setGstNumber(gstNumber);
		registerRepository.save(user);
		return "yes";
	}

	@Override
	public String updateBasicDetails(LoginDto dto, Long id) {
		UserMaster user = registerRepository.findById(id).get();
		if (StringUtils.isNoneBlank(dto.getUsername())) {
			user.setEmail(dto.getUsername());
		}
		if (StringUtils.isNoneBlank(dto.getName())) {
			user.setName(dto.getName());
		}
		if (StringUtils.isNoneBlank(dto.getAddress1())) {
			user.setAddress1(dto.getAddress1());
		}
		if (StringUtils.isNoneBlank(dto.getAddress2())) {
			user.setAddress2(dto.getAddress2());
		}
		if (StringUtils.isNoneBlank(dto.getCity())) {
			user.setCity(dto.getCity());
		}
		if (StringUtils.isNoneBlank(dto.getPincode())) {
			user.setPincode(dto.getPincode());
		}
		if (StringUtils.isNoneBlank(dto.getState())) {
			user.setStateId(Long.parseLong(dto.getState()));
			State state = stateService.findById(Long.parseLong(dto.getState()));
			user.setState(state.getName());
		}
		if (StringUtils.isNoneBlank(dto.getDistrict())) {
			user.setDistrictId(Long.parseLong(dto.getDistrict()));
			District dist = districtService.findById(Long.parseLong(dto.getDistrict()));
			user.setDistrict(dist.getName());
		}
		registerRepository.save(user);
		return "Yes";
	}

	@Override
	public UserMaster getUserByEmail(String email) {
		return registerRepository.findByEmail(email);
	}

	@Override
	public UserMaster getUserByUniqueId(String uid) {
		return registerRepository.findByUniqueId(uid);
	}

	@Override
	public Map<String, Object> existByUniqueId(String uniqueId) {
		Map<String, Object> returnMap = new HashMap<>();

		if (uniqueId.length() < 6) {
			returnMap.put("status", "error");
			return returnMap;
		}
		boolean flag = registerRepository.existsByUniqueId(uniqueId);
		if (flag) {
			returnMap.put("status", "error");
			return returnMap;
		} else {
			returnMap.put("status", "success");
			return returnMap;
		}
	}

}
