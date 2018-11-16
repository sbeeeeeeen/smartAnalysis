<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/js/css/jquery-ui.min.css" />
<link href="/js/css/fullcalendar.css" rel="stylesheet" />
<link href="/js/css/fullcalendar.print.css" rel="stylesheet" media="print" />
<script src="/Moderna/js/jquery.js"></script>
<script src="/js/jquery.pagenavigator.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	window.oncontextmenu = function() {
		return false;
	};
	
	var cooperID;
	var scheduleID;
	
	// 협동조합 클릭 이벤트
	$(function() {
		var test = document.getElementById("context-menus");
		$(document).on("mousedown", ".coopClick", function() {
			if ((event.button == 2) || (event.which == 3)) {
				//tr태그의 data-id 속성 값을 읽어서 input 태그의 id 값으로 설정
				//form 태그를 submit
				
				cooperID = $(this).data("id");
				if("${cooperative.coop_div}"!="2"||("${cooperative.coop_div}"=="2"&&cooperID=="${cooperative.coop_num}")){
					$('li#memOut').hide();
				}else{
					$('li#memOut').show();
				}
				showMenu(event.x, event.y);
			}else{
				test.style.display = "none";
			}

		});
		
		/* 마우스 클릭한 지점에서 메뉴 보여줌 */
		  function showMenu(x, y) {
		    test.style.top = y-200 + "px";
		    test.style.left = x-350 + "px";
		    test.style.display = "block";
		  }
		
		  $(document).on("click", ".postClick", function(){
				//tr태그의 data-id 속성 값을 읽어서 input 태그의 id 값으로 설정
				//form 태그를 submit
				$("#id").val($(this).data("id"));
				$("#frm").submit();
			});
	});
	//스케줄 마우스 클릭 이벤트
	$(function() {
		
		var test = document.getElementById("schedule-menus");
		
		$(document).on("mousedown", ".scheduleClick", function() {
			if ((event.button == 2) || (event.which == 3)) {
				if("${cooperative.coop_div}"!="2"){
					return;
				}
				//tr태그의 data-id 속성 값을 읽어서 input 태그의 id 값으로 설정
				//form 태그를 submit
				scheduleID = $(this).data("id");
				showMenu(event.x, event.y);
			}else{
				test.style.display = "none";
			}
		});
		
		/* 마우스 클릭한 지점에서 메뉴 보여줌 */
		  function showMenu(x, y) {
		    test.style.top = y-200 + "px";
		    test.style.left = x-350 + "px";
		    test.style.display = "block";

		  }
		
	});

	$(document).ready(function() {
		jQuery('#scheduleText').hide();
		var currentLangCode = "ko";
		// build the language selector"s options
		$.each(
			$.fullCalendar.langs,
			function(langCode) {
				$("#lang-selector").append(
					$("<option/>").attr("value", langCode).prop("selected", langCode == currentLangCode).text(langCode));
			});

		// rerender the calendar when the selected option changes
		$("#lang-selector").on("change", function() {
			if (this.value) {
				currentLangCode = this.value;
				$("#calendar").fullCalendar("destroy");
				renderCalendar();
			}

		});

		function renderCalendar() {
			$("#calendar").fullCalendar({
				header : {
					left : "prev,next today",
					center : "title",
					right : "month,agendaWeek,agendaDay"
				},
				defaultDate : new Date(),
				lang : currentLangCode,
				selectable : true,
				selectHelper : true,
				select : function(start, end) {
					var title = prompt("일정 추가:");
					var content = prompt("일정 내용 : ");
					var cship_num = $("#cship_num").val();
					var eventData;
					if (title) {
						$.ajax({
							url : "/copartnership/inputSchedule",
							method : "post",
							contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
							dataType : "json", // server로 부터 받을 data type
							data : { "cpss_title" : encodeURI(title),
								"cpss_content" : encodeURI(content),
								"start" : JSON.stringify(start._d),
								"end" : JSON.stringify(end._d),
								"cship_num" : cship_num
								} // 전송할 json 문자열
						});
						$("#calendar").fullCalendar("destroy");
						renderCalendar();
					}},
				editable : false,
				eventLimit : true, // allow "more" link when too many events
				events : function(start, end, timezone, callback) {
					var cship_num = $("#cship_num").val();
					$.ajax({
						url : "/copartnership/searchSchedule",
						method : "post",
						contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
						dataType : "json", // server로 부터 받을 data type
						data : { "id" : cship_num }, // 전송할 json 문자열
						success : function(data) {
			                var events = [];
			                if(!!data.scheduleList){
			                    $.map( data.scheduleList, function( r ) {
			                        events.push({
			                            title: r.cpss_title,
			                            start: r.cpss_Sdt,
			                            end: r.cpss_Edt
			                        });
			                    });
			                }
			                callback(events);
			                var results = "";
			                $.each(data.scheduleList, function(index, value){
			                	var split = value.cpss_Sdt.split(" ");
								results += "<tr data-id=" + value.cpss_num + " class=\"scheduleClick\"; onmouseover=\"scheduleOver('"+value.cpss_content+"');\" onmouseout=\"scheduleOut()\">";
								results += "<td>" + split[0] +"</td>";
								results += "<td>" + value.cpss_title + "</td>";
								results += "</tr>";
							})

							for(var i = 14-data.scheduleList.length; i > 0; i--){
								results += "<tr>";
								results += "<td></td>";
								results += "<td></td>";
								results += "</tr>";
							}
							$("#schedule").html(results);
						}
					});
					}
			});
		}
		renderCalendar();
		
		$(".memOut").on("click", function () {
			var test = document.getElementById("context-menus");
			var id = $("#cship_num").val();
			test.style.display = "none";
			$.ajax({
				url : "/copartnership/delectCooperative",
				method : "post",
				contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
				dataType : "json", // server로 부터 받을 data type
				data : { "cooperID" : cooperID, "id":id }, // 전송할 json 문자열
				success : function(data) {
					var results = "";
						$.each(data.cooperativeList, function(index, value){
							results += "<tr data-id=" + value.coop_num + " class=\"coopClick\">";
							results += "<td>" + value.mem_id +"</td>";
							if(value.coop_div == '1'){
								results += "<td>협동조합원</td>";
							}else{
								results += "<td>협동조합장</td>";
							}
							results += "</tr>";
						})
						for(var i = 14-data.cooperativeList.length; i > 0; i--){
							results += "<tr>";
							results += "<td></td>";
							results += "<td></td>";
							results += "</tr>";
						}
					$("#cooperativetable").html(results);
					swal({
						icon:"success",
						title:"탈퇴되었습니다"
					});
				}

			}); 
			
		});//End memOut
		
		$(".scheduleOut").on("click", function () {
			var test = document.getElementById("schedule-menus");
			var id = $("#cship_num").val();
			test.style.display = "none";
			$.ajax({
				url : "/copartnership/searchSchedule",
				method : "post",
				contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
				dataType : "json", // server로 부터 받을 data type
				data : { "scheduleID" : scheduleID, "id":id }, // 전송할 json 문자열
				success : function(data) {
					$("#calendar").fullCalendar("destroy");
					renderCalendar();
				}
			});
		});

		
		$(document).on("click",".postPageNavi", function() {
			var search = $("#search").val();
			var board_num = $(this).data("board_num");
			var page = $(this).data("page");
			var pagesize = $(this).data("pagesize");
			var sta = true;
			if(!page){
				page = 1;
				pagesize = 10;
				board_num = $("#cship_num").val();
				sta = false;
			}
			
			console.log(page);
			console.log(pagesize);
			console.log(search);
			console.log(board_num);
			$.ajax({
				url : "/copartnership/pageNavi",
				method : "post",
				contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
				dataType : "json", // server로 부터 받을 data type
				data : { "page" : page, "pageSize" : pagesize, "board_num" : board_num,
					"search" : encodeURI(search), "sta" : encodeURI(sta)}, // 전송할 json 문자열
				success : function(data) {
					var results = "";
						$.each(data.resultMap.pageList, function(index, value){
							results += "<tr data-id=" + value.post_num + " class=\"postClick\">";
							results += "<td>" + value.post_num +"</td>";
							results += "<td>" + value.post_title + "</td>";
							results += "<td>" + value.mem_id + "</td>";
							results += "<td>" + value.post_dt + "</td>";
							results += "</tr>";
						})
					$("#dataList").html(results);
					$(".pagination").html(data.resultMap.pageNavi);
				},
				
			});
		});
		
		
	});
	
	function scheduleOver(content){
		var text = document.getElementById("scheduleText");
		
		text.style.top = event.y-200 + "px";
	    text.style.left = event.x-350 + "px";
	    $('textarea[id=Stext]').val("일정내용\n\n"+content);
	    
		jQuery('#scheduleText').show();
		
	}
	
	function scheduleOut(){
		jQuery('#scheduleText').hide();
	}
	
	function owindow(){
		window.open("/post/insertpost?board_num="+$("#cship_num").val(),"","width=510,height=485,left=500");
	}
	
	$(document).on("click", "#memst", function() {
		document.all['divpop'].style.visibility = "visible";
	});	
	
	$(document).on("click", ".memView", function(){
		var test = document.getElementById("context-menus");
		test.style.display = "none";
		document.all['memDetail'].style.visibility = "visible";
		$.ajax({
			url : "/copartnership/getMemDetail",
			method : "post",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : {"cooperID" : cooperID},
			success : function(data){
				var mem_id = "<label class=\"memtext\">"+data.memberVo.mem_id+"</label>";
				var name = "<label class=\"memtext\">"+data.memberVo.mem_name+"</label>";
				var email = "<label class=\"memtext\">"+data.memberVo.mem_email+"</label>";
				var ind = "<label class=\"memtext\">"+data.memberVo.ind_code+"</label>";
				$("#mem_id").html(mem_id);
				$("#name").html(name);
				$("#email").html(email);
				$("#ind").html(ind);
			}
		});
	})
	
	$(document).on("click", "#checkDetail", function(){
		document.all['memDetail'].style.visibility = "hidden";
	})
	
	$(document).on("click", "#selectuj", function() {
		document.all['divpop'].style.visibility = "hidden";
	});
	
	$(document).on("click", "#secession", function(){
		swal({
			icon : "warning",
			title : "협동조합 탈퇴",
			text : "정말 ${copartnership.cship_name } 협동조합을 탈퇴하시겠습니까?",
		  	dangerMode: true,
			buttons: true,
			})
			.then((willDelete) => {
				if (willDelete) {
				  swal("${copartnership.cship_name } 협동조합 탈퇴 되었습니다. ㅃ2", {
				    icon: "success",
				  });
				var form = document.removefrm;
				var cship_num = $("#cship_num").val();
				form.action = "/copartnership/remove?cship_num="+cship_num;
				$("#removefrm").submit();
				}
			});
			
	});
	
	function updateCooperative(mem_id){
		$.ajax({
			url : "/copartnership/updateCooperative",
			method: "post",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : {"mem_id" : mem_id
					,"cship_num" : $("#cship_num").val()
					,"coop_div" : '1'
					},
			success : function(data){
				swal({
					icon:"success",
					title:"승인되었습니다"
				});
				var results = "";
				$.each(data.cooperativeList, function(index, value){
					results += "<tr data-id=" + value.coop_num + " class=\"coopClick\">";
					results += "<td>" + value.mem_id +"</td>";
					if(value.coop_div == '1'){
						results += "<td>협동조합원</td>";
					}else{
						results += "<td>협동조합장</td>";
					}
					results += "</tr>";
				})
				for(var i = 14-data.cooperativeList.length; i > 0; i--){
					results += "<tr>";
					results += "<td></td>";
					results += "<td></td>";
					results += "</tr>";
				}
				$("#cooperativetable").html(results);
				
				results = "";
				$.each(data.standbycooperativeList, function(index, value){
					results += "<tr><td>"+(index+1)+"</td>";
					results += "<td>"+value.mem_id+"</td>";
					results += "<td>"+value.mem_name+"</td>";
					results += "<td>"+value.ind_code+"</td>";
					results += "<td>"+value.mem_email+"</td>";
					results += "<td>"+value.mem_call+"</td>";
					results += "<td><input type=button id=updateCooperative data-id="+value.mem_id+" class=btn btn-primary value=승인></td></tr>";
				});
				$("#standbyCooperativetbody").html(results);
				
			}
		});
	}
		
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#st,#memst {
	float: right;
	background-color: white; /* Green */
	border: none;
	color: black;
	padding: 2px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
	border: 2px solid #555555;
	margin-left: 10px;
	width: 15%;
}

