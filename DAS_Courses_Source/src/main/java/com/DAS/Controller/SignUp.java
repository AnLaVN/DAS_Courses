package com.DAS.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.HASH.SHA256;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;

@Controller
@RequestMapping("/SignUp")
public class SignUp {
	@Autowired
	SinhvienDAO sinhvienDao;
	
	@GetMapping
	public String SignUpGET() {
		return "SignUp";
	}
	
	@PostMapping
	public String SignUpPOST(Sinhvien sv, Model model) {
		sv.setUsername(SHA256.Encrypt(sv.getUsername()));	// Hash username of Sinhvien
		boolean isExistsUsername = sinhvienDao.findById(sv.getUsername()).isPresent(),	// Find if exists username
				isExistsEmail = sinhvienDao.existsByEmail(sv.getEmail());				// Find if exists email
		if(!isExistsUsername && !isExistsEmail) {			// If Sinhvien doesn't have same username and email
			sv.setMatkhau(SHA256.Encrypt(sv.getMatkhau()));	// Hash password of Sinhvien
			sinhvienDao.save(sv);							// Save to database
			return "redirect:/";							// Redirect to Home page
		}
		model.addAttribute("Toast", true);					// Else display toast notification the error
		return "SignUp";
	}

}