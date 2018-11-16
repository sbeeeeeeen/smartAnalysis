<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<link href="/css/taResultcss.css" rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<style type="text/css">
p {
	margin: 0 0 50px;
}

h3 {
	color: #68A4C4;
	margin-bottom: 30px;
	padding-top: 30px;
}

#resultTable {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#resultTable td, #resultTable th {
	border: 1px solid #ddd;
	padding: 8px;
}

#resultTable tr:nth-child(even) {
	background-color: #f2f2f2;
}

#resultTable tr:hover {
	background-color: #ddd;
}

#resultTable th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #000000;
	color: white;
}

#comment {
	background-color: lightgrey;
	padding: 25px;
	margin: 25px;
	text-align: center;
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

.pop-layer {
	border: 1px solid #ccc;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

.pop-layer {
	position: absolute;
	left: 250px;
	top: 20px;
	z-index: 200;
	width: 930px;
	/* height: 600px; */
	visibility: hidden;
	align: center;
	background-color: white;
}

.layer-pop-footer {
	width: 100%;
	vertical-align: middle;
	margin-left: auto;
	margin-right: auto;
	padding: 12px;
	text-align: center;
}

.layer-pop-footer ul {
	width: 170px;
	height: 30px;
	margin: 0 auto
}

.layer-pop-footer ul li {
	text-align: center;
	float: left;
	width: 80px;
	height: 30px;
	margin-left: 10px
}

.layer-pop-footer ul li:first-child {
	margin-left: 0
}

#dataTable th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #000000;
	color: white;
}

#dataTable td, #dataTable th {
	border: 1px solid #ddd;
	padding: 8px;
}

#dataTable tr:nth-child(even) {
	background-color: #f2f2f2;
}

#dataTable tr:hover {
	background-color: #ddd;
}
</style>

