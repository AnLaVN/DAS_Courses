package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.FILE.Log;
import com.DAS.Tools.ALCookie;

@Controller
@RequestMapping("/SignOut")
public class SignOut {
	
	@RequestMapping
	public String SignOutREQ() {
		// Xử lí dữ liệu
		String cookie = ALCookie.get("userSignInCookie");
		ALCookie.remove("userSignInCookie");
		
		// Thông báo qua Log
		Log.add("SignOutREQ - Delete cookies of username: " + cookie.substring(0, cookie.indexOf("~")));
		return "redirect:/";
	}
}