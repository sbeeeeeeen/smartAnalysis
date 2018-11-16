<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/Moderna/js/jquery.js"></script>


<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h1>아이디 찾기</h1>
		</div>
		<br><br>
		<form name="frm" id="frm" class="form-signin" method="post">
			<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" required autofocus>
			<input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요" required autofocus>
			<p class="help-block" id="MsgEmail"></p>

			<button class="btn btn-lg btn-primary btn-block" type="button" id="findIdBtn">아이디 찾기</button>
			<br><br>
			<label>비밀번호를 잊으셨나요?</label>
			<a class="btn btn-lg btn-primary btn-block" href="/member/findPw" id="findPassBtn">비밀번호 찾기</a>
		</form><br><br>
				<hr>
	</div>
</article>
<script>

	$(document).ready(function(){
		
		$('#findIdBtn').on('click', function(){
			
			var name = $("#name").val();
			var email = $("#email").val();
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(name.length == 0){
   	        	alert("이름을 입력하세요"); 
   	        	$("#name").focus();
				return false;
			} 
			
			if(email.length == 0){
   	        	alert("이메일을 입력하세요"); 
   	        	$("#email").focus();
				return false;
			}
			
			if( !regExpEmail.test($("input[name=email]").val())) {
				$('#MsgEmail').html('<p style="color:red">잘못된 이메일 형식입니다.</p>');
				$("#email").focus();
				return false;
			}else{
				$('#MsgEmail').html('<p></p>');
			}
			

			$.ajax({
				method : 'get',
				data : {"email":email, "name":name},
				url : "/member/findIdProcess",
				dataType:"JSON",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					
					if(data.error){
						$('#MsgEmail').html('<p style="color:red">없는 이메일 계정입니다.</p>');
						$("#email").focus();
						return false;
					}
					if(data.mem_name == name){
						$("#frm").submit();
						alert("이메일로 아이디보냈다!");
					}else{
						alert("회원정보가 다르다! 다시 입력하세요!");
						$("#email").val("");
						$("#email").focus();
						return false;
					}
				},
				error : function(error) {
					alert(error);

				}
			}); 
			
		});
	});

</script>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	

	