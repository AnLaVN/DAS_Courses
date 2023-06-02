package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.DAS.DAO.PhanloaiDAO;
import com.DAS.Entity.Phanloai;

@ControllerAdvice
public class AllPage {
	@Autowired
	PhanloaiDAO phanloaiDAO;
	
	@ModelAttribute("listPhanloai")
	public List<Phanloai> getListPhanloai(){
		return phanloaiDAO.findAll();
	}
}