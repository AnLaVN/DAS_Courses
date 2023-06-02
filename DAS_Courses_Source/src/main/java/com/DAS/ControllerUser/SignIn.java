package com.DAS.ControllerUser;
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
		return "User/SignIn";
	}

	@PostMapping
	public String SignInPOST(Sinhvien sv, @RequestParam("rdoCheck") Optional<Boolean> isRem, Model model) {
		// Xử lí dữ liệu
		String  username = SHA256.Encrypt(sv.getUsername()),// Mã hoá username thành hash username
				password = SHA256.Encrypt(sv.getMatkhau());	// Mã hoá password thành hash password
		
		// Thông báo qua Log
		Log.add("SignInPOST - Try to sign in with username: " + username);
		
		// Kiểm tra sinhvien có khớp username và password trong csdl hay không
		if(sinhvienDAO.existsByUsernameAndMatkhau(username, password)) {
			if(isRem.orElse(false)) {	// Nếu sinhvien tích chọn ô remmber me?
				ALCookie.add("userSignInCookie", 			// Thêm cookie vào trình duyệt
							username + "~" + AES.Encrypt(	// Gồm hash username và mã hoá AES
								password, 					// của hash mật khẩu
								"DAS" + username),			// sử dụng key là "DAS" và hash username
							7*24);							// có thời hạn là 7 ngày
			}
			
			// Add seesion scope
			ALSession.setSession("userSV", sinhvienDAO.findById(username).get());
			
			// Thông báo qua Log
			Log.add("SignInPOST - Sign in successfully !");
			return "redirect:/";
		}
		
		// Nếu không khớp
		Log.add("SignInPOST - Can not sign in !!!");		// Thông báo qua Log
		model.addAttribute("Toast", true);					// Hiển thị thông báo lỗi
		return "User/SignIn";
	}

}