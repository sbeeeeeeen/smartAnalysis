<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Smart Analysis</title>
<link href="/css/layout.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/opinion.css" rel="stylesheet">
<script src="/Moderna/js/jquery.js"></script>
<script>
function opinionSubmit(){
	var content = $("#inputComment").val();
	var title = $("#inputTitle").val();
	var board_num = $("#board_num").val();
	if(title == ""){
		alert("제목을 입력하세요.");
		$("#inputTitle").focus();
		return;
	}
	if(content == ""){
		alert("내용을 입력하세요.");
		$("#inputComment").focus();
		return;
	}
	
	$.ajax({
		url : "/post/opinionSubmit"
		,contextType : "application/json;charset=UTF-8"
		,type : "get"
		,data : {
					"opinioncontent" : encodeURI(content)
					,"opinionTitle" : encodeURI(title)
					,"opinionBoard_num" : board_num
				}
		,success : function(){
			opener.parent.location.reload();
			window.close();
		}
	});
}
</script>

<div class="popup" id="receiptWrite">
	<div class="popup-header">
		<div class="row">
			<div class="col-4 col-offset-4">
				<h4>새글새글</h4>
			</div>
			<div class="col-4 text-right">
				<a class="close" href="javascript:self.close();">×</a>
			</div>
		</div>	
	</div>
	<div class="popup-body">
			<ul class="list">
				<li>협동조합원들간의 소통 공간</li>
				<li>협동조합원들만 게시할수 있고 확인할 수 있습니다.</li>
			</ul>
			<p class="clearfix"></p>
	
				<p style="border-top: 1px solid #ddd;" class="clearfix"></p>
				제목 : <input style="width: 400px;" id="inputTitle" type="text"/>
				<p class="clearfix"></p>
		<table class="table">
		<tbody>
			<tr>
				<td>
					<form class="form-inline">
						<label for="inputComment" class="sr-only">개선사항</label>
						<textarea class="form-control input-fu" style="height:200px;" id="inputComment"></textarea>
					</form>
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	<div class="popup-footer">
		<a class="btn btn-primary btm-btn" onclick="opinionSubmit();">확인</a>
		<a href="javascript:self.close();" class="btn btn-white btm-btn">취소</a>
	</div>
	<input type="hidden" value="${board_num }" id="board_num">
</div>
