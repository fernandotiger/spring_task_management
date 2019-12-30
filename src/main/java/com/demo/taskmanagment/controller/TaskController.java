package com.demo.taskmanagment.controller;

import java.security.Principal;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.taskmanagment.model.Task;
import com.demo.taskmanagment.model.User;
import com.demo.taskmanagment.service.TaskService;
import com.demo.taskmanagment.service.UserService;



@Controller
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/taskForm")
	public String addTask(@RequestParam(required = false) Integer taskId, 
							@RequestParam(required = false) String email, Model model, HttpSession session) {
		session.setAttribute("email", email);
		Task task = null;
		if(Objects.nonNull(taskId)) {
			task = taskService.find(Long.parseLong(taskId.toString()));
		}else {
			task = new Task();
		}
		model.addAttribute("task", task);
		return "views/addTask";
	}
	
	@PostMapping("/addTask")
	public String addTask(@Valid @ModelAttribute("task") Task task, BindingResult bindingResult , Model model, HttpSession session) {
		if(bindingResult.hasErrors()) {
			return "views/addTask";
		}
		Long id = task.getId();
		String email = (String)session.getAttribute("email");
		taskService.addTask(task, userService.findByEmail(email));
		task.setId(id);
		model.addAttribute("task", task);
		model.addAttribute("success", true);
		return "views/addTask";
	}
	@GetMapping("/completeTaskForm")
	public String completeTaskForm(@RequestParam(name="taskId") Long taskId, Model model) {
		Task task = taskService.find(taskId);
		model.addAttribute(task);
		return  "views/completeTaskForm";
	}
	@PostMapping("/completeTask")
	public String completeTask(Task task,BindingResult result, Model model) {
		
		taskService.completeTask(task);
		return  "redirect:/myTasks";
	}
	@GetMapping(value="/myTasks")
	public String myTasks(Model model, HttpServletRequest request, Principal principal) {
		String email = principal.getName();
		User user = userService.findByEmail(email);
		model.addAttribute("user", user);
		model.addAttribute("tasks", taskService.findUserTask(user));
		System.out.println("connectedUser: "+request.getSession().getAttribute( "connectedUser"));
		return "views/myTasks";
	}
	@GetMapping(value="/allTasks")
	public String allTasks(Model model, HttpServletRequest request) {
		model.addAttribute("tasks", taskService.findAllNotCompleted());
		return "views/allTasks";
	}
	@GetMapping("/deleteTask")
	public String addTask(@RequestParam(name="taskId") Long taskId) {
		taskService.deleteTask(taskId);
		return "redirect:/allTasks";
	}
}
