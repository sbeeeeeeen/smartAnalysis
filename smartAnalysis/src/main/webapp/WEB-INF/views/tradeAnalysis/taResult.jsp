<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/taResultcss.css" rel="stylesheet">
<div class="container">
	<div class="page-header">
		<a id="data" href="#dataPop" class="btn helpinfo" style="color:black;">
			<i class="fa fa-question-circle" aria-hidden="true"></i>
			<span style="color: black;">자료정보</span>
		</a>
		<h2>상권분석 보고서</h2>
		<div id="dataPop" class="pop-layer" align="center">
			<table id="dataTable" style="margin-top: 15px;" class="table table-info">
				<thead>
					<tr>
						<th>기준 데이터</th>
						<th>데이터 명</th>
						<th>데이터 기준 월</th>
						<th>데이터 내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>대전광역시</td>
						<td>거주인구 현황</td>
						<td>2018.07</td>
						<td>주민등록인구현황(구별/동별/연령별)</td>
					</tr>
					<tr>
						<td>-</td>
						<td>유동인구</td>
						<td>2018.06</td>
						<td>전국 주요상권 유동량 조사 정보</td>
					</tr>
					<tr>
						<td>대전광역시</td>
						<td>사업체수 및 종사자수 현황</td>
						<td>2015.12</td>
						<td>2015년 기준 사업체조사 결과</td>
					</tr>
					<tr>
						<td>소상공인시장진흥공단</td>
						<td>상권정보</td>
						<td>2018.10</td>
						<td>선택 지역 상권 정보</td>
					</tr>
				</tbody>
			</table>
			<div class="layer-pop-footer" align="center">
				<ul style="text-align: center;">
					<li id="dataClose" class="btn btn-warning">닫기</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<h3>분석 설정 정보</h3>
		<table class="table table-info">
			<thead>
				<tr>
					<th>분석지역</th>
					<th>기준업종</th>
					<th>분석시점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${regionVo.reg_si } ${regionVo.reg_gu } ${regionVo.reg_dong }</td>
					<td>
						<c:forEach items="${industryList }" var="vo" varStatus="status" >
							${vo.IND_L } > ${vo.IND_M } > ${vo.IND_S }
							<c:if test="${!status.last}"><br></c:if>
						</c:forEach>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${an_dt }"/></td>
				</tr>
			</tbody>
		</table>
		<h3>상권 주요 정보</h3>
		<table class="table">
			<thead>
				<tr>
					<th rowspan="2">구분</th>
					<th colspan="5">업소수</th>
					<th colspan="3">인구</th>
				</tr>
				<tr>
					<th>전체</th>
					<th>음식</th>
					<th>서비스</th>
					<th>도/소매</th>
					<th>선택업종</th>
					<th>주거</th>
					<th>직장</th>
					<th>유동</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="bgpoint2"><Strong>선택영역</Strong></td>
					<c:forEach items="${getstoreListInUpjong}" var="storeCnt" varStatus="status">
						<c:if test="${!status.last }"><td>${storeCnt }</td></c:if>
						<c:if test="${status.last }"><td class="largenum"><Strong>${storeCnt }</Strong></td></c:if>
					</c:forEach>
					<td>${ResidentialVo.RST_COUNT }</td>
					<td>${rectalVo.rs_count }</td>
					<td class="largenum bgpoint"><Strong>${floatingVo.ft_count }</Strong></td>
				</tr>
			</tbody>
		</table>
		<div>
			<h3>1. 평가종합</h3>
			<div style="height:300px; padding-top: 30px;">
				<div style="width:50%">
					<img src="../../img/rank.png" class="rankimg">
					<i class="fa fa-map-marker fa-3x rankmarker" id="rankmarker"></i>
					<span class="rank"><strong>상권등급 : ${ratingGrade.rg_level }등급</strong></span>
					<span class="rankdetail">기준영역의 상권등급은 총 5등급 중 <strong>‘${ratingGrade.rg_level }등급’</strong> 입니다.<br><br>
					1등급에 가까울수록 상권이 활성화되었다는 것을 의미하며,<br> 이는 상권의 전반적 업종경기와 주변 집객시설, 교통, 여건을<br> 고려하여 평가한 결과입니다.<br><br>
					</span>
					<span class="rankhelp">* 본 등급은 해당 상권에 진입 또는 퇴출을 고려하는 소상공인에게<br>
					 상권 성장 여부에 대한 추세를 제공하여 참고하도록 하는 것이 목적으로<br>
					  시장 전체의 규모를 표현하는 지표가 아닙니다.</span>
				</div>
			</div>
		</div>
		<div>
			<h3>2. 지역별 평가지수 추이</h3>
			<div id="ratingChart">
				
			</div>
			<table class="table">
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th rowspan="2">지역</th>
						<c:forEach items="${dongRatingList }" var="vo" varStatus="status">
							<th <c:if test="${!status.first }">colspan="2"</c:if>>
								<fmt:formatDate value="${vo.rt_month }" pattern="yyyy년 MM월"/>
							</th>
						</c:forEach>
					</tr>
					<tr>
						<th>평가지수</th>
						<th>평가지수</th>
						<th>증감률</th>
						<th>평가지수</th>
						<th>증감률</th>
						<th>평가지수</th>
						<th>증감률</th>
						<th>평가지수</th>
						<th>증감률</th>
						<th>평가지수</th>
						<th>증감률</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="bgpoint2">행정동</th>
						<th class="bgpoint2">${regionVo.reg_dong }</th>
						<c:forEach items="${dongRatingList }" var="vo" varStatus="status" >
							<td>
							<c:if test="${status.last }">
								<c:set var="rating" value="${vo.rt_avg }"/>
							</c:if>
							<fmt:formatNumber value="${vo.rt_avg }" pattern="0.00"/>
							</td>
							<c:if test="${status.index > 0 }">
								<td>
									<strong>
									<c:set var="ratingp" value="${(vo.rt_avg-dongRatingList[status.index-1].rt_avg)/dongRatingList[status.index-1].rt_avg}"/>
									<fmt:formatNumber value="${ratingp }" type="percent" pattern="0.00%"/>
									<c:choose >
										<c:when test="${ratingp >0 }"><span class="up">▲</span></c:when>
										<c:otherwise><span class="down">▼</span></c:otherwise>
									</c:choose>
									</strong>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th class="bgpoint2">시군구</th>
						<th class="bgpoint2">${regionVo.reg_gu }</th>
						<c:forEach items="${guRatingList }" var="vo" varStatus="status" >
							<td><fmt:formatNumber value="${vo.rt_avg }" pattern="0.00"/></td>
							<c:if test="${status.index > 0 }">
								<td>
									<Strong>
									<c:set var="str" value="${(vo.rt_avg-guRatingList[status.index-1].rt_avg)/guRatingList[status.index-1].rt_avg}"/>
									<fmt:formatNumber value="${str }" type="percent" pattern="0.00%"/>
									<c:choose >
										<c:when test="${str >0 }"><span class="up">▲</span></c:when>
										<c:otherwise><span class="down">▼</span></c:otherwise>
									</c:choose>
									</Strong>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th class="bgpoint2">광역시도</th>
						<th class="bgpoint2">${regionVo.reg_si }</th>
						<c:forEach items="${siRatingList }" var="vo" varStatus="status" >
							<td><fmt:formatNumber value="${vo.rt_avg }" pattern="0.00"/></td>
							<c:if test="${status.index > 0 }">
								<td>
									<Strong>
									<c:set var="str" value="${(vo.rt_avg-siRatingList[status.index-1].rt_avg)/siRatingList[status.index-1].rt_avg}"/>
									<fmt:formatNumber value="${str }" type="percent" pattern="0.00%"/>
									<c:choose >
										<c:when test="${str >0 }"><span class="up">▲</span></c:when>
										<c:otherwise><span class="down">▼</span></c:otherwise>
									</c:choose>
									</Strong>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="resultwrap" >
			<div class="col" >
				분석<br>
				<strong>결과</strong>
			</div>
			<div class="col">
				선택영역의 상권평가지수는 전월 대비 
				<strong>
				<fmt:formatNumber value="${ratingp }" type="percent" pattern="0.00%"/>
				<c:choose>
					<c:when test="${ratingp>0 }"> 상승</c:when>
					<c:when test="${ratingp==0 }"> 동일</c:when>
					<c:when test="${ratingp<0 }"> 하락</c:when>
				</c:choose>
				</strong>한 
				<strong>${rating }점</strong>이며, 이는 상권의 
				<strong>
				<c:choose>
					<c:when test="${ratingp>0 }"> 전반적인 경기가 상승함</c:when>
					<c:when test="${ratingp==0 }"> 전반적인 경기가 전월과 동일함</c:when>
					<c:when test="${ratingp<0 }"> 전반적인 경기가 하락함</c:when>
				</c:choose>
				</strong>
				을 의미합니다.
			</div>
		</div>
		<h3>3. 업종별 추이</h3>
			<div style="height:500px;">
				<div id="map" class="industryDiv">
				
				</div>
				<div id="piechart" class="industryDiv">
				
				</div>
			</div>
			<div class="helpwrap" >
				<em>도움말</em>
				<ul>
					<li>선택한 업종의 대분류를 기준으로 검색됩니다<br>예) 음식(대분류) : 중식/분식/양식 등이 검색됨</li>
					<li>분석 영역에 선택한 업종의 데이터가 없을 수도 있습니다.</li>
				</ul>
				
			</div>
		<h3>4. 창·폐업 추이</h3>
		<table class="table">
			<thead>
				<tr>
					<th rowspan="2">업종</th>
					<th rowspan="2">지역</th>
					<th colspan="2">2017년 상반기</th>
					<th colspan="4">2017년 하반기</th>
				</tr>
				<tr>
					<th>창업률</th>
					<th>폐업률</th>
					<th>창업률</th>
					<th>증감률</th>
					<th>폐업률</th>
					<th>증감률</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${openCloseGuList }" var="guVo" varStatus="status">
					<tr>
						<c:if test="${status.index%2==0 }"><th rowspan="2" class="bgpoint">${guVo.IND_M}</th></c:if>
						<c:choose>
							<c:when test="${(status.index+1)%2!=0 }">
								<th class="bgpoint2">${guVo.reg_gu}</th>
								<c:set var="OPCL_SOP" value="${guVo.OPCL_SOP }"/>
								<td>${OPCL_SOP }%</td>
								<c:set var="OPCL_SCL" value="${guVo.OPCL_SCL }"/>
								<td>${OPCL_SCL }%</td>
								<td>${guVo.OPCL_HOP }%</td>
								<td>
									<strong>
										<fmt:formatNumber value="${guVo.OPCL_HOP-OPCL_SOP }" pattern="0.00"/>%
										<c:choose >
											<c:when test="${guVo.OPCL_HOP-OPCL_SOP >0})"><span class="up">▲</span></c:when>
											<c:otherwise><span class="down">▼</span></c:otherwise>
										</c:choose>
									</strong>
								</td>
								<td>${guVo.OPCL_HCL }%</td>
								<td>
									<strong>
										<fmt:formatNumber value="${guVo.OPCL_HCL-OPCL_SCL }" pattern="0.00"/>%
										<c:choose >
											<c:when test="${guVo.OPCL_HCL-OPCL_SCL >0}"><span class="up">▲</span></c:when>
											<c:otherwise><span class="down">▼</span></c:otherwise>
										</c:choose>
									</strong>
								</td>
							</c:when>
							<c:when test="${(status.index+1)%2==0 }">
								<th class="bgpoint2">대전광역시</th>
								<c:set var="OPCL_SOP" value="${openCloseSiList[status.index].OPCL_SOP }"/>
								<td>${OPCL_SOP }%</td>
								<c:set var="OPCL_SCL" value="${openCloseSiList[status.index].OPCL_SCL }"/>
								<td>${OPCL_SCL }%</td>
								<td>${openCloseSiList[status.index].OPCL_HOP }%</td>
								<td>
									<strong>
										<fmt:formatNumber value="${openCloseSiList[status.index].OPCL_HOP-OPCL_SOP }" pattern="0.00"/>%
										<c:choose >
											<c:when test="${openCloseSiList[status.index].OPCL_HOP-OPCL_SOP >0}"><span class="up">▲</span></c:when>
											<c:otherwise><span class="down">▼</span></c:otherwise>
										</c:choose>
									</strong>
								</td>
								<td>${openCloseSiList[status.index].OPCL_HCL }%</td>
								<td>
									<strong>
										<fmt:formatNumber value="${openCloseSiList[status.index].OPCL_HCL-OPCL_SCL }" pattern="0.00"/>%
										<c:choose >
											<c:when test="${openCloseSiList[status.index].OPCL_HCL-OPCL_SCL >0}"><span class="up">▲</span></c:when>
											<c:otherwise><span class="down">▼</span></c:otherwise>
										</c:choose>
									</strong>
								</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$("#data").on("click", function() {
		document.all['dataPop'].style.visibility = "visible";
	});
	
	$("#dataClose").on("click", function() {
		document.all['dataPop'].style.visibility = "hidden";
	});
	
	var rankmarker = document.getElementById("rankmarker");
	var deg = (("${ratingGrade.rg_level }"*1)-1)*45+90;
	rankmarker.style.WebkitTransform= "rotate("+deg+"deg)";

	//지역별 평가지수 추이 그래프
	google.charts.load('current', {'packages':['line']});
	google.charts.setOnLoadCallback(drawChartGraph);
	
	function drawChartGraph() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', ' ');
		data.addColumn('number', '행정동');
		data.addColumn('number', '시군구');
		data.addColumn('number', '광역시도');
		
		var chartArray=new Array();
		
		<c:forEach items="${dongRatingList}" var="vo" varStatus="status">
			var tempArray = new Array();
			<fmt:formatDate var="to" type="date" value="${vo.rt_month}" pattern="yyyy.MM.dd"/>
			tempArray.push(new Date("${to}"));
			tempArray.push("${vo.rt_avg}"*1.0);
			tempArray.push("${guRatingList[status.index].rt_avg}"*1.0);
			tempArray.push("${siRatingList[status.index].rt_avg}"*1.0);
			chartArray.push(tempArray);
		</c:forEach>
		
		data.addRows(chartArray);
		
		var options = {
		  width: 1170,
		  height: 500,
		  hAxis: {
			  format: 'yyyy-MM'
		  }
		};
		
		var chart = new google.charts.Line(document.getElementById('ratingChart'));
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
	
	//지도 그리기...
	var map;
	var polygonPath = new Array();
	var x = 0;
	var y = 0;
	<c:forEach items="${analysisRecVo}" var="vo" varStatus="status">
		if("${vo.AN_SHAPE}"=="2"){//원이면
			makeCir("${vo.AN_COORX}", "${vo.AN_COORY}", "${vo.AN_RAD}");
		}else if("${vo.AN_SHAPE}"=="1"){
			makeMap("${vo.AN_COORX}", "${vo.AN_COORY}");
		}else{
			polygonPath.push(new daum.maps.LatLng("${vo.AN_COORY}", "${vo.AN_COORX}"));
			x += parseFloat("${vo.AN_COORX}");
			y += parseFloat("${vo.AN_COORY}");
			if("${status.last}"=="true"){
				makePoly(x, y);
			}
		}
	</c:forEach>
	
	//마커일때 지도그리기
	function makeMap(x, y){
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(y, x),
			level : 4
		};

		map = new daum.maps.Map(mapContainer, mapOption);
	}
	
	//원
	function makeCir(x, y, rad){
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(y, x),
			level : 4
		};

		map = new daum.maps.Map(mapContainer, mapOption);
		var circle = new daum.maps.Circle({
		    center : new daum.maps.LatLng(y, x),  // 원의 중심좌표 입니다 
		    radius: rad, // 미터 단위의 원의 반지름입니다 
		    strokeWeight: 5, // 선의 두께입니다 
		    strokeColor: '#75B8FA', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'dashed', // 선의 스타일 입니다
		    fillColor: '#CFE7FF', // 채우기 색깔입니다
		    fillOpacity: 0.7  // 채우기 불투명도 입니다   
		}); 
	
		// 지도에 원을 표시합니다 
		circle.setMap(map); 
	}
	
	//다각
	function makePoly(x, y){
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(y/parseInt("${fn:length(analysisRecVo)}"), x/parseInt("${fn:length(analysisRecVo)}")),
			level : 4
		};

		map = new daum.maps.Map(mapContainer, mapOption);
		console.log(parseFloat(x));
		console.log("${fn:length(analysisRecVo)} ");
		
		// 지도에 표시할 다각형을 생성합니다
		var polygon = new daum.maps.Polygon({
		    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
		    strokeWeight: 3, // 선의 두께입니다
		    strokeColor: '#39DE2A', // 선의 색깔입니다
		    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'longdash', // 선의 스타일입니다
		    fillColor: '#A2FF99', // 채우기 색깔입니다
		    fillOpacity: 0.7 // 채우기 불투명도 입니다
		});

		// 지도에 다각형을 표시합니다
		polygon.setMap(map);
	}
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = new Array();
	<c:forEach items="${storeList}" var="vo" varStatus="status">
		var store = new Object();
		store.content= '<div>'+"${vo.bizesNm}"+'<br>${vo.lnoAdr}'+'</div>';
		store.latlng=new daum.maps.LatLng("${vo.lat}","${vo.lon}" );
		positions.push(store);
	</c:forEach>

	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new daum.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}	
	
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
      var pieChartArray = new Array();
      var tempA = new Array();
      tempA.push("industryM");
      tempA.push("industryCount");
      pieChartArray.push(tempA);
      
      <c:forEach items="${storeList}" var="vo">
   		var b = true;
      	for(var i=0; i<pieChartArray.length; i++){
      		if(pieChartArray[i][0]=="${vo.indsMclsNm}"){
      			pieChartArray[i][1] += 1;
      			b = false;
      			break;
      		}
      	}
      	if(b){
			var tempArray = new Array();
			tempArray.push("${vo.indsMclsNm}");
			tempArray.push(1);
			pieChartArray.push(tempArray);
      	}
      </c:forEach>
      
      var jsonArray = {};
      var keyname='';
      <c:forEach items="${industryList }" var="vo">
	      for(var i=0; i<pieChartArray.length; i++){
	    	  if(pieChartArray[i][0]=="${vo.IND_M }"){
	    		  var offset = {offset: 0.2};
	    		  jsonArray[keyname+i-1] = offset;
	    		  break;
	    	  }
	      }
      </c:forEach>
      
      var data = google.visualization.arrayToDataTable(pieChartArray);

      var options = {
        title: '중분류별 포화도',
        legend: 'none',
        pieSliceText: 'label',
        slices: jsonArray,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
      chart.draw(data, options);
    }
</script>
