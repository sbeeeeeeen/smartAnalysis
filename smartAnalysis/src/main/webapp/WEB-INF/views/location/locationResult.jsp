<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://cdn.anychart.com/releases/8.3.0/js/anychart-base.min.js"></script>
<script
	src="https://cdn.anychart.com/releases/8.3.0/js/anychart-ui.min.js"></script>
<script
	src="https://cdn.anychart.com/releases/8.3.0/js/anychart-exports.min.js"></script>
<script
	src="https://cdn.anychart.com/releases/8.3.0/js/anychart-radar.min.js"></script>
<link href="/css/taResultcss.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.anychart.com/releases/8.3.0/css/anychart-ui.min.css" />
<link rel="stylesheet"
	href="https://cdn.anychart.com/releases/8.3.0/fonts/css/anychart-font.min.css" />
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb644c37976923768ed9844acacf0748"></script>
	
<script>
	var Ldata;
	(function($) {
		$.ajax({
			url : "/location/analysisData",
			async : false,
			dataType : "JSON",
			method : "post",
			data : {
				"analysisNum" : "${analysisNum}"
			},
			success : function(data) {
				Ldata = data;
			},
			error : function() {
				alert("error");
			}
		});

	})(jQuery);
	
	$(document).ready(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(Ldata.analysisRecVo[0].an_COORY, Ldata.analysisRecVo[0].an_COORX), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var markerPosition  = new daum.maps.LatLng(Ldata.analysisRecVo[0].an_COORY, Ldata.analysisRecVo[0].an_COORX); 
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
	    map.setDraggable(false);
	    map.setZoomable(false);
	    
	    var icon = document.getElementById("icon");
	    
	    icon.style.transform = "rotate("+ (Ldata.totalCnt+1)*45  +"deg)";
	    	
    	var qlist ="";
    	$.each(Ldata.qList, function(index, value){
    		qlist+= "<tr class=\"top5\"><td>"+ value.name +"</td><td><strong><span class=\"rank"+value.rank+"\">■</span>"+ value.rank +"등급</strong></td></tr>";
    	})
    	var flist ="";
    	$.each(Ldata.fList, function(index, value){
    		flist+= "<tr class=\"top5\"><td>"+ value.name +"</td><td><strong><span class=\"rank"+value.rank+"\">■</span>"+ value.rank +"등급</strong></td></tr>";
    	})
    	var dlist ="";
    	$.each(Ldata.dList, function(index, value){
    		dlist+= "<tr class=\"top5\"><td>"+ value.name +"</td><td><strong><span class=\"rank"+value.rank+"\">■</span>"+ value.rank +"등급</strong></td></tr>";
    	})
    	var sumrank = "";
    	
    	if(Ldata.lVo[2].cnt > Ldata.lVo[3].cnt && Ldata.lVo[2].cnt > Ldata.lVo[6].cnt){
    		sumrank = "소매업";
    		topRank(Ldata.dList);
    	}else if(Ldata.lVo[6].cnt > Ldata.lVo[2].cnt && Ldata.lVo[6].cnt> Ldata.lVo[3].cnt){
    		sumrank = "음식업";
    		topRank(Ldata.qList);
    	}else{
    		sumrank = "서비스업";
    		topRank(Ldata.fList);
    	}
    	
    	$("#qlist").html(qlist);
    	$("#dlist").html(dlist);
    	$("#flist").html(flist);
		$("#sumrank").html(sumrank);
		$("#sumrank1").html(sumrank);
		
   		
		
		
	    if(Ldata.floating.ft_count > Ldata.rectal.rs_count && Ldata.floating.ft_count > Ldata.residential.rst_COUNT){
	    	$("#totalperson").html("'유동");
	    }else if(Ldata.rectal.rs_count > Ldata.residential.rst_COUNT){
	    	$("#totalperson").html("'직장");
	    }else{
	    	$("#totalperson").html("'주거");
	    }
	    
	})
	function topRank(list){
		var topRank = "";
		for(var i = 0; i < 3 ; i++){
   			topRank += "'" + list[i].name + "'";
   			if(i != 2){
   				topRank += ",  ";
   			}
   		}
		$("#topRank").html(topRank);
	}
	var Larr = new Array();
	var Marr = new Array();;
	// create data set on our data
	for (var i = 0; i < Ldata.lVo.length; i++) {
		if(Ldata.lVo[i].code == "Q" || Ldata.lVo[i].code == "D" || Ldata.lVo[i].code == "F"){
			Larr.push([Ldata.lVo[i].name, Ldata.lVo[i].rank]);
		}else{
			Marr.push([Ldata.lVo[i].name, Ldata.lVo[i].rank]);
		}
	}
	anychart.onDocumentReady(function() {
				var dataSet = anychart.data.set(Larr);

				// map data for the first series, take x from the zero column and value from the first column of data set
				var data1 = dataSet.mapAs({
					'x' : 0,
					'value' : 1
				});
				// create radar chart
				var chart = anychart.radar();
				// set chart yScale settings
				chart.yScale().minimum(1).maximum(5).ticks().interval(1);

				// set xAxis labels settings
				chart.xAxis().labels().padding(5);

				// set chart legend settings
				chart.legend().align('center').enabled(true);

				// create first series with mapped data
				var series1 = chart.line(data1).name('대분류');
				series1.markers().enabled(true).type('circle').size(3);

				// chart tooltip format
				chart.tooltip().format('Value: {%Value}');

				// set container id for the chart
				chart.container('containerl');
				chart.draw();
			});
	anychart.onDocumentReady(function() {
				// create data set on our data
				
				var dataSet = anychart.data.set(Marr);

				// map data for the first series, take x from the zero column and value from the first column of data set
				var data1 = dataSet.mapAs({
					'x' : 0,
					'value' : 1
				});
				// create radar chart
				var chart = anychart.radar();
				// set chart yScale settings
				chart.yScale().minimum(1).maximum(5).ticks().interval(1);

				// set xAxis labels settings
				chart.xAxis().labels().padding(5);

				// set chart legend settings
				chart.legend().align('center').enabled(true);

				// create first series with mapped data
				var series1 = chart.line(data1).name('증분류');
				series1.markers().enabled(true).type('circle').size(3);

				// chart tooltip format
				chart.tooltip().format('Value: {%Value}');

				// set container id for the chart
				chart.container('containerm');
				chart.draw();
			});
	
	console.log(Ldata);
	
	$(document).on("click", "#data", function() {
		document.all['dataPop'].style.visibility = "visible";
	});
	
	$(document).on("click", "#dataClose", function() {
		document.all['dataPop'].style.visibility = "hidden";
	});
