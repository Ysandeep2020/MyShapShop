package com.example.demo.securityConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.login.UserLogin;
import com.example.demo.login.UserLoginRepository;

@Service
public class LoginUserDetailsService implements UserDetailsService {

	@Autowired
	private UserLoginRepository userLoginRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		UserLogin user = userLoginRepository.findByUsername(username);
		System.out.println(" Username :: "+username);
		System.out.println("User "+user);
		if(user==null) {
			throw new UsernameNotFoundException("Invalid Username or password");
		}
		return user;
	}

}
