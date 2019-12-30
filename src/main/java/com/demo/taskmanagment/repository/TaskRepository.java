package com.demo.taskmanagment.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.taskmanagment.model.Task;
import com.demo.taskmanagment.model.User;


public interface TaskRepository extends JpaRepository<Task, Long>{

	public List<Task> findByUser(User user);
	
	@Query("SELECT t FROM Task t WHERE t.completed = :COMPLETED") 
	public List<Task> findAllNotCompleted(@Param("COMPLETED") Boolean completed);
}
//https://docs.spring.io/spring-data/jpa/docs/2.2.x/reference/html/#repositories.query-methods.details  -- keywords