</script>


<style>

.top5:nth-child(-n+5){
	background: #f5f6f1;
}

.fa-3x {
    font-size: 3em;
    position: absolute;
    right: 325px;
    top: 645px;
}

.rank1{
	color: #28aee4;
}
.rank2{
	color: #6abd45;
}
.rank3{
	color: #fec00f;
}
.rank4{
	color: #f05823;
}
.rank5{
	color: #ed2024;
}
.rank1,.rank2,.rank3,.rank4,.rank5{
	margin-right: 5px;
	font-size: 22px;
}
#title {
	font-family: 'Open Sans', Arial, sans-serif;
	font-size: 21px;
	margin-top: 50px;
	margin-bottom: 10px;
	padding: 30px;
	padding-left: 0px;
	color: #2e70c2;
    line-height: 22px;
}

.analysisRes, .industry {
	border: 1px solid #d0d0d6;
}
.industry{
	width: 31%;
	float: left;
	margin: 12px;
}
.pstrong{
	color: #3c64db;
	font-size: 18px;
}

.analysisRes th,.industry th {
	background: #f0f3f5;
	text-align: center;
	color: #333;
	width: 50%;
	vertical-align: middle;
	border: 1px solid #d0d0d6;
}
.ana th{
width: 33%;
font-size: 18px;
}

.analysisRes td, .industry td {
	border: 1px solid #d0d0d6;
	text-align: center;
	font-size: 15px;
}

#container, #containerl, #containerm {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

html, body, #container {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.help em {
	background: #ccc /* url(../img/help.png) no-repeat top left */;
	float: left;
	display: inline-block;
	width: 56px;
	height: 18px;
	margin-top: 3px;
	color: #fff;
	font-size: 12px;
	font-weight: 700;
	padding-left: 9px;
	padding-top: 1px;
	font-style: normal;
	margin: 0;
	line-height: 150%;
}

.helpwrap {
	background-color: #f5f6f1;
	padding: 20px 17px;
	margin: 0;
}

