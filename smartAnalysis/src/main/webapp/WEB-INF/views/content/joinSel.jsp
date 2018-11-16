<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/Moderna/js/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h1>회원가입 유형 선택</h1>
		</div>
		<br><br>
		<form action="/member/join" id="frm" name="frm" method="post">
			<div class="form-signin">
				<button class="btn btn-lg btn-primary btn-block" name="btn" id="btn" value="joinBtn">일반 회원가입</button>
			</div>
		</form>
		<div class="form-signin">
			<a id="btn" name="btn" href="javascript:loginWithKakao()"><img src="/img/kakao.png" width="300"/></a>
<!-- 			<button class="btn btn-lg btn-primary btn-block" name="btn" id="btn" value="kakaoBtn" onclick="loginWithKakao();">카카오 계정 회원가입</button><br> -->
		</div>
			
		
	<hr>
	</div>
</article>

<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	
<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('1d9030c3d98f454f7c575d2ff8380139');
    function loginWithKakao() {
    	alert("카카오 계정으로 로그인 후 회원가입이 진행됩니다");
      // 로그인 창을 띄웁니다.
		Kakao.Auth.loginForm({
			
			success: function(authObj) {
				// 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						$.ajax({
							type:"post",
							url:"/member/kakaoJoin",
							async : false,
							data: {
								"mem_id" : res.id,
								"mem_name" :res.properties.nickname
							},
							success:function(data){
								location.href = "/member/join?btn=kakaoBtn";
							}
						});
						console.log(JSON.stringify(res.id));
						console.log(JSON.stringify(res.properties.nickname));
	              	},
					fail: function(error) {
					alert(JSON.stringify(error));
					}
				});
			},
			fail: function(err) {
				alert(JSON.stringify(err));
			}
	      
		});
	};
</script>