</head>
<body>

	<!-- container -->
	<div class="container ng-scope">

		<!-- 미래지향분석 보고서 큰 글자 -->
		<div class="page-header">
			<a id="data" href="#dataPop" class="btn helpinfo"><i
				class="fa fa-question-circle" aria-hidden="true"></i><span>자료정보</span></a>

			<h2>미래지향분석 보고서</h2>
		</div>

		<!-- 자료정보 팝업창 -->
		<div id="dataPop" class="pop-layer" align="center">

			<table id="dataTable" style="margin-top: 15px;">
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
						<td>도시철도공사</td>
						<td>지하철역 이용현황</td>
						<td>2017.12</td>
						<td>대전광역시 지하철 역별 평균 승하차 인원 정보</td>
					</tr>

					<tr>
						<td>대전광역시</td>
						<td>사업체수 및 종사자수 현황</td>
						<td>2015.12</td>
						<td>2015년 기준 사업체조사 결과</td>
					</tr>

					<tr>
						<td>대전광역시</td>
						<td>거주인구 현황</td>
						<td>2018.07</td>
						<td>주민등록인구현황(구별/동별/연령별)</td>
					</tr>

					<tr>
						<td>각급기관</td>
						<td>주요/집객시설</td>
						<td>2018</td>
						<td>공공, 금융, 의료, 교육, 유통, 문화, 숙박, 교통 시설 위치 및 명칭 정보</td>
					</tr>

					<tr>
						<td>-</td>
						<td>유동인구</td>
						<td>2018.06</td>
						<td>전국 주요상권 유동량 조사 정보</td>
					</tr>

					<tr>
						<td>소상공인시장진흥공단</td>
						<td>상권정보</td>
						<td>2018.10</td>
						<td>선택 지역 상권 정보</td>
					</tr>

					<tr>
						<td>한국감정원</td>
						<td>임대시세</td>
						<td>2017.12</td>
						<td>전국주요상권 및 시군구 단위 평균 임대시세</td>
					</tr>


				</tbody>
			</table>

			<div class="layer-pop-footer" align="center">
				<ul style="text-align: center;">
					<li id="dataClose" class="btn btn-warning">닫기</li>
				</ul>
			</div>

		</div>

		<!-- 분석 설정 보고 -->
		<div>
			<h3>분석 설정 보고</h3>
			<table id="resultTable">
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
						<td><c:forEach items="${indList }" varStatus="i" var="vo">
						${vo.IND_L} > ${vo.IND_M } > ${vo.IND_S} <br>
							</c:forEach></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${an_dt }" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 상권 주요 정보 -->
		<div>
			<h3>상권 주요 정보</h3>
			<table class="table">
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th colspan="5">업소수</th>
						<th rowspan="2">${indList[0].IND_M}</th>
						<c:forEach items="${indList }" varStatus="i" var="vo">
							<th rowspan="2">${vo.IND_S}</th>
						</c:forEach>
					</tr>
					<tr>
						<th>전체</th>
						<th>음식</th>
						<th>서비스</th>
						<th>도/소매</th>
						<th>선택업종 대분류</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="bgpoint2"><Strong>선택영역</Strong></td>
						<!-- 대분류 -->
						<td>${qCnt + fCnt + dCnt}</td>
						<td>${qCnt}</td>
						<td>${fCnt}</td>
						<td>${dCnt}</td>
						<td><Strong>${uCnt}</Strong></td>
						<!-- 중분류 -->
						<td><Strong>${indMCnt }</Strong></td>
						<!-- 소분류 -->
						<c:forEach items="${indsList }" varStatus="i" var="vo">
							<td><Strong>${vo }</Strong></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 사업체 수 -->
		<div>
			<h3>1. 사업체 수</h3>
			
			<h4>1-1. 학교 및 기타시설</h4>
			<div class="col-lg-6">
				<canvas id="school" width="400" height="250"></canvas>
			</div>
			<div class="col-lg-6">
				<canvas id="facility" width="400" height="250"></canvas>
			</div>

		</div>

		<p class="clearfix"></p>
		<!-- 간격 벌리기 -->

		<div>
			<h4>1-2. 사업체수 및 종사자</h4>

			<div>
				<canvas id="workTable" height="150"></canvas>
				<p class="clearfix"></p>
				<!-- 간격 벌리기 -->
			</div>

			<div>
				<table id="resultTable">
					<thead>
						<tr>
							<th>직종</th>
							<th>사업체수</th>
							<th>직종</th>
							<th>사업체수</th>
						</tr>
					</thead>

					<tbody align=center>
						<c:forEach items="${companyList}" varStatus="i" step="2">
							<tr>
								<td>${companyList[i.index].INDU_NAME}</td>
								<td>${companyList[i.index].COM_CNT}</td>
								<td>${companyList[i.index+1].INDU_NAME}</td>
								<td>${companyList[i.index+1].COM_CNT}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<h5 align="right">대전광역시 "${regionVo.reg_gu }"의 시설 자료.</h5>
		</div>

		<!-- 주거인구 -->
		<div>
			<h3>2. 주거인구</h3>
			<canvas id="resPeople" width="400" height="170"></canvas>
		</div>

		<!-- 임대료 -->
		<div>
			<h3>3. 임대료</h3>
			<div class="col-lg-6" style="width: 100%">
				<canvas id="rentPrice" style="height: 50vh; width: 80vw"></canvas>
			</div>
			<p class="clearfix"></p>
			<!-- 간격 벌리기 -->
			<table id="resultTable">
				<thead>
					<tr>
						<th>층수</th>
						<th>면적</th>
						<th>보증금(만원)</th>
						<th>임대료(만원)</th>
						<th>전세환산가(만원)</th>
						<th>제곱미터당월임대료(원)</th>
					</tr>
				</thead>

				<tbody align=center>
					<c:forEach items="${rentDtList }" var="vo" varStatus="i">
						<c:if test="${vo.rent_stairs eq '지하'}">
							<tr>
								<td><B>지하</B></td>
								<td>33.058㎡</td>
								<td>${vo.rent_dpst}</td>
								<td>${vo.rent_meter*33/10000}</td>
								<td>${vo.rent_jonse}</td>
								<td>${vo.rent_meter}</td>
							</tr>
						</c:if>

						<c:if test="${vo.rent_stairs eq '1층이상'}">
							<tr>
								<td><B>1층 이상</B></td>
								<td>33.058㎡</td>
								<td>${vo.rent_dpst}</td>
								<td>${vo.rent_meter*33/10000}</td>
								<td>${vo.rent_jonse}</td>
								<td>${vo.rent_meter}</td>
							</tr>
						</c:if>

						<c:if test="${vo.rent_stairs eq '2층이상'}">
							<tr>
								<td><B>2층 이상</B></td>
								<td>33.058㎡</td>
								<td>${vo.rent_dpst}</td>
								<td>${vo.rent_meter*33/10000}</td>
								<td>${vo.rent_jonse}</td>
								<td>${vo.rent_meter}</td>
							</tr>
						</c:if>
					</c:forEach>

				</tbody>

			</table>
		</div>

		<!-- 교통시설-->
		<div style="width: 100%">
			<h3>4. 교통시설</h3>
			<canvas id="train" style="height: 50vh; width: 80vw"></canvas>
			<h5 align="right">대전광역시 "${trainList[1].tr_name}"의 월별 승하차 자료.</h5>
		</div>

		<!--6. 평가종합 -->
		<div>
			<h3>5. 평가종합</h3>
			<h4 id="comment">
				<font color="#3366cc">${regionVo.reg_dong }</font>의 가장 많은 연령대는 <font
					color="#3366cc">${MaxAge-4 } ~ ${MaxAge }세</font>, 성별은
				<c:choose>
					<c:when test="${MaxDiv == 2}">
						<font color="#3366cc">남자</font>
					</c:when>
					<c:otherwise>
						<font color="#3366cc">여자</font>
					</c:otherwise>
				</c:choose>
				입니다. <br> <br> 잠재고객은 <font color="#3366cc">${faciNm}시설
					고객</font> 입니다.
			</h4>
		</div>

		<p class="clearfix"></p>
		<!-- 간격 벌리기 -->

	</div>