.help ul {
	display: inline-block;
	font-size: 13px;
	max-width: 885px;
}
.resultwrap {
    clear: both;
    border-top: 2px solid #3c64db;
    background-color: #fff;
    border-bottom: 1px solid #ccc;
    padding: 20px 0;
    display: table;
    width: 100%;
    line-height: 160%;
    margin: 50px 0 50px 0;
}
.resultwrap .col:nth-child(1) {
    text-align: center;
    width: 90px;
    font-size: 18px;
    padding: 0;
}

.resultwrap .col {
    display: table-cell;
    padding: 10px 15px;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
    vertical-align: middle;
}
.evaluation{
	float: left;
	width: 500px;
	height: 500px;
	margin-bottom: 40px;
}
#map{
	float: left;
	width: 100%;
	height: 100%;
	
}
.mapwrap{
	padding: 20px;
	border: 1px solid #ccc;
	width: 100%;
	height: 100%;
}

.avgrwap{
	height: 550px;
}

.imgrwap{
	width: 100%;
	height: 100%;
	text-align: center; 
}
h4 strong{
    color: #1151a4;
    font-weight: 700;
    margin-left: 12px;
    
}
.grade-info.grade5 {
    background-color: #f8c01a;
    color: #fff;
    margin-top: 50px;
}
.grade-report-text {
    text-align: center;
    padding: 0 30px 0 30px;
    font-size: 15px;
    line-height: 120%;
}
.text-center {
    text-align: center !important;
}
.pd-text {
    text-align: left;
    margin-top: 40px;
    padding-left: 600px;
    font-size: 16px;
    line-height: 30px;
}
.grade-info {
    display: inline-block;
    margin: -10px auto 0 auto;
    border-radius: 10px;
    padding: 13px 20px;
    text-align: center; 
    color: #fff;
    font-size: 16px;
    line-height: 16px;
    font-weight: 700;
}
.graph-l{
	height: 100%;
	width: 50%;
	float: left;
}
.graph-m{
	height: 100%;
	width: 50%;
	float: right;
}
.graphwarp{
	width: 1000px;
	height: 500px;
}

