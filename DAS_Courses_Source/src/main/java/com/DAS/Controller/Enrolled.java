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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AnLa.FILE.Log;
import com.DAS.DAO.KhoahocDAO;
import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/Enrolled")
public class Enrolled {
	@Autowired
	KhoahocDAO khoahocDAO;
	
	@GetMapping
	public String EnrolledGET(@RequestParam("page") Optional<Integer> pPage, Model model) {
		int currentPage = pPage.orElse(1);		// Tạo biến current page chứa chỉ số trang hiện tại, mặc định là 1
		Sinhvien currentSV = (Sinhvien) ALSession.getSession("userSV");				// Tạo biến current sinhvien chứa sinhvien hiện tại trong session
		Pageable pageable = PageRequest.of(currentPage - 1, 6);						// Tạo trang có 6 phần tử
		Page<Khoahoc> coursesPage = khoahocDAO.findBySinhviens(currentSV, pageable);// Tạo trang từ khoá học của sinh viên đã tham gia
		
		model.addAttribute("CoursesPage", coursesPage);
		model.addAttribute("CurrentPage", currentPage);
		
		Log.add("EnrolledGET - Get " + coursesPage.getTotalElements() + " courses enrolled of " + currentSV.getUsername());
		return "Courses";
	}
	
}