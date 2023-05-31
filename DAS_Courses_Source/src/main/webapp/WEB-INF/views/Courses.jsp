<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100" ng-app="MyApp" ng-controller="MyCtrl" ng-init="Validation()" data-bs-theme="{{Theme}}">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <title>Courses</title>
    <link href="resources/style.css" rel="stylesheet">
    <script src="resources/script.js"></script>
    <style>
        #BGImage {
            background: url("{{getImageOnTime()}}") no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>

<body id="BGImage" class="d-flex flex-column h-100">
	<c:url var="url" value="/"/>
	
	<%@include file="Module/Header.jsp"%>




	<div class="row justify-content-center m-0 my-4">
		<c:forEach var="course" items="${CoursesPage.content}" varStatus="loop">
		<div class="card m-3 p-0 col-11 col-md-5 col-xl-3" onclick="location.href='/Course/${course.idkh}'" style="cursor: pointer;">
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



    
    <%@include file="Module/Footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>