.inputWithIcon input[type=text]{
padding-left:40px;
}

tbody tr {
	height: 40px;
}

.table-fixed tbody tr:nth-child(even) {
	background: #d2d2d2;
}

.table-fixed tbody tr:nth-child(odd) {
	background: #f2f2f2;
}

.table-fixed {
	width: 100%;
	background-color: #2e2e2e;
}

.table-fixed tbody {
	height: 560px;
	overflow-y: auto;
	width: 100%;
}

.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td,
	.table-fixed th {
	text-align: center;
	display: block;
}

.table-fixed tbody td {
	float: left;
	width: 100px;
	border: 1px solid #ffffff;
	height: 40px;
}

.table-fixed thead tr th {
	width: 100px;
	float: left;
	background-color: #2e2e2e;
	border-color: #2e2e2e;
	color: white;
}

.context-menus-LJH {
  position: absolute;
  display: none;
  width: 120px;
  background-color: white;
  text-align: center;
}

.context-menus-LJH ul li {
	list-style: none;
	padding: 10px;
}
.context-menus-LJH ul li:HOVER{
	background-color: #a3a3d1;
}
.context-menus-LJH ul {
	margin-left: 0;
	margin-bottom: 0;
}

input[type=text]{
	width:70%;
	boarder:2px solid #aaa;
	boarder-radius:4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing:boarder-box;
	transition:.3s;
}

