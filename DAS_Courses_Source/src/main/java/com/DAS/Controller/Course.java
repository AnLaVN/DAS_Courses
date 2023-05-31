package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.PhanloaiDAO;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/Course")
public class Course {
	@Autowired
	KhoahocDAO khoahocDAO;
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping("/{id}")
	public String CourseGET(@PathVariable("id") String idkh, Model model) {
		model.addAttribute("Course", khoahocDAO.findById(idkh).orElse(new Khoahoc()));
		return "Course";
	}
	
	@GetMapping("/{id}/join")
	public String CoursePOST(@PathVariable("id") String idkh, @RequestParam("idsv") String idsv) {
		boolean isJoinCourse = false;
		for(Khoahoc khoahoc : sinhvienDAO.findById(idsv).get().getKhoahocs()) {
			if(khoahoc.getIdkh().equals(idkh))  isJoinCourse = true;
		}
		System.out.println(idkh);
		
		
		return "Courses";
	}
	
}