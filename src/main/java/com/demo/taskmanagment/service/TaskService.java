package com.demo.taskmanagment.service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.demo.taskmanagment.exception.TaskEntityAlreadyCompletedException;
import com.demo.taskmanagment.model.Task;
import com.demo.taskmanagment.model.User;
import com.demo.taskmanagment.repository.TaskRepository;



@Service
public class TaskService {

	@Autowired
	private TaskRepository taskRepository;
	
	public void addTask(Task task, User user) {
		if(Objects.isNull(task.getId())) {
			task.setUser(user);
		}
		taskRepository.save(task);
	}
	public List<Task> findUserTask(User user) {
		return taskRepository.findByUser(user);
	}
	public Task find(Long id) {
		return taskRepository.getOne(id);
	}
	
	public List<Task> findAllNotCompleted() {
		return taskRepository.findAllNotCompleted(Boolean.FALSE);
	}
	
	public boolean completeTask(Task taskObj) {
		Task task =  taskRepository.findById(taskObj.getId()).get();
		task.setCompleted(true);
		task.setCompletionComment(taskObj.getCompletionComment());
		taskRepository.save(task);
		return true;
	}
	
	public void deleteTask(Long taskId) {
		Optional<Task> optional = taskRepository.findById(taskId);
		if(optional.isPresent()) {
			Task task = optional.get();
			if(task.isCompleted()) {
				throw new TaskEntityAlreadyCompletedException("Can not delete completed Task");
			}
			taskRepository.deleteById(task.getId());
		}
		
	}
}