input[type=text]:focus{
	border-color: dodgerBlue;
	box-shadow:0 0 8px 0 #68a4c4;
}

.inputWithIcon{
width : 35%;
position:relative;
}
.inputWithIcon i{
    position:absolute;
    left:10px;
    top:13px; 
    padding:9px 8px;
    color:#aaa;
    transition:.3s;
  }

.inputWithIcon input[type=text]:focus +i{
color: #68a4c4;
}

.mem-pop-layer{
	border:1px solid #ccc;
	position: absolute;
    left: 400px;
    top: 80px;
    z-index: 200;
    width: 350px;
    height: 350px;
	visibility: hidden; 
	align:center; 
	background-color:white;
}

.pop-layer {
	border:1px solid #ccc;
	position: absolute;
    left: 300px;
    top: 80px;
    z-index: 200;
    width: 650px;
    height: 400px;
	visibility: hidden; 
	align:center; 
	background-color:white;
}

.pop-layer h4{
	text-align:center; 
	border-bottom: 1px solid #ccc; 
	padding: 10px; 
	margin: 5px;
}

.pop-layer table{
	display: block;
    border-collapse: collapse;
	width: 630px;
	margin: 10px;
	text-align: center;
}

.pop-layer thead tr th {
	text-align: center;
}

.pop-layer tbody {
	width: 630px;
	display: block;
	overflow: auto;
	height: 278px;
}

