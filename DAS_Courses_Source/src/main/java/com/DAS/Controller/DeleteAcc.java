package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/DeleteAcc")
public class DeleteAcc {
	
	@PostMapping
	public String DeleteAccPOST() {
		
		
		return "redirect:/";
	}
	
	
}