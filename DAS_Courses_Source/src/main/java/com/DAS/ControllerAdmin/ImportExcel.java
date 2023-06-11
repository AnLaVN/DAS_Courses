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
import com.AnLa.FILE.Log;
import com.DAS.DAO.KhoahocDAO;
import com.DAS.Entity.Cauhoi;
import com.DAS.Entity.Khoahoc;
import com.DAS.Tools.ALParam;

@Controller
@RequestMapping("admin/khoahoc/importEX")
public class ImportExcel {
	@Autowired
	KhoahocDAO khoahocDAO;

	@PostMapping
	public void SaveExcelData(@RequestParam("idkh") String idkh, @RequestParam("rdoModel") boolean rdoMode, @RequestParam("fileEX") MultipartFile pFile){
		// Xử lí dữ liệu
		Khoahoc khoahoc = khoahocDAO.findById(idkh).get();	// Lấy thông tin khoá học hiện tại thoe idkh
		List<Cauhoi> newListCH = new ArrayList<>();			// Tạo danh sách trống chứa câu hỏi mới từ excel
		
		try { // Lưu file excel câu hỏi
			String  abPath = ALParam.saveFile(pFile, "/File/UserExcel/", idkh+".xlsx").getAbsolutePath();
			Log.add("SaveExcelData - Save Excel file successfully at: " + abPath);	// Thông báo qua Log
			Iterator<Object[]> data = Excel.ReadExcel(abPath, "Sheet 1");			// Lấy data từ excel
			
			while (data.hasNext()) {						// Duyệt từng dòng dữ liệu
				Object[] row = data.next();  				// Lấy dữ liệu trong dòng
				String  cauhoi = String.valueOf(row[0]),
						dapanA = String.valueOf(row[1]),
						dapanB = String.valueOf(row[2]),
						dapanC = String.valueOf(row[3]),
						dapanD = String.valueOf(row[4]),
						dapan  = String.valueOf(row[5]);
				newListCH.add(new Cauhoi(khoahoc, cauhoi, dapanA, dapanB, dapanC, dapanD, dapan));
			}
			
			if(rdoMode) khoahoc.setCauhois(newListCH);		// Nếu mode là ghi đè thì set list câu hỏi mới
			else khoahoc.getCauhois().addAll(newListCH);	// Nếu mode là ghi tiếp thì add vào list câu hỏi
			khoahocDAO.save(khoahoc);						// Lưu thay đổi vào csdl
			new File(abPath).delete();						// Xoá file excel đã lưu
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}
}