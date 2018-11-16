<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function yUpdate(){
	document.getElementById('frm').submit();
}
function deleteConsulting(){
	document.getElementById('delFrm').submit();
}

function videoChat(consultMemberId){
	window.open("/consulting/Rtctest?consultMemberId="+consultMemberId,"","width=1210,height=780,left=300");
}//chat 팝업창
</script>
<link href="/board/style.css" rel="stylesheet">
<body>
<div id="UserCenterCtrl" ng-include="" src="templateUrl" class="ng-scope" style="opacity: 1;">
	<div class="container ng-scope">
		<div class="page-header">
			<h2>일정관리</h2>
		</div>
	</div>

	<div class="container ng-scope" data-ng-controller="UserCenterNoticeCtrl">
		<div class="helpwrap">
			<div class="help info">
				<ul>
					<pre style="border-color: white"><li><span class="black">컨설팅</span>을 신청한 사람들을 볼 수 있습니다.</li></pre>
				</ul>
			</div><!-- /.help -->
		</div><!-- /.helpwrap -->
		<p class="text-right" style="margin-top: 10px;">
			<a href="/consulting/schedule" style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg">목록</a>
		</p>
		 <table class="table table-bordered">
	        <caption class="hidden">일정 상세보기</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:90%;">
			</colgroup>
			<tbody>
	        	<tr>
					<th>신청 회원 아이디</th>
					<td class="text-left">${consultingVo.mem_id}</td>
				</tr>
	        	<tr>
					<th>신청날짜</th>
					<td class="text-left"><fmt:formatDate value="${consultingVo.cst_dt}" pattern="yyyy-MM-dd"/> </td>
				</tr>
				<tr>
					<th>신청 컨설턴트</th>
					<td class="text-left">${consultingVo.pro_id}</td>
				</tr>
	        	<tr>
					<th>내용</th>
					<td><p align="left"><font face="돋움, 돋움체">${consultingVo.cst_content}</font></p></td>
				</tr>
			</tbody>
		</table>
		<form id="frm" action="/consulting/yUpdate">
			<input type="hidden" name="cst_num" value="${consultingVo.cst_num}"/>
		</form>
		<form id="delFrm" action="/consulting/deleteConsulting">
			<input type="hidden" name="cst_num" value="${consultingVo.cst_num}"/>
		</form>
		
		<p class="text-right" style="margin-top: 10px;">
		<c:if test="${consultingVo.pro_id eq memberVo.mem_id and consultingVo.cst_aprv eq 'n'}">
			<button style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg" id="btn" onclick="yUpdate()">승인</button>
			<button style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg" onclick="deleteConsulting()">거절</button>
		</c:if>
		<c:if test="${consultingVo.pro_id eq memberVo.mem_id and consultingVo.cst_pay eq 'y'}">
			<button style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg" onclick="videoChat('${consultingVo.mem_id}')">컨설팅</button>
		</c:if>
		</p>
	</div>
</div>
</body>
</html>