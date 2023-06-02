package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AnLa.FILE.Log;
import com.AnLa.HASH.SHA256;
import com.AnLa.NET.RandomORG;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALEmail;

@Controller
@RequestMapping("/ResetPass")
public class ResetPass {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	String OTP = "", email = "";
	
	@GetMapping
	public String ResetPassGET() {
		return "ResetPass";
	}
	
	@PostMapping
	public String ResetPassPOST(@RequestParam("txtOTP") String pOTP,@RequestParam("txtEmailRP") String pEmail, @RequestParam("txtCPassRP") String pPassword, Model model) {
		if(pEmail.equals(email) && pOTP.equals(OTP)) {
			Sinhvien sv = sinhvienDAO.findByEmail(email);
			sv.setMatkhau(SHA256.Encrypt(pPassword));
			sinhvienDAO.save(sv);
			Log.add("ResetPassPOST - Change password for " + sv.getUsername() + " successfully.");
			return "redirect:/SignIn";
		}else model.addAttribute("Toast", true);
		return "ResetPass";
	}
	
	@PostMapping("/SendEmail")
	public String ResetPassOTP(@RequestParam("email") String pEmail) {
		try {
			if(sinhvienDAO.existsByEmail(pEmail)) {
				email = pEmail;
				OTP = RandomORG.getString(8, true, true, true);
				String  text = "Chúng tôi đã nhận được yêu cầu thay đổi mật khẩu của bạn.<br>"
								+ "Nếu bạn không gửi yêu cầu này, xin vui lòng bỏ qua email này.<br><br>"
								+ "Nếu bạn tiếp tục nhận được yêu cầu thay đổi mật khẩu, <br>"
								+ "điều này đồng nghĩa với việc có ai đó đang cố gắng xâm nhập vào tài khoản của bạn.",
						content = ALEmail.HTMLTemplate
									.replaceFirst("USERNAME", ALEmail.getHTMLString(sinhvienDAO.findByEmail(email).getTen()))
									.replaceFirst("CONTENT", ALEmail.getHTMLString(text).replaceAll("&#60;&#98;&#114;&#62;", "<br>"))
									.replaceFirst("OTPCODE", OTP)
									.replaceFirst("WARNING", ALEmail.getHTMLString("Không chia sẻ mã này cho bất kì ai !"))
									.replaceFirst("THANK", ALEmail.getHTMLString("Trân trọng, đội ngũ DAS_Courses"));
				ALEmail.ZohoMail.setEmail("Yêu cầu thay đổi mật khẩu", content);
				ALEmail.ZohoMail.sendEmailTO(email);
				Log.add("ResetPassOTP - Send OTP code for user email: " + email);
			}
		} catch (IOException | MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
}