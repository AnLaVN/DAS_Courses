package com.DAS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.HASH.SHA256;
import com.DAS.DAO.AdminDAO;
import com.DAS.Entity.Admin;

@Controller
public class test {
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping("/test")
	public String test() {
		String  username = SHA256.Encrypt("BinhAn2003"), 
				password = SHA256.Encrypt("Admin@123"), 
				name = "Bình An",
				email = "anldbps21776@fpt.edu.vn";
		adminDAO.save(new Admin(username, password, name, email));
		return "test";
	}
}