.pop-layer th:nth-of-type(1), .pop-layer td:nth-of-type(1) { width: 40px; }
.pop-layer th:nth-of-type(2), .pop-layer td:nth-of-type(2) { width: 80px; }
.pop-layer th:nth-of-type(3), .pop-layer td:nth-of-type(3) { width: 100px; }
.pop-layer th:nth-of-type(4), .pop-layer td:nth-of-type(4) { width: 100px; }
.pop-layer th:nth-of-type(5), .pop-layer td:nth-of-type(5) { width: 100px; }
.pop-layer th:nth-of-type(6), .pop-layer td:nth-of-type(6) { width: 100px; }
.pop-layer th:last-child { width: 100px; }
.pop-layer td:last-child { width: calc( 100px - 19px );  }

.layer-pop-footer {
	width: 100%;
	vertical-align: middle;
	margin-left: auto;
	margin-right: auto;
	padding: 12px;
	text-align: center;
}

.layer-pop-footer ul {
	width: 90px;
	height: 30px;
	margin: 0 auto
}
.layer-pop-footer ul li {
	text-align:center;
	float: left;
	width: 80px;
	height: 30px;
	margin-left: 10px
}

.layer-pop-footer ul li:first-child {
	margin-left: 0;
}

.memInfo, .memtext{
	text-align: center;
	font-size: 14px;
}
.memInfo{
	margin-left: 20px;
}

