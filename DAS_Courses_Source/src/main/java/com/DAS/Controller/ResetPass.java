package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AnLa.NET.RandomORG;
import com.DAS.DAO.SinhvienDAO;

@Controller
@RequestMapping("/ResetPass")
public class ResetPass {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping
	public String ResetPassGET() {
		return "ResetPass";
	}
	
	@PostMapping
	public String ResetPassPOST() {
		return "ResetPass";
	}
	
	@PostMapping("/SendEmail")
	public String ResetPassOTP(@RequestParam("email") String email) {
		try {
			String OTP = RandomORG.getString(8, true, true, true);
			boolean exists = sinhvienDAO.existsByEmail(email);
			System.out.println("Email: " + email + (exists ? "EXISTS" : "NOT EXISTS") + " in database. OTP: " + OTP);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
}