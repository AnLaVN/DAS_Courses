package com.AnLa.DAO;
//Make by Bình An || AnLaVN || KatoVN

import com.AnLa.Entity.Diem;
import com.AnLa.Entity.DiemId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiemDAO extends JpaRepository<Diem, DiemId>{

}