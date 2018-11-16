<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script>
	function nwindow() {
		window.open("/guide/book", "", "width=1068,height=1000,left=500");
	} //팝업창
	function cwindow(){
		window.open("/main/chatList","","width=500,height=680,left=500");
	}//chat 팝업창
	function bwindow(){
		window.open("/main/bot","", "width=500,height=400,left=500");
	}//speech-to-text 팝업창
</script>

<div id="quickMenu">
	<div class="quick-menu">Quick<br>Menu</div>
	<span class="quick-1"><a href="#" class="quick" onclick="nwindow()">사용자<br>가이드</a></span>
	<span class="quick-2"><a href="#" class="quick" onclick="bwindow()">챗봇</a></span>
	<span class="quick-1"><a href="/consulting/request" class="quick">1:1<br>컨설팅</a></span>
	<span class="quick-2"><a href="#" class="quick" onclick="cwindow()">채팅</a></span>
	<div class="quick-top"><a href="#" class="quickTop">Top</a></div>
</div>
	<script src="/Moderna/js/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#quickMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";

				/* 애니메이션 없이 바로 따라감
				 $("#floatMenu").css('top', newPosition);
				 */

				$("#quickMenu").stop().animate({
					"top" : newPosition
				}, 500);

			}).scroll();

		});
	</script>

