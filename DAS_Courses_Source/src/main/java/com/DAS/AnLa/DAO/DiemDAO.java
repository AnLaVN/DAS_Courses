package com.DAS.AnLa.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.jpa.repository.JpaRepository;

import com.DAS.AnLa.Entity.Diem;
import com.DAS.AnLa.Entity.DiemId;

public interface DiemDAO extends JpaRepository<Diem, DiemId>{

}