package com.example.demo.connection;

import java.util.List;

public interface UserConnectionService {

	List<UserConnection> findChilds(String uniqueId);

	UserConnection findParent(String uniqueId);



}
