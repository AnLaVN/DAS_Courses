<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<div class="toast-container position-fixed top-0 end-0 p-3 ">
	<div id="Toast" class="toast align-items-center" role="alert">
		<div class="d-flex bg-info" style="border-radius: 5px">
			<div class="toast-body fw-bold">Cập nhật thành công</div>
			<button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast"></button>
		</div>
	</div>
</div>
<c:if test="${message}">
	<script>
		new bootstrap.Toast(document.getElementById('Toast')).show()
	</script>
</c:if>


<div class="row m-0">
	<h3 class="ms-2 fw-bold" style="font-family: 'Courier New', Courier, monospace; text-shadow: 2px 3px 4px gray;">Quản trị khóa học</h3>
	<!-- form chỉnh sửa khóa học -->
	<div class="col-12">
		<form class="row ms-2"  action="/admin/update/${khoaHoc.idkh}" novalidate="novalidate" id="formUpdateKH" method="post" enctype="multipart/form-data">
			<div class="col-12 mt-5 mt-sm-5 mt-lg-4 col-lg-4 col-xxl-3">
				<div class="mt-4 mt-md-5 mt-xxl-5 col-12 text-center">
					<h4>${khoaHoc.idkh}</h4>
				</div>
				<div class="mb-0">
					<c:if test="${khoaHoc.anhmota!=null}">
						<a href="#">
							<img width="100%" id="imageKH" class="img-fluid img-thumbnail" src="${khoaHoc.anhmota}" alt="">
						</a>
					</c:if>
					<c:if test="${khoaHoc.anhmota==null}">
						<a href="#">
							<img width="100%" id="imageKH" class="img-fluid img-thumbnail"
								src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt="">
						</a>
					</c:if>
				</div>
				<div class=" col-12 col-lg-12  d-flex justify-content-center my-3 ">
					<input class="form-control" name="fileAnh" onchange="getFilePath()" type="file" id="formFile">
				</div>
			</div>
			<div class="col-12 col-lg-7 col-xxl-4">
				<div class="mb-3 mt-2 mt-lg-5 mt-xxl-5">
					<label for="tenKhoaHoc" class="form-label">Tên khóa học</label>
					<input type="text" class="form-control" name="tenkhoahoc" value="${khoaHoc.tenkhoahoc}" required="required" id="tenKhoaHoc" placeholder="Nhập tên khóa học">
				</div>
				<div class="mb-3">
					<label for="tenKhoaHoc" class="form-label">Phân loại</label> <select required="required" name="phanloai" id="course-filter" class="form-select">
						<c:forEach var="phanloai" items="${phanLoai}">
							<option ${phanloai.idpl == khoaHoc.phanloai.idpl?'selected="selected"':''} value="${phanloai.idpl}">${phanloai.tenpl}</option>
						</c:forEach>
						<!-- Thêm các tùy chọn khác tại đây -->
					</select>
				</div>
				<div class="mb-3">
					<label for="moTa" class="form-label">Mô tả</label>
					<textarea class="form-control" name="motangan" style="height: 185px" id="moTa" rows="3" placeholder="Nhập mô tả khóa học">${khoaHoc.motangan}</textarea>
				</div>

			</div>
			<div class="col-12 col-xxl-5">
				<div class="mb-3 mt-2 mt-lg-3 mt-xxl-5">
					<label for="moTaCT" class="form-label">Mô tả chi tiết</label>
					<textarea class="form-control" name="mota" style="height: 350px" id="moTaCT" rows="3" placeholder="Nhập mô tả khóa học">${khoaHoc.mota}</textarea>
					<div class="d-flex justify-content-end mt-3">
						<button class="btn btn-dark fw-bold col-3">Lưu</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Các nút thêm khóa học và import export  -->
	<div class="col-12 mt-0 mt-xxl-4">
		<div class="mt-3 p-2">
			<ul class="list-group row list-group-horizontal">
				<li class="col-6 col-xl-3 border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button id="btnAddTaiLieu" data-bs-toggle="modal" data-bs-target="#addTaiLieu" class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-plus me-2"></i>Thêm tài liệu
					</button>
				</li>
				<li class="col-6 col-xl-3 border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button id="btnAddCauHoi" data-bs-toggle="modal" data-bs-target="#addCauHoi" class=" btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-plus me-2"></i>Thêm câu hỏi
					</button>
				</li>
				<li class="col-6 col-xl-3 border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-file-import me-2"></i>Import Excel
					</button>
				</li>
				<li class="col-6 col-xl-3 border-0 bg-body-tertiary list-group-item d-flex justify-content-center">
					<button class="btn btn-outline-success fw-bold  col-10">
						<i class="fa-solid fa-file-export me-2"></i>Export Excel
					</button>
				</li>
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
					<div class="accordion-body p-0">
						<div>
							<jsp:include page="ADTaiLieuKH.jsp"></jsp:include>
						</div>
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
					<div class="accordion-body p-0">
						<div class="p-0">
							<jsp:include page="ADBoCauHoi.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// Lắng nghe sự kiện submit form
		document.getElementById('formUpdateKH').addEventListener('submit',
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

</div>