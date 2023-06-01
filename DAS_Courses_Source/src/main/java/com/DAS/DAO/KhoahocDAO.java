package com.DAS.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Phanloai;
import com.DAS.Entity.Sinhvien;



public interface KhoahocDAO extends JpaRepository<Khoahoc, String>{
	
	Page<Khoahoc> findByPhanloai(Phanloai phanloai, Pageable pageable);
	
	Page<Khoahoc> findByTenkhoahocLike(String tenkhoahoc, Pageable pageable);

	Page<Khoahoc> findBySinhviens(Sinhvien sinhviens, Pageable pageable);
}