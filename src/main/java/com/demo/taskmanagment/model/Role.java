package com.demo.taskmanagment.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Role {

	@Id
	private String name;
	
	@ManyToMany(mappedBy="roles")
	private List<User> userList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public Role() {}
	
	public Role(String name) {
		this.name = name;
	}
	
	public Role(String name, List<User> userList) {
		super();
		this.name = name;
		this.userList = userList;
	}
	
	
	
}
