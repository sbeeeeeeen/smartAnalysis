<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<link href="/css/tradeAnalysisMain.css" rel="stylesheet">
<form action="" id="frm" method="post">
	<input type="hidden" name="an_num" id="annum" value="">
</form>
<div class="container">
	<div class="page-header">
		<h2>분석이력</h2>
	</div>
	<div class="row">
		<div class="col-lg-12 helpwrap">
			<em>안내</em>
			<ul>
				<li>수익분석은 보고서 페이지에서 다시 분석이 가능합니다.</li>
			</ul>
		</div>
		<div class="tableheader">
			<div class="col-lg-2" style="width: 40%">
				<label for="inputCategory3" class="sr-only">전체</label>
				<select class="form-control ng-valid ng-dirty" id="inputCategory2">
					<option value="0">전체</option>
					<option value="1">상권분석</option>
					<option value="2">입지분석</option>
					<option value="3">수익분석</option>
					<option value="4">미래지향분석</option>
				</select>
			</div>
			<div class="col-lg-2" style="width: 40%">
				<label for="inputCategory3" class="sr-only">10건씩 보기</label>
				<select class="form-control ng-valid ng-dirty" id="inputCategory3">
					<option value="10">10건씩 보기</option>
					<option value="20">20건씩 보기</option>
					<option value="30">30건씩 보기</option>
					<option value="50">50건씩 보기</option>
				</select>	
			</div>
			<div class="col-lg-1" style="width: 20%">
				<input type="button" class="btn btn-large btn-info" id="search" value="검색">
			</div>
		</div>
		<div class="col-lg-12">
		전체 <strong><span id="size">${size }</span></strong>건
		[<span id="page">${page }</span>/<span id="pagelength">${pageSize}</span> 페이지]
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>선택지역명</th>
						<th>업종명</th>
						<th>분석일</th>
						<th>다시분석</th>
						<th>보고서</th>
					</tr>
				</thead>
				<tbody id="pageList">
					<c:forEach items="${pageList }" var="vo">
						<tr data-id="${vo.an_num }">
							<td>${vo.an_num }</td>
							<td>${vo.an_div }</td>
							<td>${vo.an_addr }</td>
							<td>${vo.an_industry }</td>
							<td>
								<fmt:formatDate value="${vo.an_dt }" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<c:if test="${vo.an_div!='수익분석' }">
								<a href="javascript:void(0)" onclick="reAnalysis('${vo.an_num}','${vo.an_div }')"><i class="fa fa-history"></i></a>
								</c:if>
							</td>
							<td><a href="javascript:void(0)" onclick="viewReport('${vo.an_num}','${vo.an_div }', '${vo.an_addr }')"><i class="fa fa-bar-chart-o"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination" id="pageNavi"> 
			${pageNavi }
		</ul>
	</div>
</div>
<script type="text/javascript">
	function reAnalysis(num, div){
		document.getElementById("annum").value=num;
		switch(div){ 
		case '상권분석':
			document.getElementById("frm").action="/analysisRes/retrade";	
	 		document.getElementById("frm").submit();
			break;
		case '입지분석':
			document.getElementById("frm").action="/location/relocation";
	 		document.getElementById("frm").submit();
			break;
		case '미래지향분석':
			document.getElementById("frm").action="/future/reFuture";
			document.getElementById("frm").submit();
			break;
		}
	}
	
	function viewReport(num, div, addr){
		document.getElementById("annum").value=num;
		switch(div){ 
		case '상권분석':
			document.getElementById("frm").action="/analysisRes/tradeReport";	
	 		document.getElementById("frm").submit();
			break;
		case '입지분석':
			document.getElementById("frm").action="/location/relocationReport";
			document.getElementById("frm").submit();
			break;
		case '수익분석':
			document.getElementById("frm").action="/profit/profitReport";
			var addrval;
			addrval = document.createElement("input");
			addrval.type="hidden";
			addrval.name="addr";
			addrval.value=addr;
			document.getElementById("frm").appendChild(addrval);
			$.ajax({
				url : "/profit/getujList",
				async : false,
				dataType : "json",
				method: "post",
				contentType:"application/json; charset=utf-8",
				data : {"an_num" : num},
				success : function(data){
					var ujList;
					ujList = document.createElement("input");
					ujList.type="hidden";
					ujList.name="ujcode";
					ujList.value=data.ujcode;
					document.getElementById("frm").appendChild(ujList);
				}
			})
			document.getElementById("frm").submit();
			break;
		case '미래지향분석':
			document.getElementById("frm").action="/future/futureResult";
			document.getElementById("frm").submit();
			break;
		}
	}
	$("#search").on("click", function(){
		var div = $("#inputCategory2 option:selected").val();
		var pageSize = $("#inputCategory3 option:selected").val();
		console.log(div+" "+pageSize);
		$.ajax({
			url : "/analysisRes/tradeAnalysisResSelectList",
			dataType : "JSON",
			data : {
				"div" : div,
				"pageSize" : pageSize
			},
			success : function(data){
				$("#size").text(data.size);
				$("#page").text(data.page);
				$("#pagelength").text(data.pageSize);
				$("#pageNavi").html(data.pageNavi);
				var pageStr = "";
				$.each(data.pageList, function(index, value){
					pageStr += "<tr data-id="+value.an_num+">";
					pageStr += "<td>"+value.an_num+"</td>";
					pageStr += "<td>"+value.an_div+"</td>";
					pageStr += "<td>"+value.an_addr+"</td>";
					pageStr += "<td>";
					if(value.an_industry!=null){
						pageStr += value.an_industry;
					}
					pageStr += "</td>";
					pageStr += "<td>"+value.an_dt+"</td>";
					pageStr += "<td>";
					if(value.an_div!='수익분석'){
						pageStr += "<a href=\"javascript:void(0)\" onclick=\"reAnalysis('"+value.an_num+"','"+value.an_div+"')\">"
						+"<i class=\"fa fa-history\"></i></a>";
					}
					pageStr += "</td><td>"
							+"<a href=\"javascript:void(0)\" onclick=\"viewReport('"+value.an_num+"','"+value.an_div+"')\">"
							+"<i class=\"fa fa-bar-chart-o\"></i></a></td>";
				});
				$("#pageList").html(pageStr);
			}
		});
	});
</script>