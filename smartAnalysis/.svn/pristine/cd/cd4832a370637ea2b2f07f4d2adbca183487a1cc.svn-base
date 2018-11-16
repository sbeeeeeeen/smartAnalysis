<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<script src="/Moderna/js/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h1>로그인</h1>
		</div>
		<br><br>
		<form class="form-signin" action="/member/loginProcess" method="post">
			<label for="userId" class="sr-only">userId</label>
			<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디 입력" required autofocus>
			<label for="password" class="sr-only">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호 입력" required>
			<ul class="portfolio-categ filter">
				<li><a href="/member/findId">ID찾기</a></li>
				<li><a href="/member/findPw">PASS찾기</a></li>
				<li><a href="/member/joinSel">회원가입</a></li>
			</ul>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form><br><br>
	</div>
	<div class="form-signin">
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
		</a>
	</div>
	<hr>
</article>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('1d9030c3d98f454f7c575d2ff8380139');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.loginForm({
        success: function(authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
            	  $.ajax({
            		  type:"post",
            		  url:"/member/loginProcess",
            		  data:{
            			  "userId" : res.id,
            		  },
            		  success:function(data){
            			  console.log(data);
            			  location.href = "/member/main";
            		  }
            	  });
                console.log(JSON.stringify(res.kaccount_email));
                console.log(JSON.stringify(res.id));
                console.log(JSON.stringify(res.properties.profile_image));
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

