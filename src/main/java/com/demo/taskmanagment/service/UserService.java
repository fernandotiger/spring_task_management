package com.demo.taskmanagment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demo.taskmanagment.model.Role;
import com.demo.taskmanagment.model.User;
import com.demo.taskmanagment.repository.UserRepository;



@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	public void createUser(User user) {
		BCryptPasswordEncoder  encoder = new  BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		Role userRole = new Role("USER");
		List<Role> roleList = new ArrayList<>();
		roleList.add(userRole);
		user.setRoles(roleList);
		userRepository.save(user);
	}
	public void createAdmin(User user) {
		Role userRole = new Role("ADMIN");
		List<Role> roleList = new ArrayList<>();
		roleList.add(userRole);
		user.setRoles(roleList);
		userRepository.save(user);
	}
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	public boolean isUserDuplicated(User user) {
		if( userRepository.findByEmail(user.getEmail()) != null) {
			return true;
		}
		return false;
	}
	public List<User> findAll() {
		return userRepository.findAll();
	}
	public List<User> findByName(String name) {
		return userRepository.findByNameLike("%"+name+"%");
	}
}
