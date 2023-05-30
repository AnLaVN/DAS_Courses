package com.DAS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.HASH.SHA256;
import com.DAS.AnLa.DAO.AdminDAO;
import com.DAS.AnLa.Entity.Admin;

@Controller
public class test {
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping("/test")
	public String test() {
		System.out.println(adminDAO.count());
		return "test";
	}
}