</body>
<script type="text/javascript">
	//버튼 클릭하면 도움말 팝업 보여주는 메서드
	$("#data").on("click", function() {
		document.all['dataPop'].style.visibility = "visible";
	});

	//팝업 취소 걍 숨겨주는거
	$("#dataClose").on("click", function() {
		document.all['dataPop'].style.visibility = "hidden";
	})
</script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script type="text/javascript">
	// 거주인구 차트
	var ctx = document.getElementById('resPeople');

	// 코드 짜는 부분
	var ageArray = new Array(); //나이
	<c:forEach items="${residentialAgeList}" var="vo" varStatus="status">
	ageArray.push("${residentialAgeList[status.index].RST_AGE-4}"
			+ ~+"${residentialAgeList[status.index].RST_AGE-1}" + "살");
	</c:forEach>

	var sumArray = new Array();
	var manArray = new Array();
	var girlArray = new Array();

	<c:forEach items="${residentialList1}" var="vo" varStatus="status">
	//push 합계
	sumArray.push("${residentialList1[status.index].RST_COUNT}" * 1);
	//push 남
	manArray.push("${residentialList2[status.index].RST_COUNT}" * 1);
	//push 여
	girlArray.push("${residentialList3[status.index].RST_COUNT}" * 1);

	</c:forEach>

	var barCharData = {
		labels : ageArray,
		datasets : [ {
			label : '합계',
			backgroundColor : 'rgb(51, 102, 204)',
			data : sumArray
		}, {
			label : '남',
			backgroundColor : 'rgb(244, 180, 0)',
			data : manArray
		}, {
			label : '여',
			backgroundColor : 'rgb(220, 57, 18)',
			data : girlArray
		} ]
	}

	var myBar = new Chart(ctx, {
		type : 'bar',
		data : barCharData,
		options : {
			animation : {
				duration : 4500
			},
			responsive : true,
			tooltips : {
				mode : 'index',
				intersect : true
			},
			legend : {
				display : true,
				position : 'right'
			}
		}
	});
</script>

