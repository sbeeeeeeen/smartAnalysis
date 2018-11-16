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

<form id="frm" action="/analysisRes/result" method="post">
	<!-- <input type="hidden" value="" id="imgSrc" name="imgSrc" /> -->
</form>
<div class="container">
	<div class="page-header">
		<h2>상권분석</h2>
	</div>
	<div class="row">
		<div class="col-lg-4 b">
			<!-- <form onsubmit="return false;" method="post"> -->
			<div class="panel-group wrap" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne"> <strong>[1단계]</strong>
								지역선택
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
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
									<li id="drawstatus" onclick="draw('mar')"><i class="fa fa-map-marker"></i><br>마커</li>
									<li id="drawstatus" onclick="draw('rad')"><i class="fa fa-dot-circle-o"></i><br>반경</li>
									<li id="drawstatus" onclick="draw('poly')"><i class="fa fa-square-o"></i><br>다각</li>
								</ul>
								<p style="color:#ccc">지도를 클릭해서 영역을 설정하세요. 마우스 오른쪽 버튼을 누르면 영역 선택이 종료됩니다.</p>
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
						<div id="ujselectListDiv">
						
						</div>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							<h5>업종은 동일분류 내(중분류 기준)에서 최대 3개까지 선택이 가능합니다.</h5>
							<p>예) 갈비/삼겹살, 기사식당, 냉면집 등</p>
							<button id="ujpop" class="upjongpop"><i class="fa fa-chevron-circle-down"></i>업종을 선택해주세요</button>
							<div id="upjongselect">
							
							</div>
							<div id="divpop" class="pop-layer">
								<div style="height:20%;">
									<h4 style="text-align:center; border-bottom: 1px solid #ccc; padding: 10px; margin: 5px;">업종선택</h4>
									<div id="userselectuj">
									</div>
								</div>
								<div style="height:70%">
									<div id="ujlListDiv" class="uj">
										<ol>
											<c:forEach items="${lList }" var="item" >
												<li data-id="${item.IND_LCODE }">${item.IND_L}</li>
											</c:forEach>
										</ol>
									</div>
									<div id="ujmListDiv" class="uj">
										중분류
									</div>
									<div id="ujsListDiv" class="uj" style="width:34%">
										소분류 
									</div>
								</div>
								<div style="height:10%" class="layer-pop-footer">
									<ul style="text-align: center;">
										<li id="selectuj" class="btn btn-theme" style="background:#546799;">확인</li>
										<li id="close" class="btn btn-warning">취소</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end of panel -->
				<div class="selectBtm">
					<a href="/map/taSelect" class="btn abtn" style="background:#8b99a3">초기화</a>
					<button id="sendForm" class="btn abtn" style="background: #68A4C4;">분석하기</button>
				</div>
			</div>
				<!-- end of #accordion -->
		</div>
		<!-- end of wrap -->
		<div class="col-lg-8">
			<div id="map" class="b"></div>
		</div>
	</div>
