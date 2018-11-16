<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script>
$(function() {
    $( "#testDatepicker" ).datepicker({
    	
    	 dateFormat: 'yy/mm/dd',
         prevText: '이전 달',
         nextText: '다음 달',
         showOn: "both",
         buttonImage:'/Moderna/img/btn_calendar.gif',
         buttonImageOnly : true,
         buttonText: '날짜를 선택하세요',
         showButtonPanel: true, 
         minDate: 0,
         currentText: '오늘 날짜', 
         closeText: '닫기', 
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         showMonthAfterYear: true,
         yearSuffix: '년'
    });
});

function mainView(){
	if(confirm("취소 하시겠습니까?")){
		$("#mainFrm").submit();
	}else{
		return;
	}
}
function consult(){
	if($("#testDatepicker").val()==""){
		alert("날짜를 선택하세요");
		$("#testDatepicker").focus();
		return;
	}
	if($("#proSel").val()=="no"){
		alert("컨설턴트를 선택해주세요.");
		$("#proSel").focus();
		return;
	}
	if($("#reqContent").val()==""){	//신청 사유 공백일때
		alert("신청 사유를 적어주세요");
		$("#reqContent").focus();
		return;
	}
	
	var sel = $("#proSel option:selected").val();
	var content = $("#reqContent").val();
	var date = $("#testDatepicker").val();
	
	if($(":input:radio[name=isPublic]:checked").val()=='Y'){	//정보 동의서 동의 했을때
		$.ajax({
			url : "/consulting/submit"
			,contextType : "application/json;charset=UTF-8"
			,dateType : "json"
			,type : "get"
			,data : {
						"pro_num" : sel
						,"cst_content" : encodeURI(content)
						,"cst_dt" : date
					}
			,success : function(e){
				alert("검토 후 연락 드리겠습니다");
				$("#mainFrm").submit();
			}
			,error : function(error){
				alert("실패");
			}
		});
		
	}else{
		alert("개인정보 수집·이용 / 제공 동의서를 동의해 주세요");
		$("#isPublic1").focus();
		return;
	}
}
</script>
<body>
<div class="container">
	<div class="contentarea">
	<div class="page-header"><h1>컨설팅 신청</h1></div>
