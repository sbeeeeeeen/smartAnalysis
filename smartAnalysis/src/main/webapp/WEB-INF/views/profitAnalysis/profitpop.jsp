<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/profitpop.css" rel="stylesheet">
<div id="LayerPopCost" class="layer-pop layer-pop-xlg" style="top: -150px;">
	<h4 style="text-align: center;">비용입력</h4>
	<div class="layer-pop-body" style="text-align: center;" >
		<p style="color: black;"><small>- 기존사업자는 실제 발생하는 점포의 비용을 입력하시고 예비창업자는 창업 후 예상되는 비용 데이터를 입력하세요.<br>
			<span class="point"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>
				입력된 데이터는 각 업종별 표준 예시 데이터(통계청 전국사업체 총조사 기준)이므로 참고하시어 실제 데이터를 입력하시기 바랍니다.
			</span></small></p>
				<form class="form-inline ng-pristine ng-valid" name="profitfrm" role="profitfrm" id="profitfrm" action="#proSelect.jsp" method="post">
<!-- 					<a onclick="selDataClean()" class="btn btn-white btn-sm fr"><i class="fa fa-trash" aria-hidden="true"></i> 데이터 지우기</a> -->
						<table class="table table-bordered">
                            <caption class="hidden">비용입력</caption>
							<colgroup>
								<col style="width:85px">
								<col style="width:150px">
								<col style="width:65px">
								<col style="width:150px">
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th colspan="6">물건정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>임대면적</th>
									<td colspan="2">
										<strong class=""></strong>
										<label for="abda" class="sr-only">평</label>
			                            <input id="PR_MJ" name="PR_MJ" class="form-control input-xxs onlyNumber ng-pristine ng-valid" type="text" maxlength="10" 
			                            size="10" style="IME-MODE: disabled" required autofocus placeholder="30"> 평 &nbsp;
										<label for="abdb" class="sr-only"> 제곱미터</label>
                               			<input id="pr_mj_auto" name="pr_mj_auto" class="form-control input-xxs ng-pristine ng-valid" type="text" maxlength="10" 
                               			size="10" disabled="disabled" readonly="readonly" style="text-align:right;" placeholder="99"> 제곱미터
									</td>
									<th>실 면적</th>
									<td colspan="2">
										<strong class=""></strong>
										<label for="abdc" class="sr-only">평</label>
										<input id="PR_SMJ" name="PR_SMJ" class="form-control input-xxs onlyNumber ng-pristine ng-valid" type="text" maxlength="10" size="10" 
										style="text-align:right;" placeholder="24"> 평 &nbsp;  
										
										<label for="abdd" class="sr-only">제곱미터</label>
										<input id="pr_smj_auto" name="pr_smj_auto" class="form-control input-xxs ng-pristine ng-valid" type="text" maxlength="10" 
										size="10" disabled="disabled" style="text-align:right;" placeholder="79"> 제곱미터
									</td>
								</tr>
								<tr class="thead">
									<th colspan="6"> 초기 투자비용</th>
								</tr>
								<tr>
									<th>권리금</th> 
									<!-- pr_glpay -->
									<td>
										<label for="pr_glpay" class="sr-only">만원</label>
		                                <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" id="PR_GLPAY" name="PR_GLPAY" 
		                                maxlength="10" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="6465">만원
									</td>
									<th>보증금</th>
									<!-- pr_bjpay -->
									<td>
										<label for="pr_bjpay" class="sr-only">만원</label>
										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_BJPAY"
										 name="PR_BJPAY" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="6000"> 만원
									</td>
									<th>대출금/이자(연간)</th>
									<!-- pr_am --> <!-- pr_ej -->
									<td>
										<label for="pr_am" class="sr-only">만원</label>
										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_AM" 
										name="PR_AM"  size="10" style="text-align:right;" placeholder="11000"> 만원 &nbsp;
										
										<label for="pr_ej" class="sr-only">%</label>
										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_EJ" 
										name="PR_EJ" size="10"  style="text-align:right;" placeholder="3"> % 
									</td>
								</tr>
								<tr>
									<th rowspan="3">기타 투자비</th>
									<td colspan="5">
										<label for="abdi">건축비</label>
										<!-- pr_bdpay -->
                                		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_BDPAY" 
                                		name="PR_BDPAY" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="480"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										

										<label for="abdl">인테리어비</label>
										<!-- pr_inte -->
                                		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_INTE" 
                                		name="PR_INTE" size="10"  onchange="getNumber(this);" style="text-align:right;" placeholder="3600"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										

										<label for="abdm">설비비</label>
										<!-- pr_sbpay -->
		                                <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_SBPAY"
		                                name="PR_SBPAY" size="10"  onchange="getNumber(this);" style="text-align:right;" placeholder="3600"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<label for="pr_mem">가맹관련</label>
										<!-- pr_mem -->
		                                <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_MEM" 
		                                name="PR_MEM" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="0"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;

										<label for="pr_otpay">기타비용</label>
										<!-- pr_otpay -->
 										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_OTPAY" 
 										name="PR_OTPAY" size="10" onchange="getNumber(this);" style="text-align:right;" placeholder="2400"> 만원 &nbsp; &nbsp; &nbsp; &nbsp;										
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
											id="allCost" name="allCost" size="10" disabled="disabled" style="text-align:right;" placeholder="22545"> 만원 &nbsp; &nbsp;
											<strong class=""></strong>
											<label for="abdk" class="sr-only">감가상각 기간</label>
											<input type="text" class="form-control input-xxs onlyNumber ng-pristine ng-valid" maxlength="10" 
											id="PR_PERI" name="PR_PERI"  size="10" style="text-align:right;" placeholder="3"> 년
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
										<label for="pr_rtpay" class="sr-only">월세</label>
										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" 
										id="PR_RTPAY" name="PR_RTPAY" data-ng-model="params.monRent" size="10" onchange="getNumber(this);" 
										style="text-align:right;" placeholder="95"> 만원 &nbsp;  
									</td>
									<th>인건비</th>
									<!-- pr_ingun -->
									<td colspan="2">
										<label for="pr_ingun" class="sr-only">인건비</label>
		                                <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_INGUN" 
		                                name="PR_INGUN" data-ng-model="params.laborCost" size="10" onchange="getNumber(this);"
		                                style="text-align:right;" placeholder="113"> 만원 &nbsp;										
									</td>
								</tr>
								<tr>
									<th>재료비</th>
									<!-- pr_mtpay -->
									<td colspan="2">
										<label for="pr_mtpay" class="sr-only">재료비</label>
                                		<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_MTPAY"
                                		name="PR_MTPAY" data-ng-model="params.materialCost" size="10" onchange="getNumber(this);" 
                                		style="text-align:right;" placeholder="0"> 만원 &nbsp;									  
									</td>
									<th>기타비용</th>
									<!-- pr_oppay -->
									<td colspan="2">
										<label for="pr_oppay" class="sr-only">기타비용</label>
										<input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" id="PR_OPPAY"
										name="PR_OPPAY" data-ng-model="params.mngEtcCost" size="10" onchange="getNumber(this);"
										style="text-align:right;" placeholder="400" > 만원 &nbsp;
										<br>※ 음식/서비스업종은 재료비를 기타비용에 포함<br>(통계청 집계기준)
									</td>
								</tr>
								<tr>
									<th colspan="4">객 단가 &nbsp; <small>※ 1명의 고객이 1회 결제 시 이용하는 평균금액</small></th>
									<!-- pr_avpay -->
									<td colspan="2">
										<strong class=""></strong>
										<label for="pr_avpay" class="sr-only">객 단가</label>
		                                <input type="text" class="form-control input-xs onlyNumber ng-pristine ng-valid" maxlength="10" 
		                                id="PR_AVPAY" name="PR_AVPAY" size="10" onchange="getNumber(this);" 
		                                style="text-align:right;" placeholder="8700"> 원 &nbsp;
									</td>
								</tr>
							</tbody>
							</table>
							<input type='reset' value="데이터 지우기" style="float: right; margin-right: 70px; padding: 3px">
						</form>
					</div>
					<div style="height: 10%" class="layer-pop-footer">
						<ul style="text-align: center;">
							<li id="selectpro" class="btn btn-theme" style="background: #546799;" value="1">확인</li>
							<li id="proclose" class="btn btn-warning">취소</li>
						</ul>
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

	
	$("#selectpro").on('click',function(){
		
		var proPop = $("#selectpro").val();		//비용입력체크
		
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
		
		$('#profitfrm').submit();
		document.all['LayerPopCost'].style.visibility = "hidden";
		
	});
	

</script>

