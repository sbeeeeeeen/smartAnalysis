<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/board/style.css" rel="stylesheet">
<script src="/js/jquery-1.12.4.js"></script>
</head>
<script>

function newPostSubmit(){
	var title = $("#newTitle").val();
	var content = $("#newContent").val();
	
	$("#title").val(title);
	$("#content").val(content);
	
	if(title == ""){
		alert("제목을 입력해 주세요.");
		$("#newTitle").focus();
		return;
	}
	if(content == ""){
		alert("내용을 입력해 주세요.");
		$("#newContent").focus();
		return;
	}
	
	$("#frm").submit();
}

</script>
<body>
<form action="/post/newPostSubmit" id="frm" method="post">
	<input type="hidden" name="title" id="title"/>
	<input type="hidden" name="content" id="content"/>
</form>
<div id="UserCenterCtrl" ng-include="" src="templateUrl" class="ng-scope" style="opacity: 1;">

	<div class="container ng-scope">
		<div class="page-header">
			<h2>공지사항</h2>
		</div>
	</div>

<div class="container ng-scope" data-ng-controller="UserCenterNoticeCtrl">
	<div class="helpwrap">
		<div class="help info">
			<ul>
				<pre style="border-color: white"><li><span class="black">상권정보시스템</span>의 공지사항을 확인 하실 수 있습니다.</li></pre>
			</ul>
		</div><!-- /.help -->
	</div><!-- /.helpwrap -->

	 <table class="table table-bordered">
        <caption class="hidden">공지사항 상세보기</caption>
		<colgroup>
			<col style="width:10%;">
			<col style="width:90%;">
		</colgroup>
		<tbody>
        	<tr>
				<th>제목</th>
				<td class="text-left"><input style="width: 100%;" type="text" name="newTitle" id="newTitle"/></td>
			</tr>
        	<tr>
				<th>내용</th>
				<td><p align="left"><font face="돋움, 돋움체"><textarea style="width: 100%;" rows="10" name="newContent" id="newContent"></textarea> </font></p></td>
			</tr>
		</tbody>
	</table>
	
	<p class="text-center" style="margin-top: 10px;">
		<a href="javascript:history.back();" style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg">목록</a>
		<a href="#" onclick="newPostSubmit()" style="background-color: #2e2e2e; color: white;" class="btn-secondary btn-lg">등록</a>
	</p>
</div>

</div>
</body>
</html>