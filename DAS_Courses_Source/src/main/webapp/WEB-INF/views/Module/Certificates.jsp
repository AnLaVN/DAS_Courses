<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>



	<div class="m-0 mx-md-5 my-4 p-0 row">
	
		<c:forEach var="course" items="${CoursesPage}" varStatus="loop">
		<!-- Default Card -->
		<div class="col-12 m-0 p-0 d-lg-none d-block">
			<div class="card">
				<img class="card-img-top" src="${Course.anhmota}">
				<div class="card-body">
					<h4 class="card-title">${sessionScope.userSV.ten}</h4>
					<p class="card-text" style="font-size: 1.1vw;">${Course.motangan}</p>
					<h6 class="card-subtitle mb-2 text-body-secondary">Tiến độ bài thi / điểm đạt được</h6>
					<div class="progress" role="progressbar">
						<div class="progress-bar" style="width: ${Mark}%">${Mark}%</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
	</div>
		



</body>
</html>