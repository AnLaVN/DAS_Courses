<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>



	<!-- All Courses -->
	<div class="row justify-content-center m-0 my-4">
		<c:forEach var="course" items="${CoursesPage.content}" varStatus="loop">
		<div class="card m-3 p-0 col-11 col-md-5 col-xl-3" onclick="location.href='${url}Course/${course.idkh}'" style="cursor: pointer;">
			<div class="card-header">${course.phanloai.tenpl}</div>
			<img class="img-fluid" src="${course.anhmota}">
			<div class="card-body">
				<h5 class="card-title fs-6">${course.tenkhoahoc}</h5>
				<p class="card-text">${course.motangan}</p>
			</div>
		</div>
		</c:forEach>
	</div>
	
	
	<!-- Nav bar -->
	<nav>
		<ul class="pagination m-0 p-0 pb-5 justify-content-center">
			<li class="page-item"><a class="page-link" href="?page=1" onclick="handleClick(this)">&laquo;</a></li>
			<c:forEach var="i" begin="1" end="${CoursesPage.totalPages}">
			<li class="page-item ${CurrentPage==i?'active':''}"><a class="page-link" href="?page=${i}" onclick="handleClick(this)">${i}</a>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="?page=${CoursesPage.totalPages}" onclick="handleClick(this)">&raquo;</a></li>
		</ul>
	</nav>



</body>
</html>