<script type="text/javascript">
	//임대료 차트
	var ctx = document.getElementById('rentPrice');

	//코드 짜는 부분
	var oneArray = new Array();
	var twoArray = new Array();
	var b1Array = new Array();
	var avgArray = new Array();

	<c:forEach items="${rentDateList}" var="vo" varStatus="status">

	<fmt:formatDate var="to" type="date" value="${vo.rent_dt}" pattern="yy/MM/dd"/>

	if ("${to}" == '17/03/01') {
		oneArray.push("${rentList1[status.index].rent_meter}" * 1);
		twoArray.push("${rentList2[status.index].rent_meter}" * 1);
		b1Array.push("${rentList3[status.index].rent_meter}" * 1);
		avgArray
				.push("${rentList1[status.index].rent_meter + rentList2[status.index].rent_meter +  rentList3[status.index].rent_meter}" / 3);

	} else if ("${to}" == '17/06/01') {
		oneArray.push("${rentList1[status.index].rent_meter}" * 1);
		twoArray.push("${rentList2[status.index].rent_meter}" * 1);
		b1Array.push("${rentList3[status.index].rent_meter}" * 1);
		avgArray
				.push("${rentList1[status.index].rent_meter + rentList2[status.index].rent_meter +  rentList3[status.index].rent_meter}" / 3);

	} else if ("${to}" == '17/09/01') {
		oneArray.push("${rentList1[status.index].rent_meter}" * 1);
		twoArray.push("${rentList2[status.index].rent_meter}" * 1);
		b1Array.push("${rentList3[status.index].rent_meter}" * 1);
		avgArray
				.push("${rentList1[status.index].rent_meter + rentList2[status.index].rent_meter +  rentList3[status.index].rent_meter}" / 3);

	} else if ("${to}" == '17/12/01') {
		oneArray.push("${rentList1[status.index].rent_meter}" * 1);
		twoArray.push("${rentList2[status.index].rent_meter}" * 1);
		b1Array.push("${rentList3[status.index].rent_meter}" * 1);
		avgArray
				.push("${rentList1[status.index].rent_meter + rentList2[status.index].rent_meter +  rentList3[status.index].rent_meter}" / 3);
	}

	</c:forEach>

	var chartData = {

		labels : [ '17/03/01', '17/06/01', '17/09/01', '17/12/01' ],
		datasets : [ {
			label : '1층이상',
			backgroundColor : 'rgb(51, 102, 204)',
			borderColor : 'rgb(51, 102, 204)',
			data : oneArray
		}, {
			label : '2층이상',
			backgroundColor : 'rgb(244, 180, 0)',
			borderColor : 'rgb(244, 180, 0)',
			data : twoArray
		}, {
			label : '지하',
			backgroundColor : 'rgb(220, 57, 18)',
			borderColor : 'rgb(220, 57, 18)',
			data : b1Array
		}, {
			label : '평균',
			backgroundColor : 'rgb(16, 150, 24)',
			borderColor : 'rgb(16, 150, 24)',
			data : avgArray,
			type : 'line',
			borderWidth : 4,
			fill : false
		} ]

	}

	var myMixedChart = new Chart(ctx, {
		type : 'bar',
		data : chartData,
		options : {
			animation : {
				duration : 6500
			},
			responsive : true,
			tooltips : {
				mode : 'index',
				intersect : true
			},
			legend : {
				display : true,
				position : 'right'
			}
		}
	});
</script>

<script type="text/javascript">
	// 학교 시설 차트
	var ctx = document.getElementById('school');

	//코드 짜는 부분
	var tempArray = new Array();

	<c:forEach items="${schoolList}" var="vo" varStatus="status">

	if ("${schoolList[status.index].faci_div eq status.index}") {
		tempArray.push("${schoolList[status.index].faci_cnt}");
	}

	</c:forEach>

	data = {
		datasets : [ {
			data : tempArray,
			backgroundColor : [ 'rgb(51, 102, 204)', 'rgb(244, 180, 0)',
					'rgb(220, 57, 18)', 'rgb(16, 150, 24)', 'rgb(154, 0, 154)',
					'rgb(0, 153, 198)', 'rgb(228, 73, 117)' ]

		} ],
		// These labels appear in the legend and in the tooltips when hovering different arcs
		labels : [ '초등학교', '중학교', '일반계 고등학교', '특수목적고등학교', '자율고등학교', '대학교',
				'전문대학교' ]

	};

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		options : {
			animation : {
				duration : 1500
			},
			cutoutPercentage : 45
		}
	});
</script>

