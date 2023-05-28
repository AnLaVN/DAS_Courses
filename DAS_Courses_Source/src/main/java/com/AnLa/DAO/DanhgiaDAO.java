package com.AnLa.DAO;
//Make by Bình An || AnLaVN || KatoVN

import com.AnLa.Entity.Danhgia;
import com.AnLa.Entity.DanhgiaId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DanhgiaDAO extends JpaRepository<Danhgia, DanhgiaId>{

}