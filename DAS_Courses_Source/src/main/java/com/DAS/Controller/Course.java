package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.PhanloaiDAO;
import com.DAS.Entity.Khoahoc;

@Controller
@RequestMapping("/Course")
public class Course {
	@Autowired
	KhoahocDAO khoahocDAO;
	@Autowired
	PhanloaiDAO phanloaiDAO;
	
	@GetMapping("/{id}")
	public String CourseGET(@PathVariable("id") String idkh, Model model) {
		model.addAttribute("Course", khoahocDAO.findById(idkh).orElse(new Khoahoc()));
		return "Course";
	}
	
	@PostMapping
	public String CoursePOST() {

		
		
		return "Courses";
	}
	
}