<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.helpinfo {
	float: right;
	margin-top: 5px;
	font-size: 13px !important;
	color: #555 !important;
	font-weight: 400 !important;
	letter-spacing: -0.25px;
	display: inline-block;
	vertical-align: middle;
}
</style>
<form id="frm" action="/future/result" method="post"></form>

<!-- container -->
<div class="container ng-scope">

	<!-- 미래지향분석 큰 글자 -->
	<div class="page-header">

		<a id="help" href="#helpPop" class="btn helpinfo"><i
			class="fa fa-question-circle" aria-hidden="true"></i><span>도움말</span></a>

		<h2>미래지향분석</h2>

	</div>

	<div id="helpPop" class="pop-layer">

		<ul>
			<li class="d"><img src="/guide2/pages/12.jpg" width="390"
				height="540"> <img src="/guide2/pages/13.jpg" width="390"
				height="540"></li>
		</ul>

		<div class="layer-pop-footer" align="center">
			<ul style="text-align: center;">
				<li id="helpClose" class="btn btn-warning">닫기</li>
			</ul>
		</div>

	</div>


	<!-- 왼쪽 탭 선택 -->
	<div class="col-lg-4 b">
		<div class="panel-group wrap" id="accordion" role="tablist"
			aria-multiselectable="true">

			<!-- 지역선택 -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> <strong>[1단계]</strong> 지역선택
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<input type="text" placeholder="주소(행정동)를 입력하세요." id="reg"
							class="map-search-input">
						<button onclick="searchReg()" class="btn theme map-search-btn">
							<i class="fa fa-search"></i>
						</button>
						<p>예) 대전, 대전 중구, 은행선화동 등</p>
						<div id="regList"></div>
					</div>
				</div>
			</div>

			<!-- 영역선택 -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> <strong>[2단계]</strong>
							영역선택
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<div class="map-box">
							<h5>선택한 영역의 상권이 분석됩니다.</h5>
							<p>분석 기준이 되는 행정동은 선택 영역의 중심 좌표입니다.</p>
							<ul>
								<li id="drawstatus" onclick="draw('mar')"><i
									class="fa fa-map-marker"></i><br>마커</li>
								<li id="drawstatus" onclick="draw('rad')"><i
									class="fa fa-dot-circle-o"></i><br>반경</li>
								<li id="drawstatus" onclick="draw('poly')"><i
									class="fa fa-square-o"></i><br>다각</li>
							</ul>
							<p style="color: #ccc">지도를 클릭해서 영역을 설정하세요. 마우스 오른쪽 버튼을 누르면 영역
								선택이 종료됩니다.</p>
						</div>
						<div id="mapSelectAddr"></div>
					</div>
				</div>
			</div>

			<!-- 업종선택 -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree"> <strong>[3단계]</strong>
							업종선택
						</a>
					</h4>
					<div id="ujselectListDiv"></div>
				</div>

				<!-- 대분류 -->
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<h5>업종은 동일분류 내(중분류 기준)에서 최대 3개까지 선택이 가능합니다.</h5>
						<p>예) 갈비/삼겹살, 기사식당, 냉면집 등</p>
						<button id="ujpop" class="upjongpop">
							<i class="fa fa-chevron-circle-down"></i>업종을 선택해주세요
						</button>
						<div id="upjongselect"></div>

						<div id="divpop" class="pop-layer">

							<div style="height: 20%;">
								<h4
									style="text-align: center; border-bottom: 1px solid #ccc; padding: 10px; margin: 5px;">업종선택</h4>
								<div id="userselectuj"></div>
							</div>


							<div style="height: 70%">
								<div id="ind_l" class="uj">
									<ol>
										<c:forEach items="${Ind_lList }" var="vo">
											<li data-id="${vo.IND_LCODE }">${vo.IND_L }</li>
										</c:forEach>
									</ol>
								</div>

								<!-- 중분류 -->
								<div id="ind_m" class="uj">중분류</div>

								<!-- 소분류 -->
								<div id="ind_s" class="uj" style="width: 34%">소분류</div>
							</div>

							<div style="height: 10%" class="layer-pop-footer">
								<ul style="text-align: center;">
									<li id="selectuj" class="btn btn-theme"
										style="background: #546799;">확인</li>
									<li id="close" class="btn btn-warning">취소</li>
								</ul>
							</div>

						</div>

					</div>
				</div>
			</div>

			<p class="clearfix"></p>
			<!-- 간격 벌리기 -->
			<div class="selectBtm">
				<a href="/future/view" class="btn abtn" style="background: #8b99a3">초기화</a>
				<button id="selectBtn" class="btn abtn" style="background: #68A4C4;">분석하기</button>
			</div>
		</div>
	</div>
	<!-- end of wrap -->
	<div class="col-lg-8">
		<div id="map" class="b"></div>
	</div>
