package com.example.demo.connection;

import java.util.List;

import com.example.demo.login.UserMaster;

import lombok.Data;

@Data
public class UserAndChildsResponse {

	UserMaster user;
	List<UserConnection> userConnections;
	UserConnection userConnection;
}
