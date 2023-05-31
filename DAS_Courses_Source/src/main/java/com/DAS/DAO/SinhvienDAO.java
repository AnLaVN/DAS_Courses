package com.DAS.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.jpa.repository.JpaRepository;

import com.DAS.Entity.Sinhvien;
import java.util.List;


public interface SinhvienDAO extends JpaRepository<Sinhvien, String>{
	
	boolean existsByEmail(String email);
	
	boolean existsByUsernameAndMatkhau(String username, String matkhau);

}