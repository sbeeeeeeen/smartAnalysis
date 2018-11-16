<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>

 .categorylist li{ 
 	display: inline-block;
 	padding-right: 30px;
 } 

 #ujsListDiv { 
 	display: inline-block;
	
 } 
 .categorylist { 
     clear: both; 
     margin: 15px 0; 
     padding: 0; 
     height: 270px; 
     overflow-y: auto; 
     overflow-x: hidden; 
 } 

</style>

	<!-- <input type="hidden" value="" id="imgSrc" name="imgSrc" /> -->
	<!-- /profit/result -->

<form class="form-inline ng-pristine ng-valid" id="frm" action="/profit/result" method="post">
<div class="container">
	<div class="page-header">
		<h2>수익분석</h2>
	</div>
	<div class="row">
		<div class="col-lg-4 b">
			<div class="panel-group wrap" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse"
							   data-parent="#accordion" href="#collapseOne"
							   aria-expanded="true" aria-controls="collapseOne">
								<strong>[1단계]</strong>지역선택
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<input type="text" placeholder="주소(행정동)를 입력하세요." id="reg" class="map-search-input">
							<button onclick="searchReg()" class="btn theme map-search-btn"><i class="fa fa-search"></i></button>
							<p>예) 대전, 대전 중구, 은행선화동 등</p>
							<div id="regList">
							</div>
						</div>
					</div>
				</div>
				<!-- end of panel -->
				<div class="panel">
					<div class="panel-heading" role="tab" id="headingTwo" onclick="draw('mar')">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								<strong>[2단계]</strong>위치선택
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<div class="map-box">
								<h5>평가하려는 위치를 클릭하세요</h5>
								<br >
							</div>
							<div id="mapSelectAddr">
							</div>
						</div>
					</div>
				</div>
				<!-- end of panel -->
				
				<div class="panel">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> <strong>[3단계]</strong>
								업종선택
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							<h5>1개의 업종만 선택가능합니다</h5><p></p>
							<button id="ujpop" class="upjongpop"><i class="fa fa-chevron-circle-down"></i>업종을 선택해주세요</button>
							<div id="upjongselect">
							</div>
						</div>	
					</div>
				</div>
				<!-- end of panel -->
				<!-- 업종선택팝업 -->
				<div id="divpop" class="pop-layer">
					<div style="height: 20%;">
						<h4 style="text-align: center; border-bottom: 1px solid #ccc; padding: 10px; margin: 5px;">업종선택</h4>
					</div>
						<%@include file="divpop.jsp" %>
				</div>
				<!-- end 업종선택팝업 -->

				<div class="panel">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour"> <strong>[4단계]</strong>
								비용입력
							</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">
							<button id="profitpop" class="upjongpop"><i class="fa fa-chevron-circle-down"></i>비용을 입력해주세요</button>
						</div>
					</div>
				</div>
				
				<!-- 비용입력팝업 -->
				<div id="profitPop" class="pop-layer">
					<div style="height: 20%;">
						<h4 style="text-align: center; border-bottom: 1px solid #ccc; padding: 10px; margin: 5px;">비용입력</h4>
					</div>
						<%@include file="profitpop.jsp" %>
				</div>
			</div>
			<!-- end of #accordion -->
			<div class="selectBtm">
				<a href="/profit/proSelect" class="btn abtn" style="background:#8b99a3">초기화</a>
				<button id="sendForm" class="btn abtn" style="background: #68A4C4;" name="btn" value="sendForm">분석하기</button>
			</div>
		</div>
		<!-- end of wrap -->
		<div class="col-lg-8">
			<div id="map" class="b"></div>
		</div>
		
	</div>
</div>
</form>

<!-- end of container -->

