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
    <title>DAS_Courses</title>
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
		<div ng-repeat="i in [1,2,3,4,5,6,7,8]" class="card m-3 p-0 col-11 col-md-5 col-xl-3" onclick="location.href='/Course/${id}'" style="cursor: pointer;">
			<div class="card-header">Business_Operations</div>
			<img class="img-fluid"
				src="https://marketplace.canva.com/EAFAMirCsX4/2/0/1600w/canva-purple-creative-livestream-youtube-thumbnail-X2eVuOzURSM.jpg">
			<div class="card-body">
				<h5 class="card-title fs-6">Tiêu đề khoá học</h5>
				<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
			</div>
		</div>
	</div>



    
    <%@include file="Module/Footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>