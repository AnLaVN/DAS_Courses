package com.DAS.AnLa.Entity;
//Make by Bình An || AnLaVN || KatoVN

import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Entity
@Table(name = "TAINGUYEN", schema = "dbo", catalog = "DASJ5SQL")
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequestMapping
public class Tainguyen {

	@Id
	@Column(name = "IDTN", unique = true, nullable = false, length = 10)
	@NonNull
	private String idtn;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDKH")
	private Khoahoc khoahoc;
	
	@Column(name = "TENTAINGUYEN")
	private String tentainguyen;
	
	@Column(name = "IDYOUTUBE", length = 11)
	private String idyoutube;
	
	@Column(name = "MOTA")
	private String mota;

}