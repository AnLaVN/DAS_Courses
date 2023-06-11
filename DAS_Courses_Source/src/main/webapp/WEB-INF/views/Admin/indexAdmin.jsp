<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="MyApp" ng-controller="MyCtrl" data-bs-theme="{{Theme}}">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <link rel="icon" type="image/x-icon" href="/Image/Logo.png">
    <title>Quản trị</title>
    <script src="/resources/script.js"></script>
	<script src="/resources/Admin.js"></script>
	<script type="text/javascript" src="/resources/AdminJS/ADKhoaHoc.js"></script>
	<script type="text/javascript" src="/resources/AdminJS/ADCauHoi.js"></script>
	<script type="text/javascript" src="/resources/AdminJS/ADTaiLieu.js"></script>
	<link href="/resources/style.css" rel="stylesheet">
    <link href="/resources/Admin.css" rel="stylesheet">
	<script>var app = angular.module('myApp', []);</script>
</head>

<body ng-app="myApp">
	<jsp:include page="Module/ADHeader.jsp"></jsp:include>
	<div class="container-fluid ">
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-body-tertiary sidebar collapse p-0" style="margin-top: -10px;">
				<div class="position-sticky  pt-md-5 mt-3 sidebar-sticky">
					<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-5 mb-1 text-body-secondary text-uppercase">
						<span>QUẢN LÝ</span> <a class="link-secondary" href="#" aria-label="Add a new report"> <span data-feather="plus-circle"
							class="align-text-bottom"></span>
						</a>
					</h6>
					<ul class="nav flex-column mb-2 ms-3">
						<li class="nav-item"><a class="nav-link" href="/admin/khoahoc"> <span data-feather="file-text" class="align-text-bottom"></span><i
								class="fa-solid fa-circle me-2"></i>Khóa học
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/ThongKe"> <span data-feather="file-text" class="align-text-bottom"></span><i
								class="fa-solid fa-circle me-2"></i>Thống kê
						</a></li>

					</ul>
				</div>
			</nav>

			<article class="col-md-9 ms-sm-auto col-lg-10 p-2 bg-body-tertiary">
				<div style="height: auto;">
					<jsp:include page="${view}"></jsp:include></div>
			</article>
		</div>
	</div>
</body>

</html>