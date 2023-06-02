package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AnLa.NET.RandomORG;
import com.DAS.DASCourseApplication;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALEmail;

@Controller
@RequestMapping("/ResetPass")
public class ResetPass {
	@Autowired
	SinhvienDAO sinhvienDAO;
	
	@GetMapping
	public String ResetPassGET() {
		return "ResetPass";
	}
	
	@PostMapping
	public String ResetPassPOST() {
		return "ResetPass";
	}
	
	@PostMapping("/SendEmail")
	public String ResetPassOTP(@RequestParam("email") String email) {
		try {
			boolean exists = sinhvienDAO.existsByEmail(email);
			if(exists) {
				Sinhvien sv = sinhvienDAO.findByEmail(email);
				String  OTP = RandomORG.getString(8, true, true, true),
						text = "Chúng tôi đã nhận được yêu cầu thay đổi mật khẩu của bạn!<br>\r\n"
								+ "			Nếu bạn không gửi yêu cầu này, xin vui lòng bỏ qua email này.<br>\r\n"
								+ "			<br>\r\n"
								+ "			Nếu bạn tiếp tục nhận được yêu cầu thay đổi mật khẩu,<br>\r\n"
								+ "			điều này đồng nghĩa với việc có ai đó đang cố gắng xâm nhập vào tài khoản của bạn.<br>",
						content = ALEmail.HTMLTemplate
									.replaceFirst("USERNAME", sv.getTen())
									.replaceFirst("CONTENT", text)
									.replaceFirst("OTPCODE", OTP)
									.replaceFirst("WARNING", "Không chia sẻ mã này cho bất kì ai !")
									.replaceFirst("THANK", "Trân trọng, đội ngũ DAS_Courses");
				ALEmail.ZohoMail.setEmail("Yêu cầu thay đổi mật khẩu", OTP);
				ALEmail.ZohoMail.sendEmailTO(email);
				System.out.println("Send OTP: " + OTP + " for user email: " + email);
			}
		} catch (IOException | MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
}