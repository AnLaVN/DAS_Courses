package com.DAS.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.jpa.repository.JpaRepository;

import com.DAS.Entity.Diem;
import com.DAS.Entity.DiemId;
import com.DAS.Entity.Khoahoc;
import com.DAS.Entity.Sinhvien;


public interface DiemDAO extends JpaRepository<Diem, DiemId>{
	
	Diem findBySinhvienAndKhoahoc(Sinhvien sinhvien, Khoahoc khoahoc);
}