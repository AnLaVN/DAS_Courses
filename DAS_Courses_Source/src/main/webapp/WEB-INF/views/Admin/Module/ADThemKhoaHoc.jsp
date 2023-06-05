<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="toast-container position-fixed top-0 end-0 p-3 ">
	<div id="Toast" class="toast align-items-center" role="alert">
		<div class="d-flex bg-info" style="border-radius: 5px">
			<div class="toast-body fw-bold">Thêm thành công khóa học</div>
			<button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast"></button>
		</div>
	</div>
</div>
<c:if test="${message}">
	<script>
		new bootstrap.Toast(document.getElementById('Toast')).show()
	</script>
</c:if>



<div class="py-3 mx-2">
	<a href="/admin/khoahoc" class="text-black-50 h6">Khóa học</a><span class="mx-2">/</span><a href="/admin/addKH" class="h6" style="color: blue;">Thêm
		khóa học</a>
</div>
<h3 class="ms-2 fw-bold" style="font-family: 'Courier New', Courier, monospace; text-shadow: 2px 3px 4px gray;">Thêm mới khóa học</h3>
<div class="col-12">
	<form class="row ms-2 " novalidate="novalidate" id="formThemKH" action="/admin/addKH" method="post" enctype="multipart/form-data">
		<div class="col-12 mt-5 mt-sm-5 mt-lg-4 col-lg-4 col-xxl-3">
			<div class="mt-4">
				<label for="idkh" class="form-label">ID</label>
				<input type="text" class="form-control" required="required" name="idkh" id="idkh" placeholder="Nhập ID khóa học">
				<div class="invalid-feedback">Vui lòng nhập ID khóa học !</div>
			</div>
			<div class="mt-4 mt-md-5 mt-xxl-5 col-12 text-center"></div>
			<div class="mb-0">
				<a href="#"><img width="100%" id="imageKH" class="img-fluid img-thumbnail"
					src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt=""></a>
			</div>
			<div class=" col-12 col-lg-12  d-flex justify-content-center my-3 ">
				<input class="form-control" name="fileAnh" onchange="getFilePath()" required="required" type="file" id="formFile">
			</div>

		</div>

		<div class="col-12 col-lg-8 col-xxl-4 mt-2 mt-lg-0">
			<div class="mb-3 mt-2 mt-lg-5 mt-xxl-5">
				<label for="tenKhoaHoc" class="form-label">Tên khóa học</label>
				<input type="text" class="form-control" required="required" name="tenkhoahoc" id="tenKhoaHoc" placeholder="Nhập tên khóa học">
				<div class="invalid-feedback">Vui lòng nhập tên khóa học !</div>
			</div>
			<div class="mb-3">
				<label for="tenKhoaHoc" class="form-label">Phân loại</label> <select required="required" id="course-filter" name="phanloai" class="form-select">
					<c:forEach var="phanloai" items="${phanLoai}">
						<option value="${phanloai.idpl}">${phanloai.tenpl}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mb-3">
				<label for="moTa" class="form-label">Mô tả</label>
				<textarea class="form-control" name="motangan" style="height: 185px" rows="3" placeholder="Nhập mô tả khóa học"></textarea>
			</div>

		</div>
		<div class="col-12 col-xxl-5">
			<div class="mb-3 mt-2 mt-lg-3 mt-xxl-5">
				<label for="moTaCT" class="form-label">Mô tả chi tiết</label>
				<textarea class="form-control" name="mota" style="height: 350px" rows="3" placeholder="Nhập mô tả khóa học"></textarea>
				<div class="d-flex justify-content-end mt-3">
					<button class="btn btn-dark fw-bold col-3 " type="submit">Lưu</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	// Lắng nghe sự kiện submit form
	document.getElementById('formThemKH').addEventListener('submit',
			function(event) {
				// Kiểm tra tính hợp lệ của form
				if (!event.target.checkValidity()) {
					event.preventDefault(); // Ngăn chặn submit form nếu không hợp lệ
					event.stopPropagation(); // Ngăn chặn lan truyền sự kiện
				}
				// Kích hoạt các lớp CSS cho phản hồi xác thực
				event.target.classList.add('was-validated');
			});
</script>

