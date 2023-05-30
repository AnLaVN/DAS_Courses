package com.DAS.AnLa.Entity;
//Make by Bình An || AnLaVN || KatoVN

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Table(name = "KHOAHOC", schema = "dbo", catalog = "DAS")
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Khoahoc{

	@Id
	@Column(name = "IDKH", unique = true, nullable = false, length = 20)
	@NonNull
	private String idkh;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDPL")
	private Phanloai phanloai;
	
	@Column(name = "TENKHOAHOC")
	private String tenkhoahoc;
	
	@Column(name = "MOTA")
	private String mota;
	
	@Column(name = "MOTANGAN")
	private String motangan;
	
	@Column(name = "ANHMOTA", length = 256)
	private String anhmota;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private Set<Danhgia> danhgias = new HashSet<Danhgia>(0);
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private Set<Diem> diems = new HashSet<Diem>(0);
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private Set<Tainguyen> tainguyens = new HashSet<Tainguyen>(0);
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "khoahocs")
	private Set<Sinhvien> sinhviens = new HashSet<Sinhvien>(0);
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private Set<Cauhoi> cauhois = new HashSet<Cauhoi>(0);

}