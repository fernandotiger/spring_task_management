package com.demo.taskmanagment.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Task {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@NotEmpty
	private String startTime;
	@NotEmpty
	private String stopTime;
	@NotEmpty
	private String description;
	@Transient
	private String formatedDate;
	
	private String completionComment;
	
	private boolean completed = false;
	
	@ManyToOne
	@JoinColumn(name="user_email")
	private User user;
	
	public Task() {
		completed = false;
	}
	
	public Task(Date date, String startTime, String stopTime, String description) {
		super();
		this.date = date;
		this.startTime = startTime;
		this.stopTime = stopTime;
		this.description = description;
		completed = false;
	}



	public Task(Date date, String startTime, String stopTime, String description, User user) {
		super();
		this.date = date;
		this.startTime = startTime;
		this.stopTime = stopTime;
		this.description = description;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStopTime() {
		return stopTime;
	}

	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public String getCompletionComment() {
		return completionComment;
	}

	public void setCompletionComment(String completionComment) {
		this.completionComment = completionComment;
	}

	public String getFormatedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(date);
	}

	public void setFormatedDate(String formatedDate) {
		this.formatedDate = formatedDate;
	}
	
	
}
