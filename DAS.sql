﻿USE MASTER
DROP DATABASE  IF EXISTS DAS 
CREATE DATABASE DAS
USE DAS

-- jdbc:sqlserver://DAS-SQL.mssql.somee.com;DatabaseName=DAS-SQL;encrypt=true;trustServerCertificate=true

CREATE TABLE SINHVIEN(
	USERNAME VARCHAR(64) NOT NULL PRIMARY KEY,
	MATKHAU VARCHAR(64),
	TEN NVARCHAR(128),
	AVATAR VARCHAR(256),
	EMAIL VARCHAR(256) UNIQUE
);
CREATE TABLE PHANLOAI(
	IDPL VARCHAR(10) PRIMARY KEY,
	TENPL NVARCHAR(128),
);
CREATE TABLE KHOAHOC(
	IDKH VARCHAR(20) NOT NULL PRIMARY KEY,
	TENKHOAHOC NVARCHAR(128),
	MOTA NVARCHAR(2048),
	MOTANGAN NVARCHAR(1024),
	ANHMOTA VARCHAR(256),
	IDPL VARCHAR(10),
	FOREIGN KEY (IDPL) REFERENCES PHANLOAI(IDPL)
);

CREATE TABLE KHOAHOC_SINHVIEN(
	USERNAME VARCHAR(64) NOT NULL,
	IDKH VARCHAR(20) NOT NULL,
	PRIMARY KEY(USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE DIEM(
	USERNAME VARCHAR(64),
	IDKH VARCHAR(20),
	DIEM FLOAT,
	PRIMARY KEY (USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE DANHGIA(
	USERNAME VARCHAR(64),
	IDKH VARCHAR(20),
	BINHLUAN NVARCHAR(512),
	SAO FLOAT,
	PRIMARY KEY (USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE TAINGUYEN(
	IDTN VARCHAR(10) PRIMARY KEY NOT NULL,
	TENTAINGUYEN NVARCHAR(128),
	IDYOUTUBE VARCHAR(11),
	MOTA NVARCHAR(1024),
	IDKH VARCHAR(20),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE CAUHOI(
	IDCH VARCHAR(10) PRIMARY KEY NOT NULL,
	CAUHOI NVARCHAR(512),
	DAPANA NVARCHAR(256),
	DAPANB NVARCHAR(256),
	DAPANC NVARCHAR(256),
	DAPAND NVARCHAR(256),
	DAPANDUNG VARCHAR(1),
	IDKH VARCHAR(20),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);