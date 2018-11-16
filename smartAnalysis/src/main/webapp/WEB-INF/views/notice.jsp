<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script>
function detail(){
	$("table tbody").on("click","tr", function() {
		//tr태그의 data-id 속성 값을 읽어서 input태그의 id값으로 설정
		//form 태그를 submit
		$("#id").val($(this).data("id"));
		$("#frm2").submit();
	});
}
</script>
  <body>
	<form id="frm2" action="/post/detail" method="get">
		<input type="hidden" name="id" id="id">
	</form>
  	
	<div class="report" id="resultList">
		<table class="table ng-scope">
			<thead style="background-color: #F0F3F5">
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody id="changeList">
			<c:forEach items="${post5List}" var="list" begin="1" end="9">
				<tr onclick="detail()" data-id="${list.post_num}">
					<td style="text-align: center;">${list.post_num}</td>
					<td style="text-align: center;">${list.post_title}</td>
					<td style="text-align: center;"><fmt:formatDate value="${list.post_dt}" pattern="yyyy-MM-dd"/> </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
  </body>
</html>