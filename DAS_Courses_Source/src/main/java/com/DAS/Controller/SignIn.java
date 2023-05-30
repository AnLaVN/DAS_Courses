package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AnLa.FILE.Log;
import com.AnLa.HASH.AES;
import com.AnLa.HASH.SHA256;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALCookie;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/SignIn")
public class SignIn {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping
	public String SignInGET() {
		return "SignIn";
	}

	@PostMapping
	public String SignInPOST(Sinhvien sv, @RequestParam("rdoCheck") Optional<Boolean> isRem, Model model) {
		sv.setUsername(SHA256.Encrypt(sv.getUsername()));	// Hash username os Sinhvien
		sv.setMatkhau(SHA256.Encrypt(sv.getMatkhau()));		// Hash password of Sinhvien
		Log.add("SignInPOST - Try to sign in with username: " + sv.getUsername());		// Log info 
		
		// Check is Sinhvien exists in database
		boolean isVaild = sinhvienDAO.existsByUsernameAndMatkhau(sv.getUsername(), sv.getMatkhau());
		
		
		// If Sinhvien match username and password
		if(isVaild) {
			// If client click remmber radio
			if(isRem.orElse(false)) {
				ALCookie.add("userSignInCookie", 				// Add cookie for client
						sv.getUsername() + "~" + AES.Encrypt(	// Add string of hash username and AES encrypt of
								sv.getMatkhau(), 				// hash password
								"DAS"+sv.getUsername()),		// with key is "DAS" add string with hash username
						7*24);									// live in 7 day if client check remmber, else is none
				// Add seesion scope
				ALSession.setSession("userSV", sinhvienDAO.findById(sv.getUsername()).orElse(new Sinhvien()));
			}
			Log.add("SignInPOST - Sign in successfully !");	// Log info
			return "redirect:/";							// Redirect to Home page
		}
		
		
		// Else
		Log.add("SignInPOST - Can not sign in !!!");		// Log info
		model.addAttribute("Toast", true);					// Display toast notification the error
		return "SignIn";
	}

}