.memInfowrap{
	margin: 20px;
}
.infowrap{
	margin: 15px
}

.Infoheader{
	text-align: center;
	padding: 10px;
	background: #6C496F;
	margin: 15px 0 40px 0;
	color: #ffffff;
}
.col-sm-6{
	float: right;
}
.btn-theme{
	border: 1px solid #6C496F;
}

</style>
<div class="container">
	<div>
		<input type="hidden" id="cship_num" value="${copartnership.cship_num }">
		<c:if test="${cooperative.coop_div eq '2'.charAt(0) }">
			<button id="memst">신청 현황</button>
		</c:if>
		
		<div id="divpop" class="pop-layer">
			<h4>신청 현황</h4>
			<div style="height:70%">
				<table>
					<thead>
						<tr>
							<th>no</th>
							<th>아이디</th>
							<th>이름</th>
							<th>업종</th>
							<th>이메일</th>
							<th>번호</th>
							<th>승인</th>
						</tr>
					</thead>
					<tbody id="standbyCooperativetbody">
						<c:forEach items="${standbycooperativeList }" var="list" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${list.mem_id }</td>
								<td>${list.mem_name }</td>
								<td>${list.ind_code }</td>
								<td>${list.mem_email }</td>
								<td>${list.mem_call }</td>
								<td><input type="button" onclick="updateCooperative('${list.mem_id }')"  class="btn btn-primary" value="승인"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="height:10%" class="layer-pop-footer">
				<ul style="text-align: center;">
					<li id="selectuj" class="btn btn-theme" style="background:#546799;">확인</li>
				</ul>
			</div>
		</div>
		
		<c:if test="${cooperative.coop_div ne '2'.charAt(0) }">
			<button id="secession" style="float: right;" class="btn btn-warning">협동조합 탈퇴</button>
		</c:if>
		<h3 style="margin-left: 5%">${copartnership.cship_name } </h3>
	</div>
	<div style="display: flex; justify-content: space-between;">
		<!-- 캘린더 -->
		<div style=" width: 60%;">
			<div id="top" style="background: #2e2e2e">
				<a>Language:</a> <select id="lang-selector"></select>
			</div>
			<div id="calendar"></div>
		</div>


		<!-- 일정 -->
		<div>
			<table class="table table-fixed">
				<thead>
					<tr>
						<th>날짜</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody id = "schedule">
				</tbody>
			</table>
		</div>
		
		<!-- 조합원 -->
		<input type="hidden" name="coop_num" id="coop_num">
		<div>
			<table class="table table-fixed">
				<thead>
					<tr>
						<th>협합원</th>
						<th>직급</th>
					</tr>
				</thead>

				<tbody id="cooperativetable">
					<c:forEach items="${cooperativeList }" var="list">
						<c:if test="${list.coop_div ne '3'.charAt(0) }">
							<tr data-id="${list.coop_num }" class="coopClick" id="coopClick">
								<td>${list.mem_id }</td>
								<td><c:choose>
									<c:when test="${list.coop_div == '1'.charAt(0) }">협동조합원</c:when>
									<c:when test="${list.coop_div == '2'.charAt(0) }">협동조합장</c:when>
								</c:choose></td>
							</tr>
						</c:if>
					</c:forEach>
					<c:if test="${fn:length(cooperativeList) lt 14}">
						<c:forEach begin="${fn:length(cooperativeList) }" end="13">
							<tr>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	
	<h3 style="margin-left: 5%; float: left;">게시판</h3>
	<h5 style="float: right; margin-top: 30px;">
		전체 <span class="point ng-binding" id="cnt">${totCnt}</span>건
	</h5>
	<div>
		<table class="table table-striped" style="width: 100%">
			<thead style="background: #2e2e2e; color: #ffffff">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="dataList">
				<c:forEach items="${pageList }" var="list">
					<c:if test="${list.post_del eq 'n' }">
						<tr data-id="${list.post_num}" class="postClick">
							<td>${list.post_num}</td>
							<td>${list.post_title}</td>
							<td>${list.mem_id}</td>
							<td><fmt:formatDate value="${list.post_dt}" pattern="yyyy-MM-dd"/> </td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
	<div class="text-center">
		<ul class="pagination">
			<%=request.getAttribute("pageNavi")%>
		</ul>
	</div>
		
	
	<div class="inputWithIcon" style="float: left;">
		<input type="text" id="search" placeholder="게시글 검색">
		<i class="fa fa-search fa-lg fa-fw" aria-hidden="true"></i>
		<input type="button" class="postPageNavi" id="st" value="검색" style="height : 35px; width: 80px; margin-top: 10px;">
	</div>
	<input type="button" onclick="owindow()" value="새글 쓰기" id="st" style="height : 35px; float: right; margin-top: 10px">
	</div>

	<form id="frm" action="/post/copartnershipPostdetail" method="get">
		<input type="hidden" name="id" id="id">
	</form>
	
	<form id="removefrm" name="removefrm" method="post">
	</form>
	
	
	<!--  우클릭 메뉴 -->
	
	<div id="context-menus" class="context-menus-LJH">
		<ul id="context-menu">
			<li class="memView">회원 정보</li>
			<li class="memOut" id="memOut">회원 탈퇴</li>
		</ul>
	</div>
	
	<div id="memDetail" class="mem-pop-layer">
		<h4 class="Infoheader">회원 정보</h4>
		<div class="memInfowrap">
			<div class="infowrap">
				<label class="memInfo">아이디</label>
				<div class="col-sm-6" id="mem_id">
				</div>
			</div>
			<div class="infowrap">
				<label class="memInfo">이름</label>
				<div class="col-sm-6" id="name">
				</div>
			</div>
			<div class="infowrap">
				<label class="memInfo">이메일</label>
				<div class="col-sm-6" id="email">
				</div>
			</div>
			<div class="infowrap">
				<label class="memInfo">업종</label>
				<div class="col-sm-6" id="ind">
				</div>
			</div>
		</div>
		
		<div style="height:10%" class="layer-pop-footer">
			<ul style="text-align: center;">
				<li id="checkDetail" class="btn btn-theme" style="background:#6C496F;">확인</li>
			</ul>
		</div>		
	</div>
	
	<div id="scheduleText" style="position: absolute;">
		<textarea rows="5" cols="30" id="Stext" style="background-color: #2e2e2e; color: white; text-align: top; padding: 20px; font-size: 15px;"></textarea>
	</div>

	<div id="schedule-menus" class="context-menus-LJH">
		<ul>
			<li class="scheduleOut">일정 삭제</li>
		</ul>
	</div>
	
</div>






