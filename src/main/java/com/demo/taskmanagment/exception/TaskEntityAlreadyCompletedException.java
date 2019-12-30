package com.demo.taskmanagment.exception;

public class TaskEntityAlreadyCompletedException extends RuntimeException{

	public TaskEntityAlreadyCompletedException(String message) {
		super(message);
	}
	
	public TaskEntityAlreadyCompletedException(String message, Throwable err) {
		super(message, err);
	}
}
