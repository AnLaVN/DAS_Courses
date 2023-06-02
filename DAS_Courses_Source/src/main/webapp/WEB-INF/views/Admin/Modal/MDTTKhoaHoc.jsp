<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-dialog mt-5">
	<div class="modal-content">
		<div class="modal-header">
			<h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">Thông tin khóa học</h1>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form class="row">
				<div class="col-6 mb-3">
					<a href="#"><img width="100%"
						src="https://marketplace.canva.com/EAFAMirCsX4/2/0/1600w/canva-purple-creative-livestream-youtube-thumbnail-X2eVuOzURSM.jpg" alt=""></a>
				</div>
				<div class="mb-3 col-6 text-center">
					<label for="maKhoaHoc" class="form-label mt-4 h6">${khoaHoc.idkh}</label>
					<h4>${khoaHoc.idkh}</h4>
				</div>
				<div class="mb-3">
					<label for="tenKhoaHoc" class="form-label">Tên khóa học</label>
					<input type="text" class="form-control" id="tenKhoaHoc" placeholder="Nhập tên khóa học">
				</div>

				<div class="mb-3">
					<label for="tenKhoaHoc" class="form-label">Phân loại</label> <select id="course-filter" class="form-select">
						<option value="math">Java</option>
						<option value="science">Cơ sở dữ liệu</option>
						<option value="history">Lịch sử</option>
						<!-- Thêm các tùy chọn khác tại đây -->
					</select>
				</div>
				<div class="mb-3">
					<label for="moTa" class="form-label">Mô tả</label>
					<textarea class="form-control" id="moTa" rows="3" placeholder="Nhập mô tả khóa học"></textarea>
				</div>
				<div class="d-flex justify-content-end column-gap-3">
					<button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary fw-bold">Quản trị</button>
				</div>
			</form>
		</div>
	</div>
</div>