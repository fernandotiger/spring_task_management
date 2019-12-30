package com.demo.taskmanagment.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.taskmanagment.model.AjaxResponse;
import com.demo.taskmanagment.model.User;
import com.demo.taskmanagment.service.UserService;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/userList")
	public String listUsers(Model model, @RequestParam(defaultValue="") String name) {
		model.addAttribute("userList", userService.findByName(name));
		return "views/userList";
	}
	
	@GetMapping("/userDetails")
	public AjaxResponse userDetails(Principal principal) {
		AjaxResponse response = new AjaxResponse();
		String email = principal.getName();
		User user = userService.findByEmail(email);
		response.getData().put("user", user);
		response.setSuccess(true);
		return response;
	}
	
}
