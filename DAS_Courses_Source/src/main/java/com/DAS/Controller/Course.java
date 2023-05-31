package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.DAO.TainguyenDAO;
import com.DAS.Entity.Khoahoc;

@Controller
@RequestMapping("/Course")
public class Course {
	@Autowired
	KhoahocDAO khoahocDAO;
	@Autowired
	SinhvienDAO sinhvienDAO;
	@Autowired
	TainguyenDAO tainguyenDAO;
	
	@GetMapping("/{idkh}")
	public String CourseGET(@PathVariable("idkh") String idkh, Model model) {
		model.addAttribute("Course", khoahocDAO.findById(idkh).get());
		return "Course";
	}
	
	@GetMapping("/{idkh}/join")
	public String Course(@PathVariable("idkh") String idkh, @RequestParam("idsv") String idsv) {
		boolean ixExists = sinhvienDAO.isExistsSV_KH(idsv, idkh);
		if(ixExists) return "redirect:/";
		
		System.out.println(idkh);
		
		
		return "Courses";
	}
	
	@GetMapping("/{idkh}/Material")
	public String MaterialGET(@PathVariable("idkh") String idkh, @RequestParam("idtn") Optional<String> idtn, Model model) {
		Khoahoc khoahoc = khoahocDAO.findById(idkh).get();
		String currTN = idtn.orElse(khoahoc.getTainguyens().get(0).getIdtn());
		khoahoc.getTainguyens().forEach((tainguyen) -> {
			if(tainguyen.getIdtn().equals(currTN)) model.addAttribute("Tainguyen", tainguyen);
		});
		model.addAttribute("Khoahoc", khoahoc);
		return "CourseMaterial";
	}
}