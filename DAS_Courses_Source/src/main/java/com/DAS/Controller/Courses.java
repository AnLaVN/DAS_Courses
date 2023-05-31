package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.PhanloaiDAO;
import com.DAS.Entity.Khoahoc;

@Controller
@RequestMapping("/Courses")
public class Courses {
	@Autowired
	KhoahocDAO khoahocDAO;
	@Autowired
	PhanloaiDAO phanloaiDAO;
	
	@GetMapping
	public String CoursesGET(@RequestParam("page") Optional<Integer> pPage, @RequestParam("type") Optional<String> pType, Model model) {
		int currentPage = pPage.orElse(1);
		Pageable pageable = PageRequest.of(currentPage - 1, 6);
		Page<Khoahoc> coursesPage = null;
		
		if(pType.isEmpty()) coursesPage = khoahocDAO.findAll(pageable);
		else coursesPage = khoahocDAO.findByPhanloai(phanloaiDAO.findById(pType.get()).get(), pageable);
		
		model.addAttribute("CoursesPage", coursesPage);
		model.addAttribute("CurrentPage", currentPage);
		return "Courses";
	}
	
	@PostMapping
	public String CoursesPOST(@RequestParam("txtSearch") String search) {
		if(search.equals("getBackground()")) return "Background";	// Easter Egg Background
		
		
		return "Courses";
	}
	
}