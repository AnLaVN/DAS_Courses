package com.DAS.Filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.AnLa.FILE.Log;
import com.AnLa.HASH.AES;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALCookie;
import com.DAS.Tools.ALSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class Authentication implements HandlerInterceptor{
	@Autowired
	SinhvienDAO sinhvienDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String  cookie = ALCookie.get("userSignInCookie");
		if(cookie != null) {
			int iX = cookie.indexOf("~");
			String	hashUsername = cookie.substring(0, iX),
					hashPassword = AES.Decrypt(cookie.substring(iX + 1), "DAS"+hashUsername);
			
			if(sinhvienDAO.existsByUsernameAndMatkhau(hashUsername, hashPassword)) {
				ALSession.setSession("userSV", sinhvienDAO.findById(hashUsername).orElse(new Sinhvien()));
				Log.add("Authentication - Auto SignIn with cookies for username " + hashUsername);
				return true;
			}
		}else if(request.getSession().getAttribute("userSV") == null) {
			response.sendRedirect("/SignIn");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}