.pop-layer{
	border: 1px solid #ddd;
    position: absolute;
    left: 200px;
    top: 100px;
    z-index: 200;
    width: 960px;
    padding: 20px;
    visibility: hidden;
    align: center;
    background-color: white;
}

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
<div class="container">
	<div class="page-header">
		<a id="data" href="#dataPop" class="btn helpinfo">
			<i class="fa fa-question-circle" aria-hidden="true"></i>
			<span>자료정보</span>
		</a>
		<h2>입지분석 보고서</h2>
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
						<td>소상공인시장진흥공단</td>
						<td>상권정보</td>
						<td>2018.10</td>
						<td>선택 지역 상권 정보</td>
					</tr>
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
				</tbody>
			</table>
			<div class="layer-pop-footer" align="center">
				<ul style="text-align: center;">
					<li id="dataClose" class="btn btn-warning">닫기</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="title">분석설정정보</div>
	<table class="table analysisRes">
		<thead>
			<tr>
				<th>분석지역</th>
				<th>기준데이터시점</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><script>
					document.write(Ldata.region.reg_si + " "+ Ldata.region.reg_gu + " "+ Ldata.region.reg_dong);
				</script></td>
				<td><script>
					document.write(Ldata.analysisList[0].AN_DT)
				</script></td>
			</tr>
		</tbody>
	</table>

	<div id="title">1. 평가종합</div>
	<div class="avgrwap">
	<!-- 지도 출력 -->
		<div class="evaluation">
			<div class="mapwrap">
				<div id="map"></div>
			</div>
		</div>
	<div class="imgrwap">
		<div>
			<img src="/img/rank.png"width="270" height="135" style="margin-top: 80px;">
			<i class="fa fa-map-marker fa-3x" id="icon"></i>
		</div>
		<div class = "grade-report-text">
			<p class="grade-center">
				<span class="grade-info grade5">
                                    
                                                종합입지등급 : <script>document.write(Ldata.totalCnt);</script>등급
               </span>
			</p>
			<div class="pd-text">
				
                                             해당 지점은 종합입지등급 ‘<strong><script>document.write(Ldata.totalCnt);</script>등급</strong>’ 입니다.<br>
                                             종합입지등급은 45개 업종별 입지등급의 평균인만큼, 개별업종<br>의 입지등급을 참고하시기 바랍니다.
                                
			</div>
		</div>
	</div>
	</div>

	<div class="helpwrap">
		<div class="help">
			<em>도움말</em>
			<ul>
				<li><strong>종합입지등급</strong> : 선택입지에 대한 45개 표본업종 입지등급의 평균. 음식,
					소매, 서비스업 등 표본업종별 입지의 가치(예상매출액)를 평가한 등급으로 1등급에 가까울수록 좋은 입지임을 의미합니다.
					<strong>[예시]</strong> 전체 45개 입지등급 중 선택지역이 1등급인 표본업종의 수가 30개, 2등급인
					업종이 10개, 4등급인 업종이 5개인 경우, {(1*30)+(2*10)+(4*5)}/45=1.6 → 산술평균을 반올림한
					값을 이용, 종합 2등급으로 표시합니다.</li>
				<li><strong>45개 표본업종의 매출에 영향을 미치는 X변수</strong>는 각각 다르게 추출합니다. <strong>[예시]</strong>
					세탁소 : 30~40대 주거인구, 갈비/삼겹살 : 저녁 시간대 유동인구, 상권 매출규모</li>
			</ul>
		</div>
	</div>

	<div id="title">2. 업종별 입지등급</div>


	<div class="graphwarp">
	<div class="graph-l">
		<div id="containerl"></div>
	</div>
	<div class="graph-m">
		<div id="containerm"></div>
	</div>
	
	</div>
	<h4><strong>소분류</strong></h4>
	<div>
	<table class="table industry">
		<thead class="ana">
			<tr>
				<th colspan="2">음식업</th>
			</tr>
		</thead>
		<tbody id ="qlist">
		</tbody>
	</table>
	<table class="table industry">
		<thead class="ana">
			<tr>
				<th colspan="2">서비스업</th>
			</tr>
		</thead>
		<tbody id ="flist">
		</tbody>
	</table>
	<table class="table industry">
		<thead class="ana">
			<tr>
				<th colspan="2">소매업</th>
			</tr>
		</thead>
		<tbody id ="dlist">
		</tbody>
	</table>
	</div>
	
	<div class="resultwrap">
		<div class="col">분석<br><strong>결과</strong></div>
		<div class="col">
			<ul>
				<li>선택하신 입지는 음식업 <script>document.write(Ldata.lVo[6].rank);</script>등급, 서비스업 <script>document.write(Ldata.lVo[3].rank);</script>등급, 소매업 <script>document.write(Ldata.lVo[2].rank);</script>등급으로 <strong class="pstrong">'<b id="sumrank"></b>'</strong>에 가장 적합한 입지입니다.</li>
				<li><b id="sumrank1"></b> 중에서도 선택하신 입지는 <strong class="pstrong"><b id="topRank"></b></strong>업종의 평가등급이 높게 나타납니다.</li>
			</ul>
		</div>
	</div>	
	
	<div id="title">3. 잠재고객 분석</div>
	
	
	<table class="table analysisRes">
		<thead class="ana">
			<tr>
				<th>유동인구(선택지역 내 반경 25m)</th>
				<th>주거인구(선택지역)</th>
				<th>직장인구(선택지역)</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><script>document.write(Ldata.floating.ft_count)</script> 명</td>
				<td><script>document.write(Ldata.residential.rst_COUNT)</script> 명</td>
				<td><script>document.write(Ldata.rectal.rs_count)</script> 명</td>
			</tr>
		</tbody>
	</table>
	
	<div class="resultwrap">
		<div class="col">분석<br><strong>결과</strong></div>
		<div class="col"><ul><li>잠재고객이 될 가능성이 가장 큰 유형은 <strong class="pstrong"><b id="totalperson"></b> 인구' </strong>입니다.</li></ul></div>
	</div>	
	
	<div class="helpwrap">
		<div class="help">
			<em>도움말</em>
			<ul>
				<li>잠재고객이 될 가능성은 50명 이상 일 경우 해당됩니다.</li>
				<li>유동인구는 통신사 휴대전화 통화량을 바탕으로 전국 50m셀로 추정한 유동인구수로 해당월 평균 추정데이터 입니다.</li>
			</ul>
		</div>
	</div>
	<br><br><br><br>
</div>





