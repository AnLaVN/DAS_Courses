package com.DAS.Entity;
//Make by Bình An || AnLaVN || KatoVN

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
@Table(name = "KHOAHOC", schema = "dbo", catalog = "DASJ5SQL")
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
	private List<Danhgia> danhgias = new ArrayList<Danhgia>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private List<Diem> diems = new ArrayList<Diem>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private List<Tainguyen> tainguyens = new ArrayList<Tainguyen>();
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "khoahocs")
	private List<Sinhvien> sinhviens = new ArrayList<Sinhvien>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "khoahoc")
	private List<Cauhoi> cauhois = new ArrayList<Cauhoi>();

}