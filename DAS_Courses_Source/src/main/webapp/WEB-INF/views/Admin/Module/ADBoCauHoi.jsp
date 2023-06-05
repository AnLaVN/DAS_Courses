<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<table class="table table-bordered table-hover">
	<tr class="text-center">
		<th>Câu hỏi</th>
		<th>Đáp án A</th>
		<th>Đáp án B</th>
		<th>Đáp án C</th>
		<th>Đáp án D</th>
		<th>Đáp án đúng</th>
		<!-- <th></th> -->
	</tr>
<c:forEach var="cauhoi" items="${khoaHoc.cauhois}">
		<td>${cauhoi.cauhoi}</td>
		<td>${cauhoi.dapana}</td>
		<td>${cauhoi.dapanb}</td>
		<td>${cauhoi.dapanc}</td>
		<td>${cauhoi.dapand}</td>
		<td class="text-center">${cauhoi.dapandung}</td>
		<!-- <td>
            <h3><i class="fa-solid fa-pen-to-square"></i></h3>
        </td> -->
	</tr>
	</c:forEach>
	<tr style="height: auto;" class="text-center">
</table>