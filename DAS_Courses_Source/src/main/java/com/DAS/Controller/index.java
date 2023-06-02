package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.HASH.AES;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALCookie;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/")
public class index {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping
	public String indexGET() {
		String  cookie = ALCookie.get("userSignInCookie");
		int iX = cookie.indexOf("~");
		String	hashUsername = cookie.substring(0, iX),
				hashPassword = AES.Decrypt(cookie.substring(iX + 1), "DAS"+hashUsername);
		
		
		// Check is Sinhvien exists in database
		boolean isVaild = sinhvienDAO.existsByUsernameAndMatkhau(hashUsername, hashPassword);
		
		if(isVaild) {
			// Add seesion scope
			ALSession.setSession("userSV", sinhvienDAO.findById(hashUsername).orElse(new Sinhvien()));
		}
		
		return "index";
	}

}