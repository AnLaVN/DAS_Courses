package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.DAS.Entity.Sinhvien;

@Controller
@RequestMapping("/MyAcc")
public class MyAcc {
	
	@GetMapping
	public String MyAccGET(Model model) {
		model.addAttribute("user", model);
		return "MyAcc";
	}
	
	@PostMapping
	public String MyAccPOST(Sinhvien sv) {
		
		
		return "redirect:/MyAcc";
	}
	
}