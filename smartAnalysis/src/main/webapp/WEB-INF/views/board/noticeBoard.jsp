<%@page import="kr.or.ddit.post.service.PostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link href="/board/layout.css" rel="stylesheet"> -->
<!-- <link href="/board/font-awesome.min.css" rel="stylesheet"> -->
<!-- <link href="/board/style.css" rel="stylesheet"> -->
<script src="/js/jquery-1.12.4.js"></script>
<!-- <link href="/bootstrap/css/bootstrap.css" rel="stylesheet"> -->
</head>
<script>
$(function() {
	$("table tbody").on("click", "tr", function() {
		//tr태그의 data-id 속성 값을 읽어서 input태그의 id값으로 설정
		//form 태그를 submit
		$("#id").val($(this).data("id"));
		$("#frm").submit();
	});
});

	function sel(){
		var value = $("#inputCategory3 option:selected").val();
		$.ajax({
			url : "/post/change"
			,contextType : "application/json;charset=UTF-8"
			,dateType : "json"
			,type : "get"
			,data : {"changeSize" : value,"board_num" : "${board_num}"}
			,success : function(e){
				var listHTML = ""; 
				for(var i in e.pageList){
					listHTML +="<tr data-id=\"" + e.pageList[i].post_num + "\"><td>"+e.pageList[i].post_num
					+"</td><td>"+e.pageList[i].post_title+"</td><td>"+e.pageList[i].post_dt+"</td></tr>";
				}
				document.getElementById('changeList').innerHTML = listHTML;
				document.getElementById('navi').innerHTML = e.pageNavi;
			}
			,error : function(error){
				alert(error);
			}
		});
	}
	function search(){
		var write = $("#inputKeyword").val();
		$.ajax({
			url: "/post/searchPost"
			,contextType : "application/json;charset=UTF-8"
			,dataType : "json"
			,type : "get"
			,data: {
						"search" : encodeURI(write)
						,"board_num" : "${board_num}"
					}
			,success : function(e){
				var searchHTML = "";
				for(var i in e){
					searchHTML += "<tr data-id=\"" + e[i]['post_num'] + "\"><td>"+e[i]['post_num']
					+"</td><td>"+e[i]['post_title']+"</td><td>"+e[i]['post_dt']+"</td></tr>";
				}
				document.getElementById('changeList').innerHTML = searchHTML;
				document.getElementById('cnt').innerHTML = Object.keys(e).length;
				
			}
			,error : function(error){
				alert("실패 : "+error);
			}
		});
	}
	function enterKey(){
		if(window.event.keyCode==13){
    		search();
    	}
	}
</script>
<body>
	<form id="frm" action="/post/detail" method="get">
		<input type="hidden" name="id" id="id">
	</form>
	
	<div id="body" data-animated-view="" style="display: block;">
		<div id="UserCenterCtrl" class="ng-scope" style="opacity: 1;">


			<!-- /.breadcrumb-wrap -->

			<div class="container ng-scope">
				<div class="page-header">
				<c:if test="${board_num eq 1}">
					<h2>공지사항</h2>
				</c:if>
				<c:if test="${board_num eq 2}">
					<h2>개선의견</h2>
				</c:if>
				</div>
			</div>
			<!-- /.container -->

			<div class="container ng-scope">
				<div class="helpwrap">
					<div class="help info">
						<ul>
						<c:if test="${board_num eq 1}">
							<pre style="border-color: white"><li><span class="black">상권정보시스템</span>의 공지사항을 확인 하실 수 있습니다.</li></pre>
						</c:if>
						<c:if test="${board_num eq 2}">
							<pre style="border-color: white"><li><span class="black">상권정보시스템</span>의 개선의견을 확인 하실 수 있습니다.</li></pre>
						</c:if>
						</ul>
					</div>
					<!-- /.help -->
				</div>

				<div class="selectwrap-board rowfluid">
					<div class="col-4 text-right">
						<div class="col-8">
							<div class="input-group" style="float: right;">
								<!-- 검색어 입력박스 -->
								
								<label for="inputCategory3" class="sr-only">10건씩 보기</label>
								<select style="width: 100%; float: right;" class="form-control ng-valid ng-dirty" id="inputCategory3" onchange="sel()">
									<option value="10">10건씩 보기</option>
									<option value="20">20건씩 보기</option>
									<option value="30">30건씩 보기</option>
									<option value="50">50건씩 보기</option>
								</select>
							</div>
							<!-- /검색어 입력박스 -->
						</div>
					</div>
				</div>
				<div class="col-6"> 
					<h5>
						전체 <span id="cnt" class="point ng-binding" style="color: red;">${totCnt}</span>건
					</h5>
				</div>

				<div class="report" id="resultList">
					<table class="table ng-scope">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="changeList">
						<c:forEach items="${postList}" var="list">
							<tr data-id="${list.post_num}">
								<td>${list.post_num}</td>
								<td>${list.post_title}</td>
								<td><fmt:formatDate value="${list.post_dt}" pattern="yyyy-MM-dd"/> </td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<div class="text-center">
						<ul id="navi" class="pagination">
							<%=request.getAttribute("pageNavi")%>
						</ul>
						
					</div>
					<div class="col-8">
						<label for="inputKeyword" class="sr-only">검색어</label> 
						<input style="width: 20%; float: left; margin-right: 38px;" type="text" id="inputKeyword" class="form-control ng-valid ng-dirty" onkeyup="enterKey()" placeholder="검색어">
						<span class="input-group-btn" style="float: left;"> 
							<label style="float: right;" class="btn btn-primary" title="검색" onclick="search()">검색</label>
						</span>
					</div>
					<c:if test="${memberVo.mem_type eq 5}">
						<c:if test="${board_num eq 1}">
							<div class="text-right" style="padding-left: 280px;">
								<a href="/post/newPost" class="btn btn-primary">새글쓰기</a>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>