<script type="text/javascript">
	var userSelectAddr; //사용자가 선택한 주소
	var latlng; //사용자가 클릭한 지도 좌표(다각은 가운데꺼) 얘는 안넘김
	var latlngs = new Array(); //다각이 찍는 좌표 여러개라서 만들어놓는 배열 ㅠ 요거 넘겨야돼
	var ujcode;			//사용자가 선택한 업종 코드가져오는 변수
	var isSubmitted = false; //분석하기 중복클릭 막으려고 만든 변수
	var ujselectStr;
	var proPopChk;
	
	$("#sendForm").on("click", function(){
		//유효성검사하고
		if(userSelectAddr==null){
			swal('warning', '위치를 선택하세요', 'warning')
			return;
		}
		if(ujcode==null){
			swal('warning', '업종을 선택하세요', 'warning')
			return;
		}
		
		if(proPopChk==null){
			swal('warning', '비용을 입력하세요', 'warning')
			return;
			
		}
		console.log("주소="+userSelectAddr);
		console.log("latlngs = " + latlngs);
		console.log("ujcode="+ujcode);
		
		//폼 전송할때 가져가야 할 값이
		// 선택한곳 주소&좌표값
		// 소분류 업종코드
		// 비용입력 값들 
		var latlngJson = new Object();
		var tempList = new Array();
		
		$.each(latlngs, function(index, value){
			var latlngObject = new Object();
			latlngObject.lng = value.getLng();
			latlngObject.lat = value.getLat();
			tempList.push(latlngObject);
		});
		latlngJson.latlng = tempList;
		console.log(JSON.stringify(latlngJson));
		
		$('#frm').append(
				$('<input/>').attr('type', 'hidden').attr('name','latlngJson').attr('value',JSON.stringify(latlngJson))
		);
		
		var addr;
		addr = document.createElement("input");
		addr.type="hidden";
		addr.name="addr";
		addr.value=userSelectAddr;
		document.getElementById('frm').appendChild(addr);
		
		var code;
		code = document.createElement("input");
		code.type="hidden";
		code.name="ujcode";
		code.value = ujcode;
		document.getElementById('frm').appendChild(code);
		
		var ujStr;
		ujStr = document.createElement("input");
		ujStr.type ="hidden";
		ujStr.name="ujStr";
		ujStr.value=ujselectStr;
		document.getElementById('frm').appendChild(ujStr);
		

		$('#frm').submit(); 
		
		if(isSubmitted){
			swal('warning', '데이터를 전송중입니다.', 'warning')
			return;
		}
		isSubmitted = true;
	});
	
	
	

	//업종선택 버튼 클릭하면 업종 팝업 보여주는 메서드
	$("#ujpop").on("click", function() {
		document.all['divpop'].style.visibility = "visible";
	});
	
	//비용입력 버튼 클릭하면 비용입력 팝업 보여주는 메서드
	$("#profitpop").on("click", function() {
		document.all['LayerPopCost'].style.visibility = "visible";
		var proPopStr = $("#selectpro").val();
		proPopChk = proPopStr;

	});

	//팝업에서 확인 누르면 창닫고 선택한 업종 리스트 화면에 뿌려주는 메서드
	$("#selectuj").on("click", function() {
		ujselectStr = $('input[name="upjong"]:checked').parent().text();
		var ujselect = $('input[name="upjong"]:checked').val();
		ujcode = ujselect;
		$("#upjongselect").html(ujselectStr);
		document.all['divpop'].style.visibility = "hidden";
	})
	

	//팝업 취소 걍 숨겨주는거
	$("#close").on("click", function() {
		document.all['divpop'].style.visibility = "hidden";
	})
	//팝업 취소 걍 숨겨주는거
	$("#proclose").on("click", function() {
		document.all['LayerPopCost'].style.visibility = "hidden";
	})


	//지도 만들어줌
	var mapContainer = document.getElementById('map'), mapOption = {
		center : new daum.maps.LatLng(36.3250417, 127.4179621), //좌표는 개발원으로 찍었음
		level : 3
	};

	var map = new daum.maps.Map(mapContainer, mapOption);
	var mapTypeControl = new daum.maps.MapTypeControl();
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	//주소 DB에서 검색해서 리스트 뿌려주는 메서드
	function searchReg() {
		var reg = document.getElementById("reg").value;
		$.ajax({
			url : "/map/getreg",
			dataType : "JSON",
			method : "post",
// 			contentType:"application/json; charset=utf-8",
			data : {
				"reg" : encodeURI(reg)
			},
			success : function(data) {
				var myHTMLStr = '<h5>총 ' + Object.keys(data).length
						+ '건 </h5><ul class=\"regInfo\">';
				for ( var i in data) {
					myHTMLStr += '<li data-id=\"' + data[i]['REG_CODE'] + '\">'
							+ data[i]['REG_NAME'] + '</li>';
				}
				myHTMLStr += '</ul>';
				document.getElementById('regList').innerHTML = myHTMLStr;
			},
			error : function() {
				swal('ERROR', '에러발생', 'error')
			}
		});
	}

	//주소 검색해서 나온 리스트 클릭하면 해당 주소로 지도 옮겨주는 메서드
	$("#regList").on("click", "li", function() {
		var geocoder = new daum.maps.services.Geocoder();
		var addr = $(this).text();
		geocoder.addressSearch(addr, function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				map.setCenter(coords);
			}
		});
	});

	//지도 그리는 상태 알려주는 변수, 지울 때 가지고있을 변수, 폼으로 넘겨줄 변수 등등
	var drawingFlag = false; // 그려지고 있는 상태를 가지고 있을 변수입니다
	var events = []; //지도 클릭이나 무브 이벤트 담아놓고 다른거 클릭하면 지우려고 만든 배열
	var geocoder;
	var info;
	var circleInfo;
	//^ 다른거 클릭했을때 기존에 영역 설정한거 지우려고 만든 변수..
	//마커랑 다각은 같이 담을 수 있는데 반경이 배열이라 따로 만들었음

	//지도에 그려놓은거 다른거 클릭했을때 지우려고 만든 메서드..계속 지워야해서 아예 빼놓음
	function removeInfo() {
		if (circleInfo != null) { //반경 그린거 지워주는거
			for ( var key in circleInfo) {
				circleInfo[key].setMap(null);
			}
		}
		if (info != null) { //마커아니면 다각 그린거 가지고 있음
			info.setMap(null)
		}
	}

	//이벤트도 계속 지워야해서 빼놓았음
	function removeEvents() {
		if (events.length >= 1) {
			events.forEach(function(e) {
				daum.maps.event.removeListener(e.target, e.type, e.handler);
			});
			events.length = 0;
		}
	}

	// 좌표 찍은거 주소 찍을때 맨처음 보내주는 메서드
	function addrInfo() {
		geocoder = new daum.maps.services.Geocoder();
		searchAddrFromCoords(latlng, displayInfo);
	}

	// 좌표로 행정동 주소 정보를 요청
	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	// 클릭 좌표에 대한 주소정보를 표출하는 함수
	function displayInfo(result, status) {
		if (status === daum.maps.services.Status.OK) {
			for (var i = 0; i < result.length; i++) {
				if (result[i].region_type === 'H') {
					userSelectAddr = result[i].address_name;
					$("#mapSelectAddr").text(userSelectAddr);
					break;
				}
			}
		}
	}
	
	//지도 마커 
	function draw(index) {
		var mapevent; //이벤트 계속 넣어줘야해서 하나 만들어놓음
		if (index == 'mar') {//마커 클릭하면
			removeInfo(); //일단 전에 그려놓은거있으면 지움
			removeEvents(); //이벤트도 다 날려

			//마커 만들어서 지도 가운데에 넣어줌
			var marker = info = new daum.maps.Marker({
				position : latlng = map.getCenter()
			});
			latlngs.push(latlng);
			marker.setMap(map);
			addrInfo();

			daum.maps.event.addListener(map, 'click', mapevent = function(mouseEvent) {
				latlngs = [];
				// 클릭한 위도, 경도 정보
				latlng = mouseEvent.latLng;
				latlngs.push(latlng);

				// 마커 위치를 클릭한 위치로 옮김
				marker.setPosition(latlng); //위도 가져오려면 latlng.getLat() 경도 가져오려면 latlng.getLng()
				addrInfo();
				info = marker;
			});
			events.push({ target : map, type : 'click', handler : mapevent});
		}
	}
</script>