package com.DAS.ControllerUser;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class index {
	
	@GetMapping
	public String indexGET() {
		return "User/index";
	}

}