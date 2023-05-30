package com.DAS.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.FILE.Log;
import com.AnLa.HASH.AES;
import com.AnLa.HASH.SHA256;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALCookie;

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
		Log.add("SignUpPOST - Try to sign up with username: " + sv.getUsername());		// Log info 
		
		// Check is Sinhvien exists in database
		boolean isExistsUsername = sinhvienDao.findById(sv.getUsername()).isPresent(),	// Find if exists username
				isExistsEmail = sinhvienDao.existsByEmail(sv.getEmail());				// Find if exists email
		
		
		// If Sinhvien doesn't have same username and email
		if(!isExistsUsername && !isExistsEmail) {
			sv.setMatkhau(SHA256.Encrypt(sv.getMatkhau()));	// Hash password of Sinhvien
			sinhvienDao.save(sv);							// Save to database
			ALCookie.add("userSignInCookie", 				// Add cookie for client
					sv.getUsername() + "~" + AES.Encrypt(	// Add string of hash username and AES encrypt of
							sv.getMatkhau(), 				// hash password
							"DAS"+sv.getUsername()),		// with key is "DAS" add string with hash username
					7*24);									// live in 7 day
			Log.add("SignUpPOST - Sign up successfully !");	// Log info
			return "redirect:/";							// Redirect to Home page
		}
		
		
		// Else
		Log.add("SignUpPOST - Can not sign up !!!");		// Log info
		model.addAttribute("Toast", true);					// Display toast notification the error
		return "SignUp";
	}

}