<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/Moderna/js/jquery.js"></script>

	<!-- 마이페이지 폼 -->
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>마이페이지</h1>
			</div>
			<form name="frm" id="frm" class="form-horizontal" action="/member/mypageProcess" method="post" >
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="mem_name">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="mem_name" name="mem_name" type="text" value="${memberVo.mem_name}" readonly="readonly">
					</div>
				</div>
				<!-- 아이디 -->
				<div class="form-group">
				  <label class="col-sm-3 control-label" for="mem_id">아이디(ID)</label>
					<div class="col-sm-6">
					    <div class="input-group">
							<span class="input-group-btn">
								<input type="text" class="form-control" id="mem_id" name="mem_id" value="${memberVo.mem_id}" readonly="readonly"/>
							</span>
					    </div>
					</div>
				</div>
				<!-- 비밀번호 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="mem_pass">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="mem_pass" name="mem_pass" type="password" value="${pw}">
						<p class="help-block" id="checkMsg1">특수문자, 숫자, 영문자를 포함한 형태의 8~15자리 이내</p>
					</div>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="mem_passChk" name="mem_passChk" type="password" placeholder="비밀번호 확인">
						<p class="help-block" id="checkMsg2"></p>
					</div>
				</div>
				<!-- 휴대폰 번호 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="mem_call">휴대폰번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="mem_call" name="mem_call" type="text" value="${memberVo.mem_call}">
						<p class="help-block" id="MsgCall"></p>
					</div>
				</div>
				<!-- 이메일 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="mem_email">이메일</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="mem_email" name="mem_email" type="email" value="${memberVo.mem_email}">
							<span class="input-group-btn">
								<button class="btn btn-success" type="button" id="sendEmail">인증번호 받기<i class=""></i></button>
							</span>
						</div>
						<p class="help-block" id="MsgEmail"></p>
					</div>
				</div>
				<!-- 인증번호 확인 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="emailCheck">인증번호 확인</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="emailNum" name="emailNum" type="text" placeholder="인증번호">
							<span class="input-group-btn">
								<button class="btn btn-success" type="button" id="emailNumCheck">인증번호 확인<i class=""></i></button>
							</span>
						</div>
						<p class="help-block" id="MsgEmailNum"></p>
					</div>
				</div>
				<!-- 주소 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
					<div class="col-sm-6">
						<input type="text" id="sample3_postcode" placeholder="우편번호">
						<input class="btn btn-success" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" 
								  style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<input class="form-control" type="text" id="sample3_address" name="mem_add" class="d_form large"  value="${memberVo.mem_add}">
					</div>
				</div>		
				<!--회원유형 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">회원유형</label>
						<div class="col-sm-6 control-label">
							<input type="radio" name="mem_type" value="1">예비창업&emsp;&emsp;&emsp;&emsp;
							<input type="radio" name="mem_type" value="2">자영업자 &emsp;&emsp;&emsp;&emsp;
							<input type="radio" name="mem_type" value="3">경영지원(컨설턴트) &emsp;&emsp;&emsp;&emsp;
							<input type="radio" name="mem_type" value="4">폐업예정 &emsp;&emsp;&emsp;&emsp;
						</div>
				</div>
				<!--관심업종 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="selMyJob">나의업종</label>
					<div class="col-sm-6">
						<input type="hidden" class="form-control" readonly="readonly" id="mycode" name="mycode" value="${memberVo.ind_code}">
						<label class="control-label" id="codeName">${myCode}</label><br>
						<label class="control-label" style="color:blue; cursor:pointer" id="codeUpdateBtn">업종을 변경하려면 클릭하세요<i class="fa fa-check spaceLeft"></i></label>
						
					</div>
						<div class="col-sm-1" style="display:none" id="codeDiv">
							<select name="ind_codeL" id="ind_codeL" style="width:190px;">
								<option value="">- - - 대분류를 선택하세요 - - -</option>
									<c:forEach items="${ind_Llist}" var="vo">
										 <option value="${vo.IND_LCODE}">${vo.IND_L }</option>
									</c:forEach>
							</select>
							<select name= "ind_codeM" id="ind_codeM" style="width:190px;">
							</select>
							<select name= "ind_codeS" id="ind_codeS" style="width:190px;">
							</select>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label">채널ID</label>
					<div class="col-sm-6">
					<c:if test="${consultingId eq null }">
						<label class="control-label">할당받은 채널ID가 없습니다.</label>
					</c:if>
						<label class="control-label">${consultingId }</label><br>
					</div>
				</div>

				<!-- btn -->
				<div class="form-g roup">
				  <div class="col-sm-12 text-center"><br><br>
				    <button class="btn btn-myprimary" type="button" id="updateBtn">수정하기<i class="fa fa-check spaceLeft"></i></button>&emsp;
					<a class="btn btn-danger" href="/member/main" id="cancelBtn">수정취소<i class="fa fa-times spaceLeft"></i></a>
				  </div>
				</div>
			</form>
			<hr>
		</div>
	</article>
	<!-- 주소 api 스크립트 -->

	<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample3_address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    } //주소 api end
    


    
	$(document).ready(function(){
  	
		var emailck = 1;	//이메일 중복 확인 체크
		var emailNumCk = 1;	//인증번호 확인완료 체크
		var mem_pass = $("#mem_pass").val();
		var updateCode = 0;
		$("input:radio[name='mem_type']:radio[value=${memberVo.mem_type}]").prop('checked', true); // 선택한 회원유형
		var mycode = $("#mycode").val();

		
		//비밀번호 정규식
		$('#mem_pass').keyup(function(){
			var regExpPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if( !regExpPw.test($("input[name=mem_pass]").val())) {
				$('#checkMsg1').html('<p style="color:red">비밀번호는 특수문자를 포함한 형태의 8~15자리 이내로 입력해야 합니다.</p>');
				$("#mem_pass").focus();
		    	return false;
			}
			if(mem_pass==$("input[name=mem_pass]").val()){
				$('#checkMsg1').html('<p style="color:red">기존 비밀번호와 동일한 비밀번호는 사용할수 없습니다.</p>');
				$("#mem_pass").focus();
				return false;
			}
			else{
				$('#checkMsg1').html('<p></p>');
			}
		
		});
	

		//비밀번호 재입력 확인 
		$('#mem_passChk').blur(function(){
			var mem_pass = $("#mem_pass").val();
			var mem_passChk = $("#mem_passChk").val();
			if($('#mem_pass').val()!=$('#mem_passChk').val()){
				$('#checkMsg2').html('<p style="color:red">비밀번호가 다릅니다. 비밀번호를 확인해 주세요.</p>');
	    		return false;
			}else{
				$('#checkMsg2').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
			}
		});


		//핸드폰 번호 정규식
		$('#mem_call').keyup(function(){
			var regExpCall = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			if( !regExpCall.test($("input[name=mem_call]").val())) {
				$('#MsgCall').html('<p style="color:red">-를 포함한 휴대번호를 입력하세요.</p>');
				return false;
			}else{
				$('#MsgCall').html('<p></p>');
			}
		});
	


		//이메일 정규식
		$('#mem_email').blur(function(){
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if( !regExpEmail.test($("input[name=mem_email]").val())) {
				$('#MsgEmail').html('<p style="color:red">잘못된 이메일 형식입니다.</p>');
				$("#mem_email").focus();
				return false;
			}else{
				$('#MsgEmail').html('<p></p>');
			}
		});
	


		//이메일인증번호 보내기
		$('#sendEmail').on('click', function(){
		
			var data = $("#mem_email").val();
			
			$.ajax({
				type : 'POST',
				data : data,
				url : "/member/emailCheck",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						$('#MsgEmail').html('<p style="color:red">이미 사용중인 이메일입니다.다른 이메일을 입력하세요</p>');
						$('#mem_email').focus();
						return false;
					}else{
						emailck = 0;
					}
				},
				error : function(error) {
					alert(error);
				}
			}); 
			
			if(emailck == 0){
				$.ajax({
					async: true,
					type : 'POST',
					data: data,
					url : "/member/emailAuth",
					contentType: "application/json; charset=UTF-8",
					success : function(data){
						alert(data.authNum);
					
						//인증번호 확인
						$('#emailNumCheck').on('click', function(){
							var emailNum = $("#emailNum").val();
							if($('#emailNum').val()!=data.authNum){
								$('#MsgEmailNum').html('<p style="color:red">인증번호가 다릅니다.</p>');
							}else{
								$('#MsgEmailNum').html('<p style="color:blue">이메일 인증완료</p>');
								emailNumCk = 0;
							}
						});
					},
					error :function(error){
						alert("이메일 인증번호 전송 실패");
					}
				});
				
			}
		
		});
	
		$('#emailNum').on('click', function(){
			if(emailck==1){
				$('#MsgEmailNum').html('<p style="color:red">본인 이메일로 인증번호를 먼저 받아주세요</p>');
			}else{
				$('#MsgEmailNum').html('<p style="color:blue">인증번호를 입력하세요</p>');
			}
		});
		
		
		/////////////////////////업종
		
		$("#codeUpdateBtn").on('click',function(){
			updateCode = 1;
		    if($("#codeDiv").css("display") == "none"){   
		        jQuery('#codeDiv').show();  
		    } else {  
		        jQuery('#codeDiv').hide();  
		    }  
		});
		

		//대분류 선택 시 중분류 리스트 뿌려준다
		$('#ind_codeL').on('change', function(){
			
			var paramL = $('#ind_codeL option:selected').val()
			
			$.ajax({
				type : 'POST',
				data : paramL,
				url : "/member/mList",
				datatype : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data){
					var htmlStr = '<option value="">- - - 중분류를 선택하세요 - - -</option>';
					$.each(data.ind_mList, function(index, value){
						htmlStr += '<option value='+value.ind_MCODE + '>';
						htmlStr += value.ind_M + '</option>'
					})
					$("#ind_codeM").html(htmlStr);
				},
				error : function(error){
					alert(error);
				}
			});
		});
		
		//중분류 선택시 소분류 리스트 뿌려준다
		$('#ind_codeM').on('change', function(){
			
			var paramM = $('#ind_codeM option:selected').val()
			
			$.ajax({
				type : 'POST',
				data : paramM,
				url : "/member/sList",
				datatype : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data){
					var htmlStr = '<option value="">- - - 소분류를 선택하세요 - - -</option>';
					$.each(data.ind_sList, function(index, value){
						htmlStr += '<option value='+value.ind_CODE + '>';
						htmlStr += value.ind_S + '</option>'
					})
					$("#ind_codeS").html(htmlStr);

				},
				error : function(error){
					alert(error);
				}
			});
		});	
		
		
	
		
		$("#updateBtn").on("click", function(){
			
			
	 	    var mem_pass = $("#mem_pass").val();
	 	    var mem_passChk = $("#mem_passChk").val();
	 	    var mem_call = $("#mem_call").val();
	 	    var mem_email = $("#mem_email").val();
	 	    var emailNum = $("#emailNum").val();
	 	    var mem_add = $("#sample3_address").val();
	 	    var mem_type = $('input[name="mem_type"]:checked').val();
	 	    var ind_codeL = $("#ind_codeL option:selected").val();		//대분류
	 	    var ind_codeM = $("#ind_codeM option:selected").val();		//중분류
	 	    var ind_codeS = $("#ind_codeS option:selected").val();		//업종코드
	 	    var mycode = $("#mycode").val();
	 	    
	 	    //정규식
			var regexppw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-za-z])(?=.*[!@#$%^&+=]).*$/;	//비밀번호 정규식
			var regexpcall = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;			//전화번호
			var regexpemail = /^[0-9a-za-z]([-_\.]?[0-9a-za-z])*@[0-9a-za-z]([-_\.]?[0-9a-za-z])*\.[a-za-z]{2,3}$/i;		//이메일
			
			

  	    
			if(mem_passChk.length == 0){
  	        	alert("비밀번호를 재입력하세요"); 
  	        	$("#mem_passChk").focus();
  	        	return false;
			}
			

			
			if(mem_pass != mem_passChk){
				alert("비밀번호가 일치하지 않습니다")
  	        	$("#mem_passChk").focus();
  	        	return false;				
			}

			
			if( !regexpemail.test($("input[name=mem_email]").val())) {
				alert("잘못된 이메일 형식입니다.");
				$("#mem_email").focus();
				return false;
			}
			
			if(updateCode==1){
				if(ind_codeL==""){
					alert("나의업종-대분류를 선택하세요");
					return false;
				}
				if(ind_codeM==""){
					alert("나의업종-중분류를 선택하세요");
					return false;
				}
				if(ind_codeS==""){
					alert("나의업종-소분류를 선택하세요");
					return false;
				}
				
			}
			
			if(emailck==0 && emailNumCk==1){
				alert("인증번호 확인해주세요")
				return false;
			}
			
  	    	if(emailck==1 && emailNumCk==1){
   	    		$("#frm").submit();
  	    		alert("정보수정완료!");
  	    	}
  	    	
  	    	if(emailNumCk==0){
  	    		$("#frm").submit();
  	    		alert("정보수정완료!");
  	    	}
		});  //end joinBtn
 	});


	</script>

	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
