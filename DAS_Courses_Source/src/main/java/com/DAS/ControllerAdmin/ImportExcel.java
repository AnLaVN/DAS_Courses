package com.DAS.ControllerAdmin;
//Make by Bình An || AnLaVN || KatoVN

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.AnLa.FILE.Excel;
import com.DAS.DAO.CauhoiDAO;
import com.DAS.DAO.KhoahocDAO;
import com.DAS.Entity.Cauhoi;
import com.DAS.Entity.Khoahoc;
import com.DAS.Tools.ALParam;

@Controller
@RequestMapping("admin/khoahoc/importEX")
public class ImportExcel {
	
	@Autowired
	CauhoiDAO cauhoiDAO;
	
	@Autowired
	KhoahocDAO khoahocDAO;
	
	
	//controller import excel câu hỏi
	@PostMapping
	public List<Cauhoi> importExcelCH(@RequestParam("idkh") String idkh, @RequestParam("fileEX") MultipartFile pFile){
		try { // Lưu file excel câu hỏi
			String  abPath = ALParam.saveFile(pFile, "/File/UserExcel/", idkh+".xlsx").getAbsolutePath();
			Iterator<Object[]> data = Excel.ReadExcel(abPath, "Sheet 1");
			
			while (data.hasNext()) {
				Object[] row = data.next();  //get row data
				String  cauhoi = String.valueOf(row[0]),
						dapanA = String.valueOf(row[1]),
						dapanB = String.valueOf(row[2]),
						dapanC = String.valueOf(row[3]),
						dapanD = String.valueOf(row[4]),
						dapan  = String.valueOf(row[5]);
				arrCH.add(new Cauhoi("", new Khoahoc(idkh), cauhoi, dapanA, dapanB, dapanC, dapanD, dapan));
			}
			
			new File(abPath).delete();
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return arrCH;
	}
}