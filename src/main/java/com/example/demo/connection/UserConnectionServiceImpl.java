package com.example.demo.connection;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.login.UserMaster;

@Service
public class UserConnectionServiceImpl implements UserConnectionService {

	@Autowired
	private UserConnectionRepository connectionRepository;
	@Override
	public List<UserConnection> findChilds(String uniqueId) {
		return connectionRepository.findAllByParentId(uniqueId);

	}
	@Override
	public UserConnection findParent(String childId) {
		// TODO Auto-generated method stub
		return connectionRepository.findByChildId(childId);
	}

}
