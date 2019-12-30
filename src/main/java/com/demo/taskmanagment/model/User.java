package com.demo.taskmanagment.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
public class User {

	@Id
	@Email
	@NotEmpty
	@Column(unique=true)
	private String email;
	@NotEmpty
	private String name;
	@Size(min=4)
	private String password;
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<Task> taskList;
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(name="user_roles", 
		joinColumns= {
			@JoinColumn(name="user_email", referencedColumnName="email")
		}, inverseJoinColumns= {
				@JoinColumn(name="role_name", referencedColumnName="name")
		}
	)
	private List<Role> roles;
	
	public User() {}
	
	public User(String email, String name, String password, List<Task> taskList, List<Role> roleList) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.taskList = taskList;
		this.roles = roleList;
	}
	
	public User(String email, String name, String password) {
		this.email = email;
		this.name = name;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Task> getTaskList() {
		return taskList;
	}
	public void setTaskList(List<Task> taskList) {
		this.taskList = taskList;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roleList) {
		this.roles = roleList;
	}
	
	
}
