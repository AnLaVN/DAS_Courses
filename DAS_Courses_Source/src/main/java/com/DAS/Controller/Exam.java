package com.DAS.Controller;
//Make by Bình An || AnLaVN || KatoVN

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AnLa.FILE.Log;
import com.DAS.DAO.DiemDAO;
import com.DAS.DAO.KhoahocDAO;
import com.DAS.DAO.SinhvienDAO;
import com.DAS.Entity.Cauhoi;
import com.DAS.Entity.Diem;
import com.DAS.Entity.DiemId;
import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Sinhvien;
import com.DAS.Tools.ALParam;
import com.DAS.Tools.ALSession;

@Controller
@RequestMapping("/Exam")
public class Exam {
	@Autowired
	KhoahocDAO khoahocDAO;
	@Autowired
	SinhvienDAO sinhvienDAO;
	@Autowired
	DiemDAO diemDAO;
	
	@GetMapping("/{idkh}")
	public String ExamGET(@PathVariable("idkh") String idkh, Model model) {
		String idsv = ((Sinhvien) ALSession.getSession("userSV")).getUsername();
		Diem diem = diemDAO.findBySinhvienAndKhoahoc(new Sinhvien(idsv), new Khoahoc(idkh));
		model.addAttribute("Course", khoahocDAO.findById(idkh).orElse(new Khoahoc()));
		model.addAttribute("Mark", diem != null ? diem.getDiem() : 0.0);
		Log.add("ExamGET - Exam Course " + idkh);
		return "Exam";
	}
	
	@PostMapping("/{idkh}")
	public String ExamPOST(@PathVariable("idkh") String idkh, Model model) {
		String idsv = ((Sinhvien) ALSession.getSession("userSV")).getUsername();
		
		Sinhvien sv = sinhvienDAO.findById(idsv).get();
		Khoahoc khoahoc = khoahocDAO.findById(idkh).orElse(new Khoahoc());
		List<Cauhoi> listCauhoi = khoahoc.getCauhois();
		int size = listCauhoi.size();
		double  mark = 100.0 / size,
				totalMark = 0.0;
		
		for(int i = 0 ; i < size ; i++) {
			boolean isMatch = ALParam.getString("AnswerOfSentence"+i).equalsIgnoreCase(listCauhoi.get(i).getDapandung());
			if(isMatch) totalMark += mark;
		}
		
		DiemId id = new DiemId(idsv, idkh);
		Diem diem = new Diem(id, khoahoc, sv, totalMark);
		diemDAO.save(diem);
		sv.getDiems().add(diem);
		sinhvienDAO.save(sv);
		
		Log.add("ExamPOST - Username " + idsv + " submit exam of course " + idkh + " with " + totalMark + " mark");
		return "redirect:/Exam/"+idkh;
	}
}