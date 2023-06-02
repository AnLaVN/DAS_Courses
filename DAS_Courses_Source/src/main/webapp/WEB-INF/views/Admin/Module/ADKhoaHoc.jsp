<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/Resource/Admin.js"></script>
<link rel="stylesheet" href="/Resource/Admin.css">


<h3 class="mt-3 fw-bold ms-3" style="font-family: 'Courier New', Courier;">DANH SÁCH KHÓA HỌC</h3>
<div class="row">
	<div class="col-10 col-md-6 col-lg-4 mx-auto mt-2">
		<div class="input-group mb-3 ms-0">
			<input type="text" class="form-control" style="border-radius: 20px 0px 0 20px; border-right: 0px;" placeholder="Tìm kiếm">
			<a class="input-group-text bg-white" id="basic-addon1" href="#" style="text-decoration: none; border-radius: 0px 20px 20px 0px;"><i
				class="fa-solid fa-magnifying-glass me-2"></i></a>
		</div>
	</div>
	<div class="col-10 col-md-6 col-lg-3 col-xl-2 mt-2 mx-auto d-block">
		<div class="col-12 float-end ">
			<select id="course-filter" class="form-select" style="border-radius: 20px 20px 20px 20px;">
				<option value="">Tất cả</option>
				<option value="math">Toán học</option>
				<option value="science">Khoa học</option>
				<option value="history">Lịch sử</option>
				<!-- Thêm các tùy chọn khác tại đây -->
			</select>
		</div>
	</div>
	<div class="col-10 mx-auto col-lg-2 mt-3 mt-lg-0">
		<button class="btn btn-outline-info mt-2 fw-bold col-12" style="border-radius: 20px 20px 20px 20px;" id="themMoi">
			<i class="fa-solid fa-plus me-2"></i>Thêm mới
		</button>
	</div>
</div>
<hr>

<div class="row gap-3 d-flex justify-content-center">
	<!--Hiển thị box khóa học -->
	<c:forEach var="khoaHoc" items="${listKhoaHoc}">
			<div class="card col-9 col-md-5 col-xl-3 p-0 mt-4 box-KH card-KH">
				<div class="card-img p-0 ">
					<img style="border-radius: 20px;" src="${khoaHoc.anhmota}" width="100%" alt="">
				</div>
				<div class="card-body pb-0" style="border-radius: 20px;">
					<h6  class="text-black-50">${khoaHoc.phanloai.tenpl}</h6>
					<h5 style="color:rgb(153,45,224); font-family:Calibri;" class="fw-bold">${khoaHoc.tenkhoahoc}</h5>
				</div>
				<hr class="col-10 mx-auto mt-0">
				<div class="card-header bg-body d-flex justify-content-end " style="border-radius: 20px;">
					<a class="h3 tiensy" href="/admin/khoahoc/${khoaHoc.idkh}"><i class="fa-solid fa-pen-to-square"></i></a>
				</div>
			</div>

	</c:forEach>
</div>