<script type="text/javascript">
	// 학교 제외 시설 코드 
	var ctx = document.getElementById('facility');

	//코드 짜는 부분
	var tempArray = new Array();

	<c:forEach items="${facilityList}" var="vo" varStatus="status">

	if ("${facilityList[status.index].faci_div eq status.index}") {
		tempArray.push("${facilityList[status.index].faci_cnt}");
	}

	</c:forEach>

	data = {
		datasets : [ {
			data : tempArray,
			backgroundColor : [ 'rgb(51, 102, 204)', 'rgb(244, 180, 0)',
					'rgb(220, 57, 18)', 'rgb(16, 150, 24)', 'rgb(154, 0, 154)' ]

		} ],
		// These labels appear in the legend and in the tooltips when hovering different arcs
		labels : [ '숙박', '문화시설', '공공행정기관', '금융기관', '병원' ]

	};

	var myDoughnutChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		options : {
			animation : {
				duration : 1500
			},
			cutoutPercentage : 45
		}
	});
</script>

<script type="text/javascript">
	// 교통시설
	var ctx = document.getElementById('train');

	//코드 짜는 부분
	var tr_rideArray = new Array();
	var tr_quitArray = new Array();

	<c:forEach items="${trainList}" var="vo" varStatus="status">

	if ("${trainList[status.index].tr_month eq status.index}") {
		tr_rideArray.push("${trainList[status.index].tr_ride}" * 1);
		tr_quitArray.push("${trainList[status.index].tr_quit}" * 1);
	}

	</c:forEach>

	var config = {

		labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월',
				'11월', '12월' ],
		datasets : [ {
			label : '승차수',
			data : tr_rideArray,
			fill : false,
			borderColor : 'rgb(51, 102, 204)',
			backgroundColor : 'rgb(51, 102, 204)'
		}, {
			label : '하차수',
			data : tr_quitArray,
			fill : false,
			borderColor : 'rgb(220, 57, 18)',
			backgroundColor : 'rgb(220, 57, 18)'
		} ]
	}

	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : config,
		options : {
			animation : {
				duration : 8500
			},
			responsive : true,
			legend : {
				display : true,
				position : 'right'
			}
		}
	});
</script>
<script type="text/javascript">
	//사업체수 및 종사자
	var ctx = document.getElementById('workTable');

	// datasets 
	var induNameArray = new Array(); //산업명
	var datasetsArray = new Array(); //
	var backgroundColorArray = ['rgb(51, 102, 204)', 'rgb(244, 180, 0)', 'rgb(220, 57, 18)', 'rgb(16, 150, 24)', 'rgb(154, 0, 154)',
	        					'rgb(0, 153, 198)', 'rgb(228, 73, 117)', 'rgb(102, 170, 0)', 'rgb(184, 46, 46)', 'rgb(49, 99, 149)',
	        					'rgb(51, 102, 204)', 'rgb(244, 180, 0)', 'rgb(220, 57, 18)', 'rgb(16, 150, 24)', 'rgb(154, 0, 154)',
	        					'rgb(0, 153, 198)', 'rgb(228, 73, 117)', 'rgb(102, 170, 0)', 'rgb(184, 46, 46)', 'rgb(49, 99, 149)'];
	
	var testArray = new Array();
	<c:forEach items="${companyList}" var="vo" varStatus="i">
	
		var workArray = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
		
		var datasetsInfo = new Object();
		
		testArray.push("${vo.COM_WORK}");
		induNameArray.push("${vo.INDU_NAME}");
		datasetsInfo.label = "${vo.INDU_NAME}";
		
		workArray.splice(${i.index},0,${vo.COM_WORK});
		datasetsInfo.data = workArray;
		datasetsInfo.backgroundColor = backgroundColorArray[${i.index}];
		datasetsArray.push(datasetsInfo);
	</c:forEach>
	
	var barCharData = {
		labels : induNameArray,
		datasets : datasetsArray
	};
	var data1 = {
			datasets : [ {
				data : testArray,
				backgroundColor : backgroundColorArray
			} ],
			// These labels appear in the legend and in the tooltips when hovering different arcs
			labels : induNameArray
		};
	var myBar = new Chart(ctx, {
		type : 'horizontalBar',
		data : barCharData,
		options : {
			animation : {
				duration : 4500
			},
			responsive : true,
			tooltips : {
				mode : 'index',
				intersect : true
			},
			legend : {
				display : true,
				position : 'right'
			},
			scales: {
				xAxes: [{
					stacked: true,
				}],
				yAxes: [{
					stacked: true
				}]
			}
		}
	});
</script>