</div>
<!-- end of container -->
<script type="text/javascript">
	var userSelectAddr; //사용자가 선택한 주소
	var latlng; //사용자가 클릭한 지도 좌표(다각은 가운데꺼) 얘는 안넘김
	var circleRad; //반경값
	var latlngs = new Array(); //다각이 찍는 좌표 여러개라서 만들어놓는 배열 ㅠ 요거 넘겨야돼
	var ujselectIdList = new Array(); //폼 넘길때 가져갈 업종 아이디 리스트... 
	
	var isSubmitted = false; //분석하기 중복클릭 막으려고 만든 변수
	$("#sendForm").on("click", function(){
		//유효성검사하고
		if(userSelectAddr==null){
			swal('warning', '영역을 선택하세요.', 'warning')
			return;
		}
		if(ujselectIdList.length==0){
			swal('warning', '업종을 1개 이상 선택하세요.', 'warning')
			return;
		}
		
		//보낼 JSON 객체..
		var latlngJson = new Object();
		
		var tempList = new Array();
		$.each(latlngs, function(index, value){
			var latlngObject = new Object();
			latlngObject.lng = value.getLng();
			latlngObject.lat = value.getLat();
			tempList.push(latlngObject);
		});
		latlngJson.latlng = tempList;
		
		$('#frm').append(
			$('<input/>').attr('type', 'hidden').attr('name','latlngJson').attr('value',JSON.stringify(latlngJson))
		);
		
		var addr;
		addr = document.createElement("input");
		addr.type="hidden";
		addr.name="addr";
		addr.value=userSelectAddr;
		document.getElementById('frm').appendChild(addr);
		
		var el;
		for (var i=0; i<ujselectIdList.length; i++){
		    el = document.createElement("input");
		    el.type = "hidden";
		    el.name = "uj";
		    el.value = ujselectIdList[i];
		    document.getElementById('frm').appendChild(el);    
		}
		
		if(circleRad!=null){
			$('#frm').append(
				$('<input/>').attr('type', 'hidden').attr('name','radius').attr('value',circleRad)
			);
		}
		
		if(isSubmitted){
			swal('warning', '데이터를 전송중입니다.', 'warning')
			return;
		}
		
		$('#frm').submit(); 
		isSubmitted = true;
	});
	
	var ujselectList = new Array(); //li 한줄값
	var temp = new Array();
	var ujlselect = ""; //나중에 다 더해야해서 lms 빼놈 변수 하나로해놓으면 바꾸기 힘들어
	var ujmselect;
	var ujsselect;

	var ujselectstr; //<ul><li></li></ul> 반복문 돌려서 넣어줄 값

	//대분류 클릭하면 중분류 리스트 넘겨주는 메서드
	$("#ujlListDiv").on("click", "li", function() {
		ujlselect = $(this).text() + " > ";
		$.ajax({
			url : "/map/getIndustryM",
			dataType : "JSON",
			method : "post",
			data : {
				"lcode" : $(this).data("id")
			},
			success : function(data) {
				var htmlStr = '<ol>';
				$.each(data.mList, function(index, value) {
					htmlStr += '<li data-id=' + value.ind_MCODE + '>';
					htmlStr += value.ind_M + '</oi>';
				})
				htmlStr += '</ol>';
				$("#ujmListDiv").html(htmlStr);
				$("#ujsListDiv").html("");
			}
		});
	});

	//중분류 클릭하면 소분류 리스트 넘겨주는 메서드
	$("#ujmListDiv").on("click", "li", function() {
		if ($(this).text != ujmselect) {
			ujselectList = [];
			temp = [];
		}
		ujmselect = $(this).text() + " > ";
		$.ajax({
			url : "/map/getIndustryS",
			dataType : "JSON",
			method : "post",
			data : {
				"mcode" : $(this).data("id")
			},
			success : function(data) {
				var htmlStr = '<ol>';
				$.each(data.sList, function(index, value) {
					htmlStr += '<li data-id=' + value.ind_CODE + '>';
					htmlStr += value.ind_S + '</li>';
				})
				htmlStr += '</ol>';
				$("#ujsListDiv").html(htmlStr);
			}
		});
	});

	//소분류 클릭하면 데이터 추가해주는 메서드
	$("#ujsListDiv").on("click","li",function() {
		if (ujselectList.length == 3) {
			swal('warning', '업종은 3개까지 선택이 가능합니다.', 'warning')
			return;
		}
		ujsselect = $(this).text();
		var ujselect = "<li data-id=" + $(this).data("id") + ">"
				+ ujlselect + ujmselect + ujsselect + "</li>";
		if (ujselectList.includes(ujselect)) {
			swal('warning', '이미 선택한 업종입니다.', 'warning')
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

	//버튼 클릭하면 업종 팝업 보여주는 메서드
	$("#ujpop").on("click", function() {
		document.all['divpop'].style.visibility = "visible";
	});

	//팝업에서 확인 누르면 창닫고 선택한 업종 리스트 화면에 뿌려주는 메서드
	$("#selectuj").on("click", function() {
		document.all['divpop'].style.visibility = "hidden";
		$("#upjongselect").html(ujselectstr);
	})

	//팝업 취소 걍 숨겨주는거
	$("#close").on("click", function() {
		document.all['divpop'].style.visibility = "hidden";
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
	
	$("#reg").keydown(function(key) {
	      if (key.keyCode == 13) {
	         searchReg();
	      }
	});

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
	
	var polyclick=false; //다각 클릭했을때 원래 찍던중이면 변수에 계속 더하고 아니면 기존 값 없애려고 만드는 변수.. 

	//지도에 영역 그릴때 쓰는 메서드. 여기에 마커, 반경, 다각 다 합쳐놓았음
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
				polyclick = false;
				// 클릭한 위도, 경도 정보
				latlng = mouseEvent.latLng;
				latlngs.push(latlng);

				// 마커 위치를 클릭한 위치로 옮김
				marker.setPosition(latlng); //위도 가져오려면 latlng.getLat() 경도 가져오려면 latlng.getLng()

				addrInfo();
				info = marker;
			});
			events.push({ target : map, type : 'click', handler : mapevent});
		} else if (index == 'rad') { //반경 클릭하면
			removeEvents(); //이벤트 날리고 시작
			var rad = new Object();
			var circleOptions;
			var centerPosition; // 원의 중심좌표 입니다
			var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
			var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
			var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
			var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

			var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
			daum.maps.event.addListener(map, 'click', mapevent = function(mouseEvent) {
				removeInfo();
				if (!drawingFlag) {
					drawingFlag = true;
					latlngs = [];
					latlng = centerPosition = mouseEvent.latLng;
					latlngs.push(latlng);
					addrInfo();

					if (!drawingLine) {
						drawingLine = new daum.maps.Polyline({
							strokeWeight : 2, // 선의 두께입니다
							strokeColor : '#00a0e9', // 선의 색깔입니다
							strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid' // 선의 스타일입니다
						});
					}

					if (!drawingCircle) {
						drawingCircle = new daum.maps.Circle({
							strokeWeight : 1, // 선의 두께입니다
							strokeColor : '#00a0e9', // 선의 색깔입니다
							strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid', // 선의 스타일입니다
							fillColor : '#00a0e9', // 채우기 색깔입니다
							fillOpacity : 0.2
						});
					}

					if (!drawingOverlay) {
						drawingOverlay = new daum.maps.CustomOverlay({
							xAnchor : 0,
							yAnchor : 0,
							zIndex : 1
						});
					}
				}
			});
			events.push({target : map,type : 'click',handler : mapevent});
	
			daum.maps.event.addListener(map,'mousemove',mapevent = function(mouseEvent) {
				if (drawingFlag) {
					var mousePosition = mouseEvent.latLng;
					var linePath = [ centerPosition, mousePosition ];
					drawingLine.setPath(linePath);
					var length = drawingLine.getLength();
	
					if (length > 0) {
						circleOptions = {
							center : centerPosition,
							radius : length,
						};
						drawingCircle.setOptions(circleOptions);
						if(length>=750){
							swal('warning', '반경은 750m 이내로만 설정이 가능합니다.', 'warning')
						}
						var radius = Math.round(drawingCircle.getRadius()), content = '<div class="info">반경 <span class="number">'
								+ radius
								+ '</span>m<br>마우스 오른쪽 버튼을 누르면 종료됩니다.</div>';
						drawingOverlay.setPosition(mousePosition);
						drawingOverlay.setContent(content);
						drawingCircle.setMap(map);
						drawingLine.setMap(map);
						drawingOverlay.setMap(map);
					} else {
						drawingCircle.setMap(null);
						drawingLine.setMap(null);
						drawingOverlay.setMap(null);
					}
				}
			});
			events.push({ target : map, type : 'mousemove', handler : mapevent});
	
			daum.maps.event.addListener(map, 'rightclick', mapevent = function(mouseEvent) {
				if (drawingFlag) {
					polyclick = false;
					var rClickPosition = mouseEvent.latLng;
	
					var polyline = new daum.maps.Polyline({
						path : [ centerPosition, rClickPosition ],
						strokeWeight : 3,
						strokeColor : '#00a0e9',
						strokeOpacity : 1,
						strokeStyle : 'solid'
					});
	
					var circle = new daum.maps.Circle({
						center : centerPosition,
						radius : polyline.getLength(),
						strokeWeight : 1,
						strokeColor : '#00a0e9',
						strokeOpacity : 0.1,
						strokeStyle : 'solid',
						fillColor : '#00a0e9',
						fillOpacity : 0.2
					});
	
					circleRad = polyline.getLength();
	
					var radius = Math.round(circle.getRadius()), content = ""; //content에 원래 div 만들어서 넣어주는데 필요없어서 비움
	
					var radiusOverlay = new daum.maps.CustomOverlay({
						content : content,
						position : rClickPosition,
						xAnchor : 0,
						yAnchor : 0,
						zIndex : 1
					});
	
					circle.setMap(map);
					polyline.setMap(map);
					radiusOverlay.setMap(map);
	
					var radiusObj = circleInfo = {
						'polyline' : polyline,
						'circle' : circle,
						'overlay' : radiusOverlay
					};
	
					drawingFlag = false;
					centerPosition = null;
	
					drawingCircle.setMap(null);
					drawingLine.setMap(null);
					drawingOverlay.setMap(null);
	
				}
			});
			events.push({target : map, type : 'rightclick', handler : mapevent});
	
			function removeCircles() {
				for (var i = 0; i < circles.length; i++) {
					circles[i].circle.setMap(null);
					circles[i].polyline.setMap(null);
					circles[i].overlay.setMap(null);
				}
				circles = [];
			}
		} else if (index == 'poly') {
			removeEvents();//이벤트 날려
			var drawingPolygon;
			var polygon;
			var areaOverlay;
	
			daum.maps.event.addListener(map, 'click', mapevent = function(mouseEvent) {
				removeInfo();
				var clickPosition = latlng = mouseEvent.latLng;
				addrInfo();
				latlngs.push(clickPosition);
	
				if (!drawingFlag) {
					drawingFlag = true;
					if (polygon) {
						polygon.setMap(null);
						polygon = null;
					}
					if (areaOverlay) {
						areaOverlay.setMap(null);
						areaOverlay = null;
					}
					drawingPolygon = new daum.maps.Polygon({
						map : map,
						path : [ clickPosition ],
						strokeWeight : 3,
						strokeColor : '#00a0e9',
						strokeOpacity : 1,
						strokeStyle : 'solid',
						fillColor : '#00a0e9',
						fillOpacity : 0.2
					});
					polygon = info = new daum.maps.Polygon({
						path : [ clickPosition ],
						strokeWeight : 3,
						strokeColor : '#00a0e9',
						strokeOpacity : 1,
						strokeStyle : 'solid',
						fillColor : '#00a0e9',
						fillOpacity : 0.2
					});
				} else {
					var drawingPath = drawingPolygon.getPath();
					drawingPath.push(clickPosition);
					drawingPolygon.setPath(drawingPath);
	
					var path = polygon.getPath();
					path.push(clickPosition);
					polygon.setPath(path);
				}
	
			});
			events.push({target : map, type : 'click', handler : mapevent });
	
			daum.maps.event.addListener(map, 'mousemove', mapevent = function(mouseEvent) {
				if (drawingFlag) {
					var mousePosition = mouseEvent.latLng;
					var path = drawingPolygon.getPath();
					if (path.length > 1) {
						path.pop();
					}
					path.push(mousePosition);
					drawingPolygon.setPath(path);
				}
			});
			events.push({ target : map, type : 'mousemove', handler : mapevent });
	
			daum.maps.event.addListener(map, 'rightclick', mapevent = function(mouseEvent) {
				if (drawingFlag) {
					polyclick = true;
					drawingPolygon.setMap(null);
					drawingPolygon = null;
					var path = polygon.getPath();
					if (path.length > 2) {
						if( Math.round(polygon.getArea()>7065000)){
							swal('warning', "그려진 면적은 "+ Math.round(polygon.getArea()) + "m2이며, 허용면적은 7,065,000m2이하입니다", 'warning')
							return;
						}
						polygon.setMap(map);
						var area = Math.round(polygon.getArea()), content = '';
						areaOverlay = new daum.maps.CustomOverlay({
							map : map,
							content : content,
							xAnchor : 0,
							yAnchor : 0,
							position : path[path.length - 1]
						});
						var p = new Object();
						p.property = path;
					} else {
						polygon = null;
					}
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
			events.push({target : map, type : 'rightclick', handler : mapevent});
		}
	}
	
	if("${analysisrecList}"!=""){
		ujselectstr = "<ul class=\"bottomborder\">" + "${indli}" + "</ul>";
		$("#userselectuj").html(ujselectstr);
		$("#upjongselect").html(ujselectstr);
		<c:forEach items="${indcodeList}" var="vo">
			ujselectIdList.push("${vo}");
		</c:forEach>
		<c:forEach items="${analysisrecList}" var="arVo" varStatus="status">
			if("${arVo.AN_SHAPE}"=="1"){
				var marker = info = new daum.maps.Marker({
					position : latlng=new daum.maps.LatLng("${arVo.AN_COORY}", "${arVo.AN_COORX}")
				});
				latlngs.push(latlng);
				marker.setMap(map);
			}else if("${arVo.AN_SHAPE}"=="2"){
				circleRad = "${arVo.AN_RAD}"*1.0;
				var circle = new daum.maps.Circle({
				    center : latlng=new daum.maps.LatLng("${arVo.AN_COORY}", "${arVo.AN_COORX}"),  // 원의 중심좌표 입니다 
				    radius: circleRad, // 미터 단위의 원의 반지름입니다 
				    strokeWeight: 1, // 선의 두께입니다 
				    strokeColor: '#00a0e9', // 선의 색깔입니다
				    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'solid', // 선의 스타일 입니다
				    fillColor: '#00a0e9', // 채우기 색깔입니다
				    fillOpacity: 0.2  // 채우기 불투명도 입니다   
				}); 
				latlngs.push(latlng);
				info = circle;
				circle.setMap(map); 
				if(circleRad>200){
					map.setLevel(4);
				}
			}else if("${arVo.AN_SHAPE}"=="3"){
				latlngs.push(new daum.maps.LatLng("${arVo.AN_COORY}", "${arVo.AN_COORX}"));
				if("${status.last}"=="true"){
					drawPoly();
				}
			}
		</c:forEach>
		map.setCenter(latlng);
		addrInfo();
	}
	
	function drawPoly(){
		// 지도에 표시할 다각형을 생성합니다
        var polygon = info = new daum.maps.Polygon({
            path:latlngs, // 그려질 다각형의 좌표 배열입니다
            strokeWeight: 3, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid', // 선의 스타일입니다
            fillColor: '#00a0e9', // 채우기 색깔입니다
            fillOpacity: 0.2 // 채우기 불투명도 입니다
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
	
</script>