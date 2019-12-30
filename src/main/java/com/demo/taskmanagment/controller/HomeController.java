package com.demo.taskmanagment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value="/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/login") 
	public String showLogin() {
		
		return "views/login";  
	}
}
