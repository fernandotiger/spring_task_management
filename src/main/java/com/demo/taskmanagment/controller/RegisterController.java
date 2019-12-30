package com.demo.taskmanagment.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.demo.taskmanagment.model.User;
import com.demo.taskmanagment.service.UserService;



@Controller
public class RegisterController {

	@Autowired
	private UserService userService;
	
	@GetMapping(value="/register")
	public String registerForm(Model model) {
		model.addAttribute("user",new User());
		return "views/register";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@Valid @ModelAttribute("user") User user,BindingResult bindingResult , Model model) {
		if(bindingResult.hasErrors()) {
			System.out.println("redirecting error 1 "+bindingResult.toString());
			return "views/register";
		}
		if(userService.isUserDuplicated(user)) {
			model.addAttribute("userExist", true);
			return "views/register";
		}
		userService.createUser(user);
		model.addAttribute("user",new User());
		model.addAttribute("success",true);
		return "views/register";
	}
}
