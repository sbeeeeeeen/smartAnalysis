<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="/board/style.css" rel="stylesheet">
<body>
<div id="UserCenterCtrl" ng-include="" src="templateUrl" class="ng-scope" style="opacity: 1;">

	<div class="container ng-scope">
		<div class="page-header">
			<h2>컨설팅 신청내역</h2>
		</div>
	</div>

<div class="container ng-scope" data-ng-controller="UserCenterNoticeCtrl">
	<div class="helpwrap">
		<div class="help info">
			<ul>
				<pre style="border-color: white"><li><span class="black">나의 컨설팅 신청 내역</span>을 확인 하실 수 있습니다.</li></pre>
			</ul>
		</div><!-- /.help -->
	</div><!-- /.helpwrap -->

	 <table class="table table-bordered">
        <caption class="hidden">컨설팅 상세보기</caption>
		<colgroup>
			<col style="width:10%;">
			<col style="width:90%;">
		</colgroup>
		<tbody>
        	<tr>
				<th>제목</th>
				<td class="text-left">${memberVo.mem_id}님의 컨설팅</td>
			</tr>
        	<tr>
				<th>작성일</th>
				<td class="text-left"><fmt:formatDate value="${consultingVo.cst_dt}" pattern="yyyy-MM-dd"/> </td>
			</tr>
        	<tr>
				<th>내용</th>
				<td><p align="left"><font face="돋움, 돋움체">${consultingVo.cst_content}</font></p></td>
			</tr>
		  
		</tbody>
	</table>
	
	<p class="text-center" style="margin-top: 10px;">
		<a href="javascript:history.back();" style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg">목록</a>
	</p>
	
</div>



</div>
</body>
</html>