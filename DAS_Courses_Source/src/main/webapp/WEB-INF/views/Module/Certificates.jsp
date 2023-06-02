<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>


	<!-- All Certificates Card -->
	<div class="row justify-content-center m-0 my-4">
	
		<c:forEach var="diem" items="${CertifiPage.content}" varStatus="loop">
		<div class="card card m-3 p-0 col-11 col-md-5 col-xl-3" onclick="location.href='${url}Exam/${diem.khoahoc.idkh}'" style="cursor: pointer;">
			<img class="card-img-top" src="${diem.khoahoc.anhmota}">
			<div class="card-body">
				<h4 class="card-title">${diem.sinhvien.ten}</h4>
				<p class="card-text" style="font-size: 1.1vw;">${diem.khoahoc.motangan}</p>
				<h6 class="card-subtitle mb-2 text-body-secondary">Tiến độ bài thi / điểm đạt được</h6>
				<div class="progress" role="progressbar">
					<div class="progress-bar" style="width: ${diem.diem}%">${diem.diem}%</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
	</div>
	
	
	<!-- Nav bar -->
	<nav>
		<ul class="pagination m-0 p-0 pb-5 justify-content-center">
			<li class="page-item"><a class="page-link" href="?page=1" onclick="handleClick(this)">&laquo;</a></li>
			<c:forEach var="i" begin="1" end="${CertifiPage.totalPages}">
			<li class="page-item ${CurrentPage==i?'active':''}"><a class="page-link" href="?page=${i}" onclick="handleClick(this)">${i}</a>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="?page=${CertifiPage.totalPages}" onclick="handleClick(this)">&raquo;</a></li>
		</ul>
	</nav>
		



</body>
</html>