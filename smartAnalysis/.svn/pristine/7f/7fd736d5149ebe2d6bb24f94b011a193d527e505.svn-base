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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.resultwrap .col:nth-child(2) {
    line-height: 20px;
}
</style>
<div class="container">
	<div class="page-header">
		<h2>수익분석 보고서</h2>
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
					<td><%=request.getParameter("addr") %></td>
					<td>
						<c:forEach items="${industryList }" var="vo" varStatus="status" >
							${vo.IND_L } > ${vo.IND_M } > ${vo.IND_S }
						</c:forEach>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${an_dt }"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<h3>1.목표 매출 및 고객수</h3>
		<table class="table table-info">
			<thead>
				<tr>
					<th>월평균 목표매출</th>
					<th>일평균 목표매출</th>
					<th>일평균 목표 고객수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><strong>${monthSales}</strong>만원</td>
					<td><strong>${daySales}</strong>만원</td>
					<td><strong>${dayCustomer}</strong>명</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="resultwrap" style="margin: 0px;">
			<div class="col" >
				분석<br>
				<strong>결과</strong>
			</div>
			<div class="col">
				초기투자비와 월비용(고정·변동)을 고려했을 때, 적정한 월 매출수준은  <strong>${monthSales}</strong>
				만원으로 분석됩니다.
				이는 영업일 24일 기준으로는 일평균<strong> ${daySales }</strong> 만원 매출, <br><strong>${dayCustomer }</strong> 명의 고객을 유치해야 가능한 수치입니다. 
			</div>
		</div>
	</div>
	<div class="row" style="background-color: #F5F6F1; padding: 40px;">
		<ul>
			<li><p>선택위치의 입지조건(평수, 층수, 전면면적, 가시성, 접근성 등) 및 점주역량에 따라 추정매출의 편차는 발생가능합니다</li>
			<li><p>입력내용 (입력정보를 수정하신 후 [다시분석] 버튼을 누르시면 재분석이 가능합니다.)</li>
		</ul>
		<form class="form-inline ng-pristine ng-valid" id="profitRefrm" action="/profit/result" method="post">
			<input type="hidden" name="addr" value="<%=request.getParameter("addr") %>" id="addr">
			<input type="hidden" name="ujcode" value="<%=request.getParameter("ujcode") %>" id="ujcode">
			<input type="hidden" name="latlngJson" value="${latlngJson}" id="latlngJson">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="9">물건정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>임대면적</th>
						<td colspan="2">
							<strong class=""></strong>
							<label for="abda" class="sr-only">평</label>
                            <input id="PR_MJ" name="PR_MJ" class="form-control input-xxs onlyNumber ng-pristine ng-valid" type="text"
                            	maxlength="10" size="10" style="IME-MODE: disabled" placeholder="${profitVo.PR_MJ}"> 평 &nbsp;
							<label for="abdb" class="sr-only"> 제곱미터</label>
                          		<input id="pr_mj_auto" name="pr_mj_auto" class="form-control input-xxs ng-pristine ng-valid" type="text"
                          			maxlength="10" size="10" disabled="disabled" readonly="readonly" style="text-align:right;"> 제곱미터
						</td>
						<th>실 면적</th>
						<td colspan="2">
							<strong class=""></strong>
							<label for="abdc" class="sr-only">평</label>
							<input id="PR_SMJ" name="PR_SMJ" class="form-control input-xxs onlyNumber ng-pristine ng-valid" type="text"
								maxlength="10" size="10" style="text-align:right;" placeholder="${profitVo.PR_SMJ}"> 평 &nbsp;  
							<label for="abdd" class="sr-only">제곱미터</label>
							<input id="pr_smj_auto" name="pr_smj_auto" class="form-control input-xxs ng-pristine ng-valid" type="text"
								maxlength="10" size="10" disabled="disabled" style="text-align:right;"> 제곱미터
						</td>
					</tr>
					<tr class="thead">
						<th colspan="6"> 초기 투자비용</th>
					</tr>
					<tr>
						<th>권리금</th> 
						<!-- pr_glpay -->
						<td>
							<label for="PR_GLPAY" class="sr-only">만원</label>
                               <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" id="PR_GLPAY" name="PR_GLPAY"
                               	maxlength="10" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="${profitVo.PR_GLPAY}"> 만원
						</td>
						<th>보증금</th>
						<!-- pr_bjpay -->
						<td>
							<label for="PR_BJPAY" class="sr-only">만원</label>
							<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_BJPAY"
								name="PR_BJPAY" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="${profitVo.PR_BJPAY}"> 만원
						</td>
						<th>대출금/이자(연간)</th>
						<!-- pr_am --> <!-- pr_ej -->
						<td>
							<label for="PR_AM" class="sr-only">만원</label>
							<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_AM" name="PR_AM"
								size="10" style="text-align:right;" placeholder="${profitVo.PR_AM}"> 만원 &nbsp;
							<label for="PR_EJ" class="sr-only">%</label>
							<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_EJ" name="PR_EJ"
								size="10"  style="text-align:right;" placeholder="${profitVo.PR_EJ}"> % 
						</td>
					</tr>
					<tr>
						<th rowspan="3">기타 투자비</th>
						<td colspan="5">
							<label for="PR_BDPAY">건축비</label>
							<!-- pr_bdpay -->
                             		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                             			id="PR_BDPAY" name="PR_BDPAY" size="10" onchange="getNumber(this);" style="text-align:right;"
                             			placeholder="${profitVo.PR_BDPAY}"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										
							<label for="PR_INTE">인테리어비</label>
							<!-- pr_inte -->
                             		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                             			id="PR_INTE" name="PR_INTE" size="10"  onchange="getNumber(this);" style="text-align:right;"
                             			placeholder="${profitVo.PR_INTE}"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										
							<label for="PR_SBPAY">설비비</label>
							<!-- pr_sbpay -->
                               <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                               	id="PR_SBPAY" name="PR_SBPAY" size="10"  onchange="getNumber(this);" style="text-align:right;"
                               	placeholder="${profitVo.PR_SBPAY}"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<label for="PR_MEM">가맹관련</label>
							<!-- pr_mem -->
                               <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                               	id="PR_MEM" name="PR_MEM" size="10" onchange="getNumber(this);" style="text-align:right;"
                               	placeholder="${profitVo.PR_MEM}"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;
							<label for="PR_OTPAY">기타비용</label>
							<!-- pr_otpay -->
								<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
									id="PR_OTPAY" name="PR_OTPAY" size="10" onchange="getNumber(this);" style="text-align:right;"
									placeholder="${profitVo.PR_OTPAY}"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<h6>총 투자비, 감가상각 기간</h6>
							<!-- allCost --> <!-- pr_peri -->
							<p class="fr"><br>
								<strong class=""></strong>
								<label for="allCost" class="sr-only">총 투자비</label>
								<input type="text" class="form-control input-xs input-required ng-pristine ng-valid" maxlength="10"
									id="allCost" name="allCost" size="10" disabled="disabled" style="text-align:right;"> 만원 &nbsp; &nbsp;
								<strong class=""></strong>
								<label for="PR_PERI" class="sr-only">감가상각 기간</label>
								<input type="text" class="form-control input-xxs onlyNumber ng-pristine ng-valid" maxlength="10"
									id="PR_PERI" name="PR_PERI"  size="10" style="text-align:right;" placeholder="${profitVo.PR_PERI}"> 년
							</p>
							<p style="color: black;">※ 감가상각 기간은 인테리어나 설비, 집기 등 기간이 지날수록&nbsp;가치가 떨어져 <br>교체해야 하는 시기까지의 기간을 의미</p>
						</td>
					</tr>
					<tr class="thead">
						<th colspan="6">운영비용</th>
					</tr>
					<tr>
						<th>월세</th>
						<!-- pr_rtpay -->
						<td colspan="2">
							<label for="PR_RTPAY" class="sr-only">월세</label>
							<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
								id="PR_RTPAY" name="PR_RTPAY" data-ng-model="params.monRent" size="10" onchange="getNumber(this);"
								style="text-align:right;" placeholder="${profitVo.PR_RTPAY}"> 만원 &nbsp;  
						</td>
						<th>인건비</th>
						<!-- pr_ingun -->
						<td colspan="2">
							<label for="PR_INGUN" class="sr-only">인건비</label>
                               <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                               	id="PR_INGUN" name="PR_INGUN" data-ng-model="params.laborCost" size="10" onchange="getNumber(this);"
                               	style="text-align:right;" placeholder="${profitVo.PR_INGUN}"> 만원 &nbsp;										
						</td>
					</tr>
					<tr>
						<th>재료비</th>
						<!-- pr_mtpay -->
						<td colspan="2">
							<label for="PR_MTPAY" class="sr-only">재료비</label>
                             		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                             			id="PR_MTPAY" name="PR_MTPAY" data-ng-model="params.materialCost" size="10" onchange="getNumber(this);"
                             			style="text-align:right;" placeholder="${profitVo.PR_MTPAY}"> 만원 &nbsp;									  
						</td>
						<th>기타비용</th>
						<!-- pr_oppay -->
						<td colspan="2">
							<label for="PR_OPPAY" class="sr-only">기타비용</label>
							<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
								id="PR_OPPAY" name="PR_OPPAY" data-ng-model="params.mngEtcCost" size="10" onchange="getNumber(this);"
								style="text-align:right;" placeholder="${profitVo.PR_OPPAY}"> 만원 &nbsp;
							<br>※ 음식/서비스업종은 재료비를 기타비용에 포함<br>(통계청 집계기준)
						</td>
					</tr>
					<tr>
						<th colspan="4">객 단가 &nbsp; <small>※ 1명의 고객이 1회 결제 시 이용하는 평균금액</small></th>
						<!-- pr_avpay -->
						<td colspan="2">
							<strong class=""></strong>
							<label for="PR_AVPAY" class="sr-only">객 단가</label>
                               <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10"
                               	id="PR_AVPAY" name="PR_AVPAY" size="10" onchange="getNumber(this);" style="text-align:right;"
                               	placeholder="${profitVo.PR_AVPAY}"> 원 &nbsp;
						</td>
					</tr>
				</tbody>
			</table>
			<button id="reFormBtn" class="btn abtn" style="background: #68A4C4; float: right; color: #ffffff;" name="btn" value="reFormBtn">다시분석</button>
		</form>
	</div>
	<div class="row">
		<h3>2.월 소요비용</h3>
		<table class="table table-info">
			<thead>
				<tr>
					<th colspan="2">월 고정비용</th>
					<th colspan="2">월 변동비용</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<td>항목</td>
					<td>월 비용</td>
					<td>항목</td>
					<td>월 비용</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>월세<br>(월 임차료+관리비+실비)</td>
					<td><strong>${profitVo.PR_RTPAY}</strong> 만원</td>
					<td>재료비<br>(매출원가)</td>
					<td><strong>${profitVo.PR_MTPAY}</strong>만원</td>
				</tr>
				<tr>
					<td>고정인건비<br>(인건비의 70%로 계산)</td>
					<td><strong>${ingunfixing} </strong>만원</td>
					<td>변동인건비<br>(인건비의 30%로 계산)</td>
					<td><strong>${ingunVar } </strong>만원</td>
				</tr>
				<tr>
					<td>초기투자비용에 대한 월 발생비용<br>= 감가상각비 + 대출금의 이자 + 총투자비 2%<br>
												* 감가상각에 보증금은 포함되지 않습니다</td>
					<td><strong>${monthPay } </strong>만원</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>기타비용<br>(복리후생비 + 수도광열비 + 세금과 공과비+ 접대비<br> + 소모품 + 마케팅비 + 교통비 + 통신비 + 지급수수료 등</td>
					<td><strong>${profitVo.PR_OPPAY} </strong>만원</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>소계</td>
					<td><strong>${total1 }</strong>만원</td>
					<td>소계</td>
					<td><strong>${total2 }</strong> 만원</td>
				</tr>
				<tr>
					<td colspan="3">총 비용(고정비+변동비)</td>
					<td><strong>${allTotal }</strong>만원</td>
				</tr>
				<tr>
					<td colspan="2">※ 고정비용 : 판매량에 관계없이 월마다 꾸준히 지출되는 비용<br>
									※ 인건비는 고정인건비(70%)와 변동인건비(30%)로 나누어 계산하였음<br>
									※ 기타비용은 100% 고정비용으로 간주하여 계산하였음<br>
									※ 음식/서비스업종은 재료비를 기타비용에 포함(통계청 집계기준)<br></td>
					<td colspan="2">총 비용(고정비+변동비)※ 변동비용 : 판매량에 따라 월마다 달라지는 비용</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<h3>3.투자비 회수 시점별 목표매출</h3>
		<table class="table table-info">
			<thead>
				<tr>
					<th colspan="2" rowspan="2">투자비 회수</th>
					<th>월 목표매출</th>
					<th>일평균 목표매출</th>
					<th>일평균 목표고객수</th>
					<th>세금</th>
					<th>월 추정경상이익</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">회수</td>
					<td>3년 이내</td>
					<td><strong>${monthSales}</strong>만원</td>
					<td><strong>${daySales}</strong>만원</td>
					<td><strong>${dayCustomer}</strong>명</td>
					<td><strong>${tax }</strong>만원</td>
					<td><strong>${monthlyProfit }</strong>만원</td>
				</tr>
				<tr>
					<td>2년 이내</td>
					<td><strong>${monthSales_two}</strong>만원</td>
					<td><strong>${daySales_two }</strong>만원</td>
					<td><strong>${dayCustomer_two }</strong>명</td>
					<td><strong>${tax_two }</strong>만원</td>
					<td><strong>${monthlyProfit_two}</strong>만원</td>
				</tr>
				<tr>
					<td>회수불가</td>
					<td>손익분기점</td>
					<td><strong>${profit_point }</strong>만원</td>
					<td><strong>${daySales_point }</strong>만원</td>
					<td><strong>${dayCustomer_point }</strong>명</td>
					<td><strong>${tax_point }</strong>만원</td>
					<td><strong>0</strong>만원</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="resultwrap" style="margin: 40px; height: 180px;" >
			<div class="col" style="margin-top: 40px;">
				분석<br>
				<strong>결과</strong>
			</div>
			<div class="col">
				<ul>
					<li>초기투자비와 월비용(고정·변동)을 고려했을 때, <strong>3</strong>년 이내 초기투자비 회수가 가능하려면 월 목표매출은 <strong>${monthSales}</strong>만원 이상, 일평균 목표매출은 <br><strong>${daySales}</strong>만원 이상, 일 평균 목표고객은 <strong>${dayCustomer}</strong>명 이상 유치되어야 합니다.</li>
					<li>또한 <strong>2</strong>년 이내 초기투자비를 회수하시려면 월 목표매출은 <strong>${monthSales_two}</strong>만원 이상, 일평균 목표매출은 <strong>${daySales_two }</strong>만원 이상, 일 평균 목표고객은 <br><strong>${dayCustomer_two }</strong>명 이상 유치하셔야 합니다.</li>
					<li>추가적으로 초기투자비 회수는 불가하나, 월비용(고정·변동) 대비 손해를 보지 않는 <strong>손익분기</strong> 기준은 월평균 <strong>${profit_point }</strong>만원 이상, 일평균 <strong>${daySales_point }</strong>만원 이상,<br> 일평균 목표고객 <strong>${dayCustomer_point }</strong>명 이상입니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<script>
	function getNumber(obj) {
		 var pr_glpay = parseInt($("#PR_GLPAY").val() || 0 );
		 var pr_bjpay = parseInt($("#PR_BJPAY").val() || 0 );
		 var pr_bdpay = parseInt($("#PR_BDPAY").val() || 0 );
		 var pr_inte = parseInt($("#PR_INTE").val() || 0 );
		 var pr_sbpay = parseInt($("#PR_SBPAY").val() || 0 );
		 var pr_mem = parseInt($("#PR_MEM").val() || 0 );
		 var pr_otpay = parseInt($("#PR_OTPAY").val() || 0 );
		 var totalCost = pr_glpay+pr_bjpay+pr_bdpay+pr_inte+pr_sbpay+pr_mem+pr_otpay;
		$("#allCost").val(totalCost);
		
	}
	
	// 자동 평 수 계산
	$("input:text[name=PR_MJ]").keyup(function() {
	   var vp1 = parseInt($(this).val());
	   if(vp1 > 0) {
	       var va1 = Math.round(vp1 * 3.3058);
	       $("input:text[name=pr_mj_auto]").attr("value", va1);
	   }
	});
	
	$("input:text[name=PR_SMJ]").keyup(function() {
	   var vp1 = parseInt($(this).val());
	   if(vp1 > 0) {
	       var va1 = Math.round(vp1 * 3.3058);
	       $("input:text[name=pr_smj_auto]").attr("value", va1);
	   }
	});
	
	//다시분석하기
	$("#reFormBtn").on("click", function(){

		var pr_mj = $("#PR_MJ").val();			//임대면적
		var pr_smj = $("#PR_SMJ").val();		//실면적
		var pr_glpay = $("#PR_GLPAY").val();	//권리금
		var pr_bjpay = $("#PR_BJPAY").val();	//보증금
		var pr_am = $("#PR_AM").val();			//대출금
		var pr_ej = $("#PR_EJ").val();			//이자
		var pr_bdpay = $("#PR_BDPAY").val();	//건축비
		var pr_inte = $("#PR_INTE").val();		//인테리어비
		var pr_sbpay = $("#PR_SBPAY").val();	//설비비
		var pr_mem = $("#PR_MEM").val();		//가맹관련
		var pr_otpay = $("#PR_OTPAY").val();	//기타비용
		var pr_peri = $("#PR_PERI").val();		//감가상각기간
		var pr_rtpay = $("#PR_RTPAY").val();	//월세
		var pr_ingun = $("#PR_INGUN").val();	//인건비
		var pr_mtpay = $("#PR_MTPAY").val();	//재료비
		var pr_oppay = $("#PR_OPPAY").val();	//기타비용
		var pr_avpay = $("#PR_AVPAY").val();	//객단가
		

		if(pr_mj.length==0){
			$("#PR_MJ").val($("#PR_MJ").attr('placeholder'));
		}
		if(pr_smj.length==0){
			$("#PR_SMJ").val($("#PR_SMJ").attr('placeholder'));
		}
		if(pr_glpay.length==0){
			$("#PR_GLPAY").val($("#PR_GLPAY").attr('placeholder'));
		}
		if(pr_bjpay.length==0){
			$("#PR_BJPAY").val($("#PR_BJPAY").attr('placeholder'));
		}
		if(pr_am.length==0){
			$("#PR_AM").val($("#PR_AM").attr('placeholder'));
		}
		if(pr_ej.length==0){
			$("#PR_EJ").val($("#PR_EJ").attr('placeholder'));
		}
		if(pr_bdpay.length==0){
			$("#PR_BDPAY").val($("#PR_BDPAY").attr('placeholder'));
		}
		if(pr_inte.length==0){
			$("#PR_INTE").val($("#PR_INTE").attr('placeholder'));
		}
		if(pr_sbpay.length==0){
			$("#PR_SBPAY").val($("#PR_SBPAY").attr('placeholder'));
		}
		if(pr_mem.length==0){
			$("#PR_MEM").val($("#PR_MEM").attr('placeholder'));
		}
		if(pr_otpay.length==0){
			$("#PR_OTPAY").val($("#PR_OTPAY").attr('placeholder'));
		}
		if(pr_peri.length==0){
			$("#PR_PERI").val($("#PR_PERI").attr('placeholder'));
		}
		if(pr_rtpay.length==0){
			$("#PR_RTPAY").val($("#PR_RTPAY").attr('placeholder'));
		}
		if(pr_ingun.length==0){
			$("#PR_INGUN").val($("#PR_INGUN").attr('placeholder'));
		}
		if(pr_mtpay.length==0){
			$("#PR_MTPAY").val($("#PR_MTPAY").attr('placeholder'));
		}
		if(pr_oppay.length==0){
			$("#PR_OPPAY").val($("#PR_OPPAY").attr('placeholder'));
		}
		if(pr_avpay.length==0){
			$("#PR_AVPAY").val($("#PR_AVPAY").attr('placeholder'));
		}
		
		swal('INFO', '다시분석합니다.', 'info')
		
		$("#profitRefrm").submit();
		

	
		
	});
	
	
	
</script>
