package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Courses")
public class Courses {
	
	@GetMapping
	public String CoursesGET() {
		return "Courses";
	}
	
	@PostMapping
	public String CoursesPOST(@RequestParam("txtSearch") String search) {
		if(search.equals("getBackground()")) return "Background";
		return "Courses";
	}
	
}