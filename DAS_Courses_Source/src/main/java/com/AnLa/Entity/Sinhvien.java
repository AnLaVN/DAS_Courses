package com.AnLa.Entity;
//Make by Bình An || AnLaVN || KatoVN

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Table(name = "SINHVIEN", schema = "dbo", catalog = "DAS", uniqueConstraints = @UniqueConstraint(columnNames = "EMAIL"))
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Sinhvien{

	@Id
	@Column(name = "USERNAME", unique = true, nullable = false, length = 64)
	@NonNull
	private String username;
	
	@Column(name = "MATKHAU", length = 64)
	private String matkhau;
	
	@Column(name = "TEN")
	private String ten;
	
	@Column(name = "AVATAR", length = 256)
	private String avatar;
	
	@Column(name = "EMAIL", unique = true, length = 256)
	private String email;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sinhvien")
	private Set<Danhgia> danhgias = new HashSet<Danhgia>(0);
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "KHOAHOC_SINHVIEN", schema = "dbo", catalog = "DAS", joinColumns = {
			@JoinColumn(name = "USERNAME", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "IDKH", nullable = false, updatable = false) })
	private Set<Khoahoc> khoahocs = new HashSet<Khoahoc>(0);
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sinhvien")
	private Set<Diem> diems = new HashSet<Diem>(0);

}