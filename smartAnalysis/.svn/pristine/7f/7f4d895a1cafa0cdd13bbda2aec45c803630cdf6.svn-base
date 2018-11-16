<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function owindow(){
	window.open("/post/opinion","","width=510,height=485,left=500");
}
</script>
<body>
<!-- start topMenu -->
	<section id="topMenu">
		<div class="topMenu"> 
			<ul class="topnav">
				<li><a href="/map/taSelect">상권분석</a></li>
				<li><a href="/location/selectLocation">입지분석</a></li>
				<li><a href="/profit/proSelect">수익분석</a></li>
				<li><a href="/future/view">미래지향분석</a></li>
				<li class="mydropdown">
				    <a href="#" class="dropbtn">시장분석</a>
				    	<div class="mydropdown-content">
							<a href="/snsAnalysis/view">SNS분석</a>
							<a href="/jumpo/view">점포검색</a>
						</div>
				</li>
				<li><a href="/util/view">활용현황</a></li>
				<li><a href="/copartnership/main">협동조합</a></li>
				<li class="mydropdown">
					<a href="#" class="dropbtn">알림정보</a>
					<div class="mydropdown-content">
				     	<a href="/post/list?board_num=1">공지사항</a>
						<c:choose>
							<c:when test="${memberVo.mem_type eq 5 }">
								<a href="/post/list?board_num=2">개선의견</a>
							</c:when>
							<c:otherwise>
								<a onclick="owindow()">개선의견</a>
							</c:otherwise>
						</c:choose>
					</div>
			  </li>
			</ul>
		</div>
	</section>