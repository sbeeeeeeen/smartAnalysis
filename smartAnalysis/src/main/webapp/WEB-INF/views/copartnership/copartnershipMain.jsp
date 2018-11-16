<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/Moderna/js/jquery.js"></script>
<script src="/Moderna/js/bootstrap.min.js"></script>
<link href="/css/simple-sidebar.css" rel="stylesheet">

<style>
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
	border: 2px solid #68a4c4;
	margin-left: 10px;
	width: 15%;
}

#button {
    background-color: white; /* Green */
    border: none;
    color: black;
    padding: 2px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    border: 2px solid #68a4c4;
    margin-left: 10px;
    width: 15%;
}

input[type=text]{
	width:60%;
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
.inputWithIcon input[type=text]{
padding-left:40px;
}
.inputWithIcon{
position:relative;
}
.inputWithIcon i{
    position:absolute;
    left:120px;
    top:13px; 
    padding:9px 8px;
    color:#aaa;
    transition:.3s;
  }

.inputWithIcon input[type=text]:focus +i{
color: #68a4c4;
}

thead{
font-size: 15px;
}

.y{
color: #ff7e00;
}

.g{
color: #00ab33;
}

.click td:nth-child(6){
	text-align: center;
}

.click {
	height: 60px;
}

.table tbody tr td{
	vertical-align: middle;
}

.table thead tr th{
	vertical-align: middle;
    border-bottom: 2px solid #ddd;
    height: 50px;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(function(){
		jQuery('#cshipintromenu').hide();
	})

	var test = document.getElementById("cshipintromenu");
	function introOver(content){
		var text = document.getElementById("cshipintromenu");
		text.style.top = event.y-100 + "px";
	    text.style.left = event.x-350 + "px";
	    $('textarea[id=Stext]').val(content);
		jQuery('#cshipintromenu').show();
	}

	function introOut(){
		jQuery('#cshipintromenu').hide();
	}

</script>
<form id="frm" action="/copartnership/detailCopartnership" method="post">
	<input type="hidden" name="id" id="id">
</form>
<div id="wrapper" class="toggled">
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
		    <li class="sidebar-brand">
		        <h4>가입현황</h4>
		    </li>
		    <c:forEach items="${joinCopartnershipList }" var="cship" >
				<li>
					<a href="#" onclick="goCship('${cship.cship_num }')">${cship.cship_name}
					<c:choose>
						<c:when test="${cship.coop_div==1 }"><i class="fa fa-leaf g"></i></c:when>
						<c:otherwise><i class="fa fa-star y"></i></c:otherwise>
					</c:choose>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<div class="container">
	<div class="page-header">
		<h2>협동조합</h2>
	</div>
		<div style="width: 60%; margin-left: 20%; float: right;" class="inputWithIcon">
			<label style="font-size: 20px; margin-right: 10px;">협동조합명</label>
			<input type="text" placeholder="협동조합 검색" id="search" name="search">
			<i class="fa fa-search fa-lg fa-fw" aria-hidden="true"></i>
			<input type="button" value="상세검색" id="button">
		</div>
	<div class="col-6">
	</div>
		<h5>
			전체 <span class="point ng-binding" id="cnt">${totCnt}</span>건
		</h5>
		<table class="table table-striped">
			<thead style="background-color: #68a4c4; color: #ffffff">
				<tr>
					<th>번호</th>
					<th>협동조합명</th>
					<th>업종</th>
					<th>인원</th>
					<th>설립일</th>
					<th style="text-align: center;">가입여부</th>
				</tr>
			</thead>
			<tbody id="dataList">
				<c:forEach items="${copartnershipList }" var="list">
					<tr class="click" onmouseover="introOver('${list.cship_intro }')" onmouseout="introOut()">
						<td>${list.cship_num }</td>
						<td>
							${list.cship_name }
							<c:if test="${list.cship_type=='1' }"><i class="fa fa-check g"></i></c:if>
						</td>
						<td>${list.ind_s}</td>
						<td>${list.cship_cnt }</td>
						<td><fmt:formatDate value="${list.cship_dt }" pattern="yyyy-MM-dd"/></td>
						<td id="${list.cship_num }">
							<c:choose>
								<c:when test="${list.coop_div==null||list.coop_div==0 }">
								<input type="button" value="가입하기" data-id="${list.cship_num }" id="joinCopartnership" class="btn btn-info"></c:when>
								<c:when test="${list.coop_div==1 }">회원</c:when>
								<c:when test="${list.coop_div==2 }">협회장</c:when>
								<c:when test="${list.coop_div==3 }">승인대기</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="text-center">
		<ul class="pagination">
			<%=request.getAttribute("pageNavi")%>
		</ul>
	</div>
	<input type="button" onclick="insertcopartnership()" value="협동조합 생성" id="st" class="btn btn-primary">
	
	<div id="cshipintromenu" style="position: absolute;">
		<textarea rows="5" cols="30" id="Stext" style="background-color: white; color: black; text-align: top; padding: 20px; font-size: 15px;"></textarea>
	</div>
	<input type="hidden" value="${memberVo.ind_code }" id="memberVo">
	<script>
	function insertcopartnership(){
		window.open("/copartnership/insertCopartnership","","width=683,height=780,left=500");
	}
		
	function goCship(cship_id, coop_div){
		$("#id").val(cship_id);
		$("#frm").submit();
	}
	
	$(function() {
		if(!$("#memberVo").val()){
			alert("협동조합을 이용할 수 없는 회원입니다.");
			history.back();
		}
		
		$(document).on("click","#joinCopartnership", function(event){
			var id= $(this).data("id");
			$.ajax({
				url : "/copartnership/insertCooperative",
				method : "post",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				data : {"cship_num":id},
				success : function(){
					swal({
						icon:"success",
						title:"가입신청하였습니다"
					});
					$("#"+id).text("승인대기");
				}
			});
		});
		
		
		
		$("#button").on("click", function() {
			
			var search = $("#search").val();
				$.ajax({
					url : "/copartnership/searchCopartnershipList",
					method : "post",
					contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
					dataType : "json", // server로 부터 받을 data type
					data : { "search" : encodeURI(search) }, // 전송할 json 문자열
					success : function(data) {
						
						var results = "";
						console.log(data.resultMap.pageNavi);
							$.each(data.resultMap.copartnershipList, function(index, value){
								results += "<tr data-id=" + value.cship_num + " class=\"click\" onmouseover=\"introOver('"+value.cship_intro+"')\" onmouseout=\"introOut()\">";
								results += "<td>" + value.cship_num +"</td>";
								results += "<td>" + value.cship_name;
								if(value.cship_type=="1"){
									results+="<i class=\"fa fa-check g\"></i>";
								}
								results += "</td>";
								results += "<td>" + value.ind_s + "</td>";
								results += "<td>" + value.cship_cnt + "</td>";
								results += "<td>" + value.cship_dt + "</td>";
								results += "<td>";
								switch(value.coop_div){
								case "1":
									results += "회원";
									break;
								case "2":
									results += "협회장";
									break;
								case "3":
									results += "승인대기";
									break;
								default:
									results += "<input type=\"button\" value=\"가입하기\" id=\"joinCopartnership\" class=\"btn btn-info\" ";
									break;
								}
								results += "</td>";
								results += "</tr>";
							})
						$("#cnt").html(data.resultMap.totCnt);
						$(".pagination").html(data.resultMap.pageNavi);
						$("#dataList").html(results);
					}

				});
			});
		
		$(document).on("click",".copartnerPageNavi", function() {
			var search = $("#search").val();
			
			var page = $(this).data("page");
			var pagesize = $(this).data("pagesize");
// 			console.log($(this).data("search"));
			
				$.ajax({
					url : "/copartnership/pageNavi",
					method : "post",
					contentType : "application/json; charset=utf-8", // json전송을 알려주는 contentType
					dataType : "json", // server로 부터 받을 data type
					data : { "page" : page, "pageSize" : pagesize,
						"search" : encodeURI(search) }, // 전송할 json 문자열
					success : function(data) {
						console.log(data);
						var results = "";
							$.each(data.resultMap.copartnershipList, function(index, value){
								results += "<tr data-id=" + value.cship_num + " class=\"click\" onmouseover=\"introOver('"+value.cship_intro+"')\" onmouseout=\"introOut()\">";
								results += "<td>" + value.cship_num +"</td>";
								results += "<td>" + value.cship_name;
								if(value.cship_type=="1"){
									results+="<i class=\"fa fa-check g\"></i>";
								}
								results += "</td>";
								results += "<td>" + value.ind_s + "</td>";
								results += "<td>" + value.cship_cnt + "</td>";
								results += "<td>" + value.cship_dt + "</td>";
								results += "<td>";
								switch(value.coop_div){
								case "1":
									results += "회원";
									break;
								case "2":
									results += "협회장";
									break;
								case "3":
									results += "승인대기";
									break;
								default:
									results += "<input type=\"button\" value=\"가입하기\" data-intro=\""+value.cship_intro+"\" id=\"joinCopartnership\" class=\"btn btn-info\" >";
									break;
								}
								results += "</td>";
								results += "</tr>";
							})
						$("#dataList").html(results);
						$(".pagination").html(data.resultMap.pageNavi);
					}

				});
			});

		
	});
</script>
</div>


