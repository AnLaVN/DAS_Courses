package com.DAS.Entity;
//Make by Bình An || AnLaVN || KatoVN

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
import lombok.RequiredArgsConstructor;

@Entity
@Table(name = "CAUHOI", schema = "dbo", catalog = "DASJ5SQL")
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Cauhoi{

	@Id
	@Column(name = "IDCH", unique = true, nullable = false, length = 10)
	@NonNull
	private String idch;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDKH")
	private Khoahoc khoahoc;
	
	@Column(name = "CAUHOI")
	private String cauhoi;
	
	@Column(name = "DAPANA")
	private String dapana;
	
	@Column(name = "DAPANB")
	private String dapanb;
	
	@Column(name = "DAPANC")
	private String dapanc;
	
	@Column(name = "DAPAND")
	private String dapand;
	
	@Column(name = "DAPANDUNG", length = 1)
	private String dapandung;

}