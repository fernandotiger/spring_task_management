package com.demo.taskmanagment.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.taskmanagment.model.User;


public interface UserRepository extends JpaRepository<User, String> {

	public User findByEmail(String email);

	public List<User> findByNameLike(String name);
}
