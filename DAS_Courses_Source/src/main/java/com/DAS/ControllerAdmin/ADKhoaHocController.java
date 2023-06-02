package com.DAS.ControllerAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.PhanloaiDAO;
import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Phanloai;

@Controller
public class ADKhoaHocController {
	@Autowired
	KhoahocDAO khoahocDAO;
	
	@Autowired
	PhanloaiDAO phanloaiDAO;
	
	@RequestMapping("/admin/khoahoc")
	public String khoaHoc(Model model) {
		List<Khoahoc> listKhoaHoc =	khoahocDAO.findAll();
		model.addAttribute("listKhoaHoc",listKhoaHoc);
		model.addAttribute("view","Module/ADKhoaHoc.jsp");
		return "/Admin/indexAdmin";
	}
	
	@GetMapping("/admin/khoahoc/{idkh}")
	public String CTkhoaHoc(Model model,@PathVariable("idkh") String idkh) {
		Khoahoc khoahoc = khoahocDAO.findByIdkh(idkh);
		List<Khoahoc> listKhoaHoc =	khoahocDAO.findAll();
		model.addAttribute("listKhoaHoc",listKhoaHoc);
		model.addAttribute("khoaHoc",khoahoc);
		model.addAttribute("view","Module/ADCTKhoaHoc.jsp");
		return "/Admin/indexAdmin";
	}
	
	//lấy  phân loại để fill vào combobox CT khóa học
	@ModelAttribute(name = "listPhanLoai")
	public List<Phanloai> getPhanLoai(){
		return phanloaiDAO.findAll();
	}

}	
