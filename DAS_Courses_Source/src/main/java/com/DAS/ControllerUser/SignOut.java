package com.DAS.ControllerUser;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.FILE.Log;
import com.DAS.Tools.ALCookie;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/SignOut")
public class SignOut {
	
	@RequestMapping
	public String SignOutREQ() {
		// Xử lí dữ liệu
		String cookie = ALCookie.get("userSignInCookie");
		if(cookie != null) {
			ALCookie.remove("userSignInCookie");	// Xoá sữ liệu cookie
			ALSession.removeSession("userSV");		// Xoá dữ liệu session
			
			// Thông báo qua Log
			Log.add("SignOutREQ - Delete cookies of username: " + cookie.substring(0, cookie.indexOf("~")));
		}
		return "redirect:/";
	}
}