<!-- 	<form id="mainFrm" action="/consulting/submit"></form> -->
	<form id="mainFrm" action="/main/view"></form>
	
	<form id="form" name="form" method="post" enctype="multipart/form-data">
		<div id="reqInfo" style="pointer-events: auto; opacity: 1;">
		<h4>※기본정보</h4>
		<table class="table write">
			<colgroup>
				<col class="WP15">
				<col class="WP35">
				<col class="WP15">
				<col class="WP35">
			</colgroup>
			<tbody>
				<tr>
					<th style="width: 180px;">신청인(대표자)</th>
					<td>
						<input type="text" id="reqNm" name="reqNm" value="${memberVo.mem_name}" readonly="readonly" title="신청인(대표자)">
					</td>
				</tr>
				<tr>
					<th>휴대폰*</th>
					<td>
						<input type="text" id="mobileNo1" name="mobileNo1" size="3" maxlength="3" value="${fn:substring(memberVo.mem_call,0,3)}" title="휴대폰 앞번호"> -
						<input type="text" id="mobileNo2" name="mobileNo2" size="4" maxlength="4" value="${fn:substring(memberVo.mem_call,3,7)}" title="휴대폰 중간번호"> -
						<input type="text" id="mobileNo3" name="mobileNo3" size="4" maxlength="4" value="${fn:substring(memberVo.mem_call,7,11)}" title="휴대폰 뒷번호">
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td>
						<input type="text" id="reqEmail" name="reqEmail" value="${memberVo.mem_email}" title="전자우편">
					</td>
				</tr>
				<tr>
					<th>창업 예정시기</th>
					<td colspan="3">
						<input type="text" id="testDatepicker" disabled="disabled">  
					</td>
				</tr>
			</tbody>
		</table>
	
		<h4>※컨설팅 신청 내용</h4>
		<table class="table write">
			<colgroup>
				<col class="WP15">
				<col class="WP85">
			</colgroup>
			<tbody>
				<tr>
					<th style="width: 180px;">컨설턴트 선택*</th>
					<td>
						<select id="proSel" name="proSel">
							<option value="no">===============선택===============</option>
							<c:forEach items="${proList}" var="list">
								<option value="${list.pro_num}">${list.mem_id} / ${list.pro_cost}원 / ${list.pro_intro}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th style="width: 180px;">컨설팅 신청 사유*</th>
					<td colspan="2">
						<b>◎ 전문 컨설턴트의 도움을 필요로 하는 이유를 중심으로 신청자의 현재 상황을 기재</b><br>
						<textarea id="reqContent" name="reqContent" rows="5" style="width:95%"></textarea>
					</td>
				</tr>
	              </tbody>
	          </table>
		</div>
		<br>
		
	    <div id="agreInfo" style="pointer-events: auto; opacity: 1;">
	    
		<p align="center" style="font-size: 18px;">&lt; 개인정보 수집·이용 / 제공 동의서 &gt;</p>
		<table class="table write">
			<colgroup>
				<col class="WP100">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<textarea cols="114" rows="10" style="width:96%" readonly="">소상공인시장진흥공단 이사장 귀하
	
	본인과 관련하여 귀사가 본인의 개인정보를 수집·이용·제공하고자 하는 경우에는「개인정보 보호법」제15조 제1항 제1호, 제17조 제1항 제1호, 제24조 제1항 제1호에 따라 본인의 동의를 얻어야 합니다. 이에 본인은 아래의 내용과 같이 본인의 개인정보를 수집·이용·제공하는 것에 동의합니다.
	
	1. 개인정보의 수집·이용에 관한 사항
	  ￭ 수집·이용 목적
	    ‐ 귀하의 개인정보는 소상공인컨설팅 지원사업의 효율적 수행을 위한 활용 및 연계기관(중소벤처기업부)에 귀하의 개인정보를 제공하기 위한 목적으로 수집·이용됩니다. 
	  ￭ 개인정보의 수집항목
	    ‐ 성명, 생년월일, 성별, 유선전화번호, 휴대전화번호, 주소, 이메일, 창업예정지역, 창업예상금액, 경력, 창업예정시기, 업체명, 업종, 종업원수, 사업개시일, 창업준비기간, 사업자등록번호, 사업장주소, 매출액(월), 순수익(월), 점포면적, 점포입지구분, 점포관리비(월), 점포권리금, 점포소유유형, 환불받을 은행 및 계좌번호(예금주명 포함), 접속IP, 접속로그
	  ￭ 보유 및 이용 기간
	    ‐ 귀하의 개인정보는 수집·이용에 관한 동의일로부터 10년까지 보유·이용됩니다.
	  ￭ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
	    ‐ 위 개인정보의 수집·이용에 동의하지 않으실 경우 컨설팅 지원사업 참여 및 지원 등에 제한될 수 있습니다.
	
	2. 개인정보의 제공에 관한 사항
	  ￭ 개인정보를 제공받는 자
	    ‐ 연계기관 : 중소벤처기업부, 연구기관, 소상공인방송정보원
	  ￭ 개인정보를 제공받는 자의 개인정보 이용 목적
	    ‐ 정부와 지자체 중소기업(소상공인) 지원사업의 효율적 수행을 위해 운영하는 “중소기업 지원사업 통합관리시스템” 에서 수혜기업 지원이력 정보의 수집‧조회 및 활용
	  ￭ 제공하는 개인정보 항목
	    ‐ 성명, 생년월일, 성별, 유선전화번호, 휴대전화번호, 주소, 이메일, 창업예정지역, 창업예상금액, 경력, 창업예정시기, 업체명, 업종, 종업원수, 사업개시일, 창업준비기간, 사업자등록번호, 사업장주소, 매출액(월), 순수익(월), 점포면적, 점포입지구분, 점포관리비(월), 점포권리금, 점포소유유형
	  ￭ 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간
	    ‐ 귀하의 개인정보는 수집·이용에 관한 동의일로부터 10년까지 보유·이용됩니다.
	  ￭ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
	    ‐ 위 개인정보의 수집·이용에 동의하지 않으실 경우 컨설팅 지원사업 참여 및 지원 등에 제한될 수 있습니다.</textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;본인은 귀사에 위의 목적으로 본인의 개인정보를 수집·이용 및 제공하는 것에 동의합니다.</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<input type="radio" id="isPublic1" name="isPublic" value="Y" title="동의함"><label for="isPublic1">동의함</label>
						<input type="radio" id="isPublic2" name="isPublic" value="N" title="동의안함"><label for="isPublic2">동의안함</label>
					</td>
				</tr>
			</tbody>
		</table>
	    </div>
	
		<br>
	
		<div class="pull-right">
			<input style="background-color: #2e2e2e;color: white" class="btn btn-mini" type="button" id="btnCancel" value="취소" title="취소" onclick="mainView()">
			<input style="background-color: #2e2e2e;color: white" class="btn btn-mini" type="button" id="btnCommit" value="신청완료" title="신청완료" onclick="consult()">
		</div>
		<br><br><br><br><br><br>
	</form>
	</div>   
</div>          
</body>
</html>