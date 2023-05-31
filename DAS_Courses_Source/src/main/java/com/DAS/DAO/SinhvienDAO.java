package com.DAS.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.DAS.Entity.Sinhvien;


public interface SinhvienDAO extends JpaRepository<Sinhvien, String>{
	
	boolean existsByEmail(String email);
	
	boolean existsByUsernameAndMatkhau(String username, String matkhau);
	
	@Procedure(procedureName = "SP_FIND_SV_KH")
	boolean isExistsSV_KH(@Param("USERNAME") String username, @Param("IDKH") String idkh);

}