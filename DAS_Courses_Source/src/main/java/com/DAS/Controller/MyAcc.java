package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.AnLa.FILE.Log;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALParam;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/MyAcc")
public class MyAcc {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping
	public String MyAccGET() {
		return "MyAcc";
	}
	
	@PostMapping
	public String MyAccPOST(Sinhvien sv, @RequestParam("picAvatar") MultipartFile avatar) {
		Sinhvien currSV = (Sinhvien) ALSession.getSession("userSV");
		Log.add("MyAccPOST - Try to update account with username: " + sv.getUsername());		// Log info 
		
		// Save avatar of Sinhvien
		try {
			ALParam.saveFile(avatar, "/Image/UsersAvatar/", sv.getUsername()+".png");
		} catch (IllegalStateException | IOException e) {
			Log.add("MyAccPOST - Exception when try to save file from client !!!\n\t\tError code: " + e.toString());
		}
		
		currSV.setTen(sv.getTen());								// Update ten of Sinhvien
		sinhvienDAO.save(currSV);								// Save Sinhvien info
		Log.add("MyAccPOST - Update account successfully !");	// Log info
		return "redirect:/MyAcc";
	}
	
}