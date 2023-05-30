package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Courses")
public class Courses {
	
	@GetMapping
	public String CoursesGET() {
		return "Courses";
	}
	
}