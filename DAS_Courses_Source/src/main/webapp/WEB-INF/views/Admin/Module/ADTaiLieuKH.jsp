<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-bordered table-hover table-">
	<tr class="text-center">
		<th>Tên tài liệu</th>
		<th>ID Youtube</th>
		<th>Ảnh video</th>
		<th class="d-none d-lg-table-cell">Mô Tả</th>
		<!-- <th></th> -->
	</tr>
	<c:forEach var="taiNguyen" items="${khoaHoc.tainguyens}">
		<tr style="height: auto;" class="text-center">
			<td>${taiNguyen.tentainguyen}</td>
			<td>${taiNguyen.idyoutube}</td>
			<td class="col-2"><img src="https://i3.ytimg.com/vi/${taiNguyen.idyoutube}/maxresdefault.jpg" onload="checkYT(this)" width="100%" alt=""></td>
			<td class="d-none d-lg-table-cell">${taiNguyen.mota}</td>
			<!-- <td>
            <h3><i class="fa-solid fa-pen-to-square"></i></h3>
        </td> -->
		</tr>
	</c:forEach>

</table>