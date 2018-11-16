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
<script>
	window.oncontextmenu = function() {
		return false;
	};
	
	var scheduleID;
	
	//스케줄 마우스 클릭 이벤트
	$(function() {
		
		var test = document.getElementById("schedule-menus");
		
		$(document).on("mousedown", ".scheduleClick", function() {
			if ((event.button == 2) || (event.which == 3)) {
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
					if (title) {
						$.ajax({
							url : "/consulting/insertSchedule",
							method : "post",
							contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
							dataType : "json", // server로 부터 받을 data type
							data : { "cpss_title" : encodeURI(title),
								"cpss_content" : encodeURI(content),
								"start" : JSON.stringify(start._d),
								"end" : JSON.stringify(end._d)
							}, // 전송할 json 문자열
							success : function(e){
								$("#calendar").fullCalendar("destroy");
								renderCalendar();
							}
						});
// 						$("#calendar").fullCalendar("destroy");
// 						renderCalendar();
					}},
				editable : false,
				eventLimit : true, // allow "more" link when too many events
				events : function(start, end, timezone, callback) {
					var pro_num = $("#pro_num").val();
					$.ajax({
						url : "/consulting/searchSchedule",
						method : "post",
						contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
						dataType : "json", // server로 부터 받을 data type
						data : { "pro_num" : pro_num }, // 전송할 json 문자열
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
		
		$(".scheduleOut").on("click", function () {
			var test = document.getElementById("schedule-menus");
			var pro_num = $("#pro_num").val();
			test.style.display = "none";
			
			$.ajax({
				url : "/consulting/searchSchedule",
				method : "post",
				contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
				dataType : "json", // server로 부터 받을 data type
				data : { "scheduleID" : scheduleID, "pro_num":pro_num }, // 전송할 json 문자열
				success : function(data) {
					$("#calendar").fullCalendar("destroy");
					renderCalendar();
				}
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

#st {
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
	width: 200px;
	border: 1px solid #ffffff;
	height: 40px;
}

.table-fixed thead tr th {
	width: 200px;
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

</style>
<div class="container">
	<input type="hidden" id="pro_num" value="${proVo.pro_num}"/>
	<div>
		<h3 style="margin-left: 5%">나의일정</h3>
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
	</div>
	<br><br>

	<!--  우클릭 메뉴 -->
	
	<div id="scheduleText" style="position: absolute;">
		<textarea rows="5" cols="30" id="Stext" style="background-color: #2e2e2e; color: white; text-align: top; padding: 20px; font-size: 15px;"></textarea>
	</div>

	<div id="schedule-menus" class="context-menus-LJH">
		<ul>
			<li class="scheduleOut">일정 삭제</li>
		</ul>
	</div>
</div>