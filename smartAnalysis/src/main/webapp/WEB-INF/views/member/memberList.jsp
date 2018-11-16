<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/board/font-awesome.min.css" rel="stylesheet">
<link href="/board/style.css" rel="stylesheet">
<script src="/js/jquery-1.12.4.js"></script>
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>회원관리</h1>
			</div>
			<form name="frm" id="frm" class="form-horizontal" action="/member/memberDel" method="post">
				<input type="hidden" name="id" id="id">
			</form>
			<div class="col-6"> 
				<h5>
					전체회원 <span id="cnt" class="point ng-binding">${totCnt}</span>명
				</h5>
			</div>
			<div class="" id="">
				<table class="table ng-scope">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="">
					<c:forEach items="${memberList}" var="list">
							<tr data-id="${list.mem_id}">
								<td>${list.mem_id}</td>
								<td>${list.mem_name}</td>
								<td><a onclick="memDelete();" style="cursor: pointer;">탈퇴</a></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul id="navi" class="pagination">
						<%=request.getAttribute("pageNavi")%>
					</ul>
				</div>
			</div>
		</div>
	</article>
<script>
// 	$(function() {
// 		$("table tbody tr").on("click", function() {
// 			//tr태그의 data-id 속성 값을 읽어서 input태그의 id값으로 설정
// 			//form 태그를 submit
// 			$("#id").val($(this).data("id"));
// 			alert($("#id").val());
// 			$("#frm").submit();
// 		});
// 	});
	function memDelete(){
		$("table tbody tr").on("click", function() {
			alert($("#id").val() + "탈퇴하겠습니까?");
			$("#id").val($(this).data("id"));
			$("#frm").submit();
		});
	}
	

</script>

