<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row m-0">
	<h3 class="ms-2 fw-bold" style="font-family: 'Courier New', Courier, monospace; text-shadow: 2px 3px 4px gray;">Quản trị khóa học</h3>
	<!-- form chỉnh sửa khóa học -->
	<div class="col-12 col-xxl-8">
		<form class="row ms-2">
			<div class="col-12 col-lg-6">
				<div class="mt-4 col-12 text-center">
					<h4>${khoaHoc.idkh}</h4>
				</div>
				<div class="mb-0">
					<a href="#"><img width="100%" src="${khoaHoc.anhmota}" alt=""></a>
				</div>
				<div class=" col-12 col-lg-12  d-flex justify-content-center my-3 ">
					<input class="form-control" type="file" id="formFile">
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class="mb-3 mt-2 mt-lg-5 mt-xxl-5">
					<label for="tenKhoaHoc" class="form-label">Tên khóa học</label>
					<input type="text" class="form-control" value="${khoaHoc.tenkhoahoc}" id="tenKhoaHoc" placeholder="Nhập tên khóa học">
				</div>
				<div class="mb-3">
					<label for="tenKhoaHoc" class="form-label">Phân loại</label>
					<select id="course-filter" class="form-select">
						<c:forEach>
							<option value="math">Java</option>
						</c:forEach>

						<!-- Thêm các tùy chọn khác tại đây -->
					</select>
				</div>
				<div class="mb-3">
					<label for="moTa" class="form-label">Mô tả</label>
					<textarea class="form-control" id="moTa" rows="3" placeholder="Nhập mô tả khóa học">
						${khoaHoc.mota}
					</textarea>
				</div>
				<div class="d-flex justify-content-end">
					<button class="btn btn-dark fw-bold col-3">Lưu</button>
				</div>
			</div>
		</form>
	</div>
	<!-- Các nút thêm khóa học và import export  -->
	<div class="col-12 col-xxl-4 mt-0 mt-xxl-4">
		<div class="mt-3 p-2">
			<ul class="list-group">
				<li class="border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button id="btnAddTaiLieu" data-bs-toggle="modal" data-bs-target="#addTaiLieu" class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-plus me-2"></i>Thêm tài liệu
					</button>
				</li>
				<li class="border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button id="btnAddCauHoi" data-bs-toggle="modal" data-bs-target="#addCauHoi" class=" btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-plus me-2"></i>Thêm câu hỏi
					</button>
				</li>
				<li class="border-0 bg-body-tertiary list-group-item d-flex justify-content-center"><button class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-file-import me-2"></i>Import Excel
					</button></li>
				<li class="border-0 bg-body-tertiary list-group-item d-flex justify-content-center"><button class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-file-export me-2"></i>Export Excel
					</button></li>
			</ul>
		</div>
	</div>
	<div class="col-11 mx-auto">
		<hr>
	</div>
	<!-- accordion Table hiển thị tài liệu và câu hỏi khóa học -->
	<div>
		<div class="accordion">
			<div class="accordion-item">
				<h2 class="accordion-header fw-bold">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne">
						<h4 class="fw-bold">Bộ tài liệu khóa học</h4>
					</button>
				</h2>
				<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
					<div class="accordion-body">
						<div ng-include="'/ModuleAdmin/ADTaiLieuKH.html'"></div>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo">
						<h4 class="fw-bold">Bộ câu hỏi kiểm tra</h4>
					</button>
				</h2>
				<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
					<div class="accordion-body">
						<div ng-include="'/ModuleAdmin/ADBoCauHoi.html'"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>