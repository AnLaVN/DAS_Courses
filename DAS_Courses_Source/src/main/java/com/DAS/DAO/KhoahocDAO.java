package com.DAS.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Phanloai;

public interface KhoahocDAO extends JpaRepository<Khoahoc, String>{
	
	Page<Khoahoc> findByPhanloai(Phanloai phanloai, Pageable pageable);
	
	Page<Khoahoc> findByTenkhoahocLike(String tenkhoahoc, Pageable pageable);
	
	Khoahoc findByIdkh(String id);
	
	//Begin Make by Tiến Sỹ |TTS
	
	//Phân trang và tìm kiếm và phân loại
	@Query("SELECT o FROM Khoahoc o WHERE o.tenkhoahoc like %?1% AND o.phanloai.idpl like %?2%")
	Page<Khoahoc> findAllByNameLikeAndPL(String keywords,String idPL, Pageable pageable);
	
	
	//delete sinh viên tồn tại trong khóa học
	
	
	//End Tiến Sỹ | TTS 
	

}