</div>

</body>
<script>
	var userSelectAddr; // 사용자가 선택한 주소
	var latlng; //사용자가 클릭한 지도 좌표(다각은 가운데꺼) 얘는 안넘김 
	var latlngs = new Array(); //다각이 찍는 좌표 여러개라서 만들어놓는 배열 ㅠ 요거 넘겨야돼
	var circleRad; // 반경값

	var ujselectIdList = new Array(); //폼 넘길때 가져갈 업종 아이디 리스트... 

	var ujselectList = new Array(); //li 한줄값
	var temp = new Array();

	var ujlselect = ""; //나중에 다 더해야해서 lms 빼놈 변수 하나로해놓으면 바꾸기 힘들어
	var ujmselect;
	var ujsselect;

	var ujselectstr; //<ul><li></li></ul> 반복문 돌려서 넣어줄 값

	var isSubmitted = false; //분석하기 중복클릭 막으려고 만든 변수

	//대분류 클릭하면 중분류 리스트 넘겨주는 메서드
	$("#ind_l").on("click", "li", function() {

		ujlselect = $(this).text() + " > ";

		$.ajax({
			method : "post",
			data : {
				"ind_l" : $(this).data("id")
			},
			url : "/future/ind_l",
			datatype : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

				var htmlStr = '<ol>';
				$.each(data.Ind_mList, function(index, value) {
					htmlStr += '<li data-id=' + value.ind_MCODE + '>';
					htmlStr += value.ind_M + '</oi>';
				})
				htmlStr += '</ol>';

				$("#ind_m").html(htmlStr);
				$("#ind_s").html("");

			}

		});
	});

	//중분류 클릭하면 소분류 리스트 넘겨주는 메서드
	$("#ind_m").on("click", "li", function() {

		if ($(this).text != ujmselect) {
			ujselectList = [];
			temp = [];
		}
		ujmselect = $(this).text() + " > ";

		$.ajax({
			method : "post",
			data : {
				"ind_m" : $(this).data("id")
			},
			url : "/future/ind_m",
			datatype : "JSON",
			success : function(data) {

				var htmlStr = '<ol>';
				$.each(data.Ind_sList, function(index, value) {
					htmlStr += '<li data-id=' + value.ind_CODE + '>';
					htmlStr += value.ind_S + '</li>';
				})
				htmlStr += '</ol>';

				$("#ind_s").html(htmlStr);

			}
		});
	});

	// 소분류 클릭하면 데이터 추가해주는 메서드
	$("#ind_s").on(
			"click",
			"li",
			function() {

				if (ujselectList.length == 3) {

					swal({
						title : "warning",
						text : "업종은 3개까지 선택이 가능합니다.",
						icon : "warning",
						button : "확인",
					});

					return;
				}
				ujsselect = $(this).text();

				var ujselect = "<li data-id=" + $(this).data("id") + ">"
						+ ujlselect + ujmselect + ujsselect + "</li>";
				if (ujselectList.includes(ujselect)) {

					swal({
						title : "warning",
						text : "이미 선택한 업종입니다.",
						icon : "warning",
						button : "확인",
					});
					return;
				}

				ujselectList.push(ujselect);
				temp.push($(this).data("id"));

				ujselectstr = "<ul class=\"bottomborder\">";
				$.each(ujselectList, function(index, value) {
					ujselectstr += value;
				});
				ujselectIdList = [];

				$.each(temp, function(index, value) {
					ujselectIdList.push(value);
				});
				ulselectstr = "</ul>";
				$("#userselectuj").html(ujselectstr);

			})

	//분석하기 버튼
	$("#selectBtn").on(
			"click",
			function() {
				if (userSelectAddr == null) {
					swal({
						title : "warning",
						text : "영역을 선택하세요.",
						icon : "warning",
						button : "확인",
					});
					return;
				}
				if (ujselectIdList.length == 0) {

					swal({
						title : "warning",
						text : "업종을 1개 이상 선택하세요.",
						icon : "warning",
						button : "확인",
					});
					return;
				}

				// 주소
				var addr;
				addr = document.createElement("input");
				addr.type = "hidden";
				addr.name = "addr";
				addr.value = userSelectAddr;
				document.getElementById('frm').appendChild(addr);

				//보낼 JSON 객체..
				var latlngJson = new Object();

				var tempList = new Array();
				$.each(latlngs, function(index, value) {
					var latlngObject = new Object();
					latlngObject.lng = value.getLng();
					latlngObject.lat = value.getLat();
					tempList.push(latlngObject);
				});
				latlngJson.latlng = tempList;

				$('#frm').append(
						$('<input/>').attr('type', 'hidden').attr('name',
								'latlngJson').attr('value',
								JSON.stringify(latlngJson)));

				// 기준업종
				var upzong;
				for (var i = 0; i < ujselectIdList.length; i++) {
					upzong = document.createElement("input");
					upzong.type = "hidden";
					upzong.name = "uj";
					upzong.value = ujselectIdList[i];
					document.getElementById('frm').appendChild(upzong);
				}

				if (circleRad != null) {
					$('#frm').append(
							$('<input/>').attr('type', 'hidden').attr('name',
									'radius').attr('value', circleRad));
				}

				if (isSubmitted) {

					swal({
						title : "warning",
						text : "데이터를 전송중입니다.",
						icon : "warning",
						button : "확인",
					});
					return;
				}
				isSubmitted = true;

				$('#frm').submit();
			});

	//버튼 클릭하면 업종 팝업 보여주는 메서드
	$("#ujpop").on("click", function() {
		document.all['divpop'].style.visibility = "visible";
	});

	//버튼 클릭하면 도움말 팝업 보여주는 메서드
	$("#help").on("click", function() {
		document.all['helpPop'].style.visibility = "visible";
	});

	//팝업 취소 걍 숨겨주는거
	$("#helpClose").on("click", function() {
		document.all['helpPop'].style.visibility = "hidden";
	})

	//팝업에서 확인 누르면 창닫고 선택한 업종 리스트 화면에 뿌려주는 메서드
	$("#selectuj").on("click", function() {
		document.all['divpop'].style.visibility = "hidden";
		$("#upjongselect").html(ujselectstr);
	})

	//팝업 취소 걍 숨겨주는거
	$("#close").on("click", function() {
		document.all['divpop'].style.visibility = "hidden";
	})

	//지도 그리는 상태 알려주는 변수, 지울 때 가지고있을 변수, 폼으로 넘겨줄 변수 등등
	var drawingFlag = false; // 그려지고 있는 상태를 가지고 있을 변수입니다
	var events = []; //지도 클릭이나 무브 이벤트 담아놓고 다른거 클릭하면 지우려고 만든 배열

	var geocoder;

	var info;
	var circleInfo;
	//^ 다른거 클릭했을때 기존에 영역 설정한거 지우려고 만든 변수..
	//마커랑 다각은 같이 담을 수 있는데 반경이 배열이라 따로 만들었음

	var polyclick = false; //다각 클릭했을때 원래 찍던중이면 변수에 계속 더하고 아니면 기존 값 없애려고 만드는 변수.. 

	//지도생성
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(36.3250417, 127.4179621), //좌표는 개발원으로 찍었음
		level : 3
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
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
				swal({
					title : "error",
					text : "ERROR",
					icon : "error",
					button : "확인",
				});
			}
		});
	}

	//주소 검색해서 나온 리스트 클릭하면 해당 주소로 지도 옮겨주는 메서드
	$("#regList").on("click", "li", function() {
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		var addr = $(this).text();
		geocoder.addressSearch(addr, function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	});

	// 좌표 찍은거 주소 찍을때 맨처음 보내주는 메서드
	function addrInfo() {
		geocoder = new daum.maps.services.Geocoder();
		searchAddrFromCoords(latlng, displayInfo);
	}

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

	// 좌표로 행정동 주소 정보를 요청합니다
	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌표에 대한 주소정보를 표출하는 함수입니다
	function displayInfo(result, status) {
		if (status === daum.maps.services.Status.OK) {

			for (var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					userSelectAddr = result[i].address_name;
					$("#mapSelectAddr").text(userSelectAddr);
					break;
				}
			}
		}
	}

	// 영역선택
	function draw(index) {

		var mapevent; //이벤트 계속 넣어줘야해서 하나 만들어놓음

		// 마커 찍어봅시다.
		if (index == 'mar') {

			removeInfo(); //일단 전에 그려놓은거있으면 지움
			removeEvents(); //이벤트도 다 날려

			// 마커 지도 가운데 생성
			var marker = info = new daum.maps.Marker({
				position : latlng = map.getCenter()
			});
			latlngs.push(latlng);

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			addrInfo();

			daum.maps.event.addListener(map, 'click', mapevent = function(
					mouseEvent) {
				latlngs = [];
				polyclick = false;
				// 클릭한 위도, 경도 정보
				latlng = mouseEvent.latLng;
				latlngs.push(latlng);

				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng); //위도 가져오려면 latlng.getLat() 경도 가져오려면 latlng.getLng()

				addrInfo();
				info = marker;

			});
			events.push({
				target : map,
				type : 'click',
				handler : mapevent
			});

		} else if (index == 'rad') {

			removeEvents(); //이벤트도 다 날려

			var rad = new Object();
			var circleOptions;
			var centerPosition; // 원의 중심좌표 입니다
			var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
			var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
			var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
			var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

			var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

			// 지도에 클릭 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'click', mapevent = function(
					mouseEvent) {

				removeInfo(); //일단 전에 그려놓은거있으면 지움

				// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
				if (!drawingFlag) {

					// 상태를 그리고있는 상태로 변경합니다
					drawingFlag = true;

					latlngs = [];
					// 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
					latlng = centerPosition = mouseEvent.latLng;
					latlngs.push(latlng);
					addrInfo();

					// 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
					if (!drawingLine) {
						drawingLine = new daum.maps.Polyline({
							strokeWeight : 3, // 선의 두께입니다
							strokeColor : '#00a0e9', // 선의 색깔입니다
							strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid' // 선의 스타일입니다
						});
					}

					// 그려지고 있는 원을 표시할 원 객체를 생성합니다
					if (!drawingCircle) {
						drawingCircle = new daum.maps.Circle({
							strokeWeight : 1, // 선의 두께입니다
							strokeColor : '#00a0e9', // 선의 색깔입니다
							strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid', // 선의 스타일입니다
							fillColor : '#00a0e9', // 채우기 색깔입니다
							fillOpacity : 0.2
						// 채우기 불투명도입니다 
						});
					}

					// 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
					if (!drawingOverlay) {
						drawingOverlay = new daum.maps.CustomOverlay({
							xAnchor : 0,
							yAnchor : 0,
							zIndex : 1
						});
					}
				}
			});
			events.push({
				target : map,
				type : 'click',
				handler : mapevent
			});

			// 지도에 마우스무브 이벤트를 등록합니다
			// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
			daum.maps.event
					.addListener(
							map,
							'mousemove',
							mapevent = function(mouseEvent) {

								// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스 커서의 현재 위치를 얻어옵니다 
									var mousePosition = mouseEvent.latLng;

									// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
									var linePath = [ centerPosition,
											mousePosition ];

									// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
									drawingLine.setPath(linePath);

									// 원의 반지름을 선 객체를 이용해서 얻어옵니다 
									var length = drawingLine.getLength();

									if (length > 0) {

										// 그려지고 있는 원의 중심좌표와 반지름입니다
										var circleOptions = {
											center : centerPosition,
											radius : length,
										};

										// 그려지고 있는 원의 옵션을 설정합니다
										drawingCircle.setOptions(circleOptions);

										if (length >= 750) {
											swal({
												title : "warning",
												text : "반경은 750m 이내로만 설정이 가능합니다.",
												icon : "warning",
												button : "확인",
											});
										}

										// 반경 정보를 표시할 커스텀오버레이의 내용입니다
										var radius = Math.round(drawingCircle
												.getRadius()), content = '<div class="info">반경 <span class="number">'
												+ radius
												+ '</span>m<br>마우스 오른쪽 버튼을 누르면 종료됩니다.</div>';
										// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
										drawingOverlay
												.setPosition(mousePosition);

										// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
										drawingOverlay.setContent(content);

										// 그려지고 있는 원을 지도에 표시합니다
										drawingCircle.setMap(map);

										// 그려지고 있는 선을 지도에 표시합니다
										drawingLine.setMap(map);

										// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
										drawingOverlay.setMap(map);

									} else {

										drawingCircle.setMap(null);
										drawingLine.setMap(null);
										drawingOverlay.setMap(null);

									}
								}
							});
			events.push({
				target : map,
				type : 'mousemove',
				handler : mapevent
			});

			// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
			// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
			// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
			daum.maps.event.addListener(map, 'rightclick', mapevent = function(
					mouseEvent) {

				if (drawingFlag) {

					polyclick = false;

					// 마우스로 오른쪽 클릭한 위치입니다 
					var rClickPosition = mouseEvent.latLng;

					// 원의 반경을 표시할 선 객체를 생성합니다
					var polyline = new daum.maps.Polyline({
						path : [ centerPosition, rClickPosition ], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
						strokeWeight : 3, // 선의 두께 입니다
						strokeColor : '#00a0e9', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});

					// 원 객체를 생성합니다
					var circle = new daum.maps.Circle({
						center : centerPosition, // 원의 중심좌표입니다
						radius : polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
						strokeWeight : 1, // 선의 두께입니다
						strokeColor : '#00a0e9', // 선의 색깔입니다
						strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid', // 선의 스타일입니다
						fillColor : '#00a0e9', // 채우기 색깔입니다
						fillOpacity : 0.2
					// 채우기 불투명도입니다 
					});

					circleRad = polyline.getLength();

					var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
					content = ''; //커스텀 오버레이에 표시할 반경 정보입니다

					// 반경정보를 표시할 커스텀 오버레이를 생성합니다
					var radiusOverlay = new daum.maps.CustomOverlay({
						content : content, // 표시할 내용입니다
						position : rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
						xAnchor : 0,
						yAnchor : 0,
						zIndex : 1
					});

					// 원을 지도에 표시합니다
					circle.setMap(map);

					// 선을 지도에 표시합니다
					polyline.setMap(map);

					// 반경 정보 커스텀 오버레이를 지도에 표시합니다
					radiusOverlay.setMap(map);

					// 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
					var radiusObj = circleInfo = {
						'polyline' : polyline,
						'circle' : circle,
						'overlay' : radiusOverlay
					};

					// 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
					drawingFlag = false;

					// 중심 좌표를 초기화 합니다  
					centerPosition = null;

					// 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
					drawingCircle.setMap(null);
					drawingLine.setMap(null);
					drawingOverlay.setMap(null);
				}
			});

			events.push({
				target : map,
				type : 'rightclick',
				handler : mapevent
			});

			// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
			function removeCircles() {
				for (var i = 0; i < circles.length; i++) {
					circles[i].circle.setMap(null);
					circles[i].polyline.setMap(null);
					circles[i].overlay.setMap(null);
				}
				circles = [];
			}

		} else if (index == 'poly') {

			removeEvents();

			var drawingPolygon; // 그려지고 있는 다각형을 표시할 다각형 객체입니다
			var polygon; // 그리기가 종료됐을 때 지도에 표시할 다각형 객체입니다
			var areaOverlay; // 다각형의 면적정보를 표시할 커스텀오버레이 입니다

			// 마우스 클릭 이벤트가 발생하고나면 drawingFlag가 그려지고 있는 상태인 ture 값으로 바뀝니다
			// 그려지고 있는 상태인 경우 drawingPolygon 으로 그려지고 있는 다각형을 지도에 표시합니다
			// 마우스 오른쪽 클릭 이벤트가 발생하면 drawingFlag가 그리기가 종료된 상태인 false 값으로 바뀌고
			// polygon 으로 다 그려진 다각형을 지도에 표시합니다

			// 지도에 마우스 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 다각형 그리기가 시작됩니다 그려진 다각형이 있으면 지우고 다시 그립니다
			daum.maps.event.addListener(map, 'click', mapevent = function(
					mouseEvent) {
				removeInfo();

				// 마우스로 클릭한 위치입니다 
				var clickPosition = latlng = mouseEvent.latLng;
				addrInfo();
				latlngs.push(clickPosition);

				// 지도 클릭이벤트가 발생했는데 다각형이 그려지고 있는 상태가 아니면
				if (!drawingFlag) {

					// 상태를 true로, 다각형을 그리고 있는 상태로 변경합니다
					drawingFlag = true;

					// 지도 위에 다각형이 표시되고 있다면 지도에서 제거합니다
					if (polygon) {
						polygon.setMap(null);
						polygon = null;
					}

					// 지도 위에 면적정보 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					if (areaOverlay) {
						areaOverlay.setMap(null);
						areaOverlay = null;
					}

					// 그려지고 있는 다각형을 표시할 다각형을 생성하고 지도에 표시합니다
					drawingPolygon = new daum.maps.Polygon({
						map : map, // 다각형을 표시할 지도입니다
						path : [ clickPosition ], // 다각형을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#00a0e9', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid', // 선의 스타일입니다
						fillColor : '#00a0e9', // 채우기 색깔입니다
						fillOpacity : 0.2
					// 채우기 불투명도입니다
					});

					// 그리기가 종료됐을때 지도에 표시할 다각형을 생성합니다 
					polygon = info = new daum.maps.Polygon({
						path : [ clickPosition ], // 다각형을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다 
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#00a0e9', // 선의 색깔입니다   
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid', // 선의 스타일입니다
						fillColor : '#00a0e9', // 채우기 색깔입니다
						fillOpacity : 0.2
					// 채우기 불투명도입니다
					});

				} else { // 다각형이 그려지고 있는 상태이면 

					// 그려지고 있는 다각형의 좌표에 클릭위치를 추가합니다
					// 다각형의 좌표 배열을 얻어옵니다
					var drawingPath = drawingPolygon.getPath();

					// 좌표 배열에 클릭한 위치를 추가하고
					drawingPath.push(clickPosition);

					// 다시 다각형 좌표 배열을 설정합니다
					drawingPolygon.setPath(drawingPath);

					// 그리기가 종료됐을때 지도에 표시할 다각형의 좌표에 클릭 위치를 추가합니다
					// 다각형의 좌표 배열을 얻어옵니다
					var path = polygon.getPath();

					// 좌표 배열에 클릭한 위치를 추가하고
					path.push(clickPosition);

					// 다시 다각형 좌표 배열을 설정합니다
					polygon.setPath(path);
				}

			});
			events.push({
				target : map,
				type : 'click',
				handler : mapevent
			});

			// 지도에 마우스무브 이벤트를 등록합니다
			// 다각형을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 다각형의 위치를 동적으로 보여주도록 합니다
			daum.maps.event.addListener(map, 'mousemove', mapevent = function(
					mouseEvent) {

				// 지도 마우스무브 이벤트가 발생했는데 다각형을 그리고있는 상태이면
				if (drawingFlag) {

					// 마우스 커서의 현재 위치를 얻어옵니다 
					var mousePosition = mouseEvent.latLng;

					// 그려지고있는 다각형의 좌표배열을 얻어옵니다
					var path = drawingPolygon.getPath();

					// 마우스무브로 추가된 마지막 좌표를 제거합니다
					if (path.length > 1) {
						path.pop();
					}

					// 마우스의 커서 위치를 좌표 배열에 추가합니다
					path.push(mousePosition);

					// 그려지고 있는 다각형의 좌표를 다시 설정합니다
					drawingPolygon.setPath(path);
				}
			});
			events.push({
				target : map,
				type : 'mousemove',
				handler : mapevent
			});

			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 다각형을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 그리기를 종료합니다
			daum.maps.event.addListener(map, 'rightclick', mapevent = function(
					mouseEvent) {

				// 지도 오른쪽 클릭 이벤트가 발생했는데 다각형을 그리고있는 상태이면
				if (drawingFlag) {

					polyclick = true;

					// 그려지고있는 다각형을  지도에서 제거합니다
					drawingPolygon.setMap(null);
					drawingPolygon = null;

					// 클릭된 죄표로 그릴 다각형의 좌표배열을 얻어옵니다
					var path = polygon.getPath();

					// 다각형을 구성하는 좌표의 개수가 3개 이상이면 
					if (path.length > 2) {
						if (Math.round(polygon.getArea() >= 7065000)) {
							swal({
								title : "warning",
								text : "그려진 면적은 "
										+ Math.round(polygon.getArea())
										+ "m2이며, 허용면적은 7,065,000m2이하입니다",
								icon : "warning",
								button : "확인",
							});
							return;
						}

						// 지도에 다각형을 표시합니다
						polygon.setMap(map);

						var area = Math.round(polygon.getArea()), // 다각형의 총면적을 계산합니다
						content = ''; // 커스텀오버레이에 추가될 내용입니다

						// 면적정보를 지도에 표시합니다
						areaOverlay = new daum.maps.CustomOverlay({
							map : map, // 커스텀오버레이를 표시할 지도입니다 
							content : content, // 커스텀오버레이에 표시할 내용입니다
							xAnchor : 0,
							yAnchor : 0,
							position : path[path.length - 1]
						// 커스텀오버레이를 표시할 위치입니다. 위치는 다각형의 마지막 좌표로 설정합니다
						});

						var p = new Object();
						p.property = path;

					} else {

						// 다각형을 구성하는 좌표가 2개 이하이면 다각형을 지도에 표시하지 않습니다 
						polygon = null;
					}

					// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
					drawingFlag = false;

					var ib = 0;
					var jb = 0;

					$.each(latlngs, function(index, value) {
						ib += value.ib;
						jb += value.jb;
					});

					ib = ib / latlngs.length;
					jb = jb / latlngs.length;

					latlng = new daum.maps.LatLng(jb, ib);
					addrInfo();
				}
			});

			events.push({
				target : map,
				type : 'rightclick',
				handler : mapevent
			});
		}
	}
	if ("${analysisrecList}" != "") {
		ujselectstr = "<ul class=\"bottomborder\">" + "${indli}" + "</ul>";
		$("#userselectuj").html(ujselectstr);
		$("#upjongselect").html(ujselectstr);
		<c:forEach items="${indcodeList}" var="vo">
		ujselectIdList.push("${vo}");
		</c:forEach>
		<c:forEach items="${analysisrecList}" var="arVo" varStatus="status">
		if ("${arVo.AN_SHAPE}" == "1") {
			var marker = info = new daum.maps.Marker({
				position : latlng = new daum.maps.LatLng("${arVo.AN_COORY}",
						"${arVo.AN_COORX}")
			});
			latlngs.push(latlng);
			marker.setMap(map);
		} else if ("${arVo.AN_SHAPE}" == "2") {
			circleRad = "${arVo.AN_RAD}" * 1.0;
			var circle = new daum.maps.Circle({
				center : latlng = new daum.maps.LatLng("${arVo.AN_COORY}",
						"${arVo.AN_COORX}"), // 원의 중심좌표 입니다 
				radius : circleRad, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 1, // 선의 두께입니다 
				strokeColor : '#00a0e9', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid', // 선의 스타일 입니다
				fillColor : '#00a0e9', // 채우기 색깔입니다
				fillOpacity : 0.2
			// 채우기 불투명도 입니다   
			});
			latlngs.push(latlng);
			info = circle;
			circle.setMap(map);
			if (circleRad > 200) {
				map.setLevel(4);
			}
		} else if ("${arVo.AN_SHAPE}" == "3") {
			latlngs.push(new daum.maps.LatLng("${arVo.AN_COORY}",
					"${arVo.AN_COORX}"));
			if ("${status.last}" == "true") {
				drawPoly();
			}
		}
		</c:forEach>
		map.setCenter(latlng);
		addrInfo();
	}

	function drawPoly() {
		// 지도에 표시할 다각형을 생성합니다
		var polygon = info = new daum.maps.Polygon({
			path : latlngs, // 그려질 다각형의 좌표 배열입니다
			strokeWeight : 3, // 선의 두께입니다
			strokeColor : '#00a0e9', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid', // 선의 스타일입니다
			fillColor : '#00a0e9', // 채우기 색깔입니다
			fillOpacity : 0.2
		// 채우기 불투명도 입니다
		});

		// 지도에 다각형을 표시합니다
		polygon.setMap(map);
		var ib = 0;
		var jb = 0;
		$.each(latlngs, function(index, value) {
			ib += value.ib;
			jb += value.jb;
		});

		ib = ib / latlngs.length;
		jb = jb / latlngs.length;

		latlng = new daum.maps.LatLng(jb, ib);
	}

	$("#reg").keydown(function(key) {
		if (key.keyCode == 13) {
			searchReg();
		}
	});
</script>