package com.DAS.AnLa.DAO;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.data.jpa.repository.JpaRepository;

import com.DAS.AnLa.Entity.Danhgia;
import com.DAS.AnLa.Entity.DanhgiaId;

public interface DanhgiaDAO extends JpaRepository<Danhgia, DanhgiaId>{

}