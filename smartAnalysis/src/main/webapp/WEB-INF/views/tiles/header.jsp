<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<header>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/member/main"><span>S</span>mart Analysis</a>
			</div>
			<div class="navbar-collapse collapse ">
				<ul class="nav navbar-nav">
					<c:if test="${memberVo.mem_name == null}" >
						<li><a href="/main/view">Home</a></li>
						<li><a href="/member/login">로그인 </a></li>
						<li><a href="/member/joinSel">회원가입</a></li>
					</c:if>
					<c:if test="${memberVo.mem_name != null}" >
						<c:if test="${memberVo.mem_type == 5}">
							<li><a>${memberVo.mem_name}계정</a></li>
							<li><a href="/member/memberList">회원관리 </a></li>
							<li><a href="/member/logout">로그아웃 </a></li>
						</c:if>
						<c:if test="${memberVo.mem_type != 5}">
							<li><a>${memberVo.mem_name}님 </a></li>
							<li><a href="/member/mypage">마이페이지 </a></li>
							<li><a href="/analysisRes/tradeAnalysisRes">나의 분석이력 </a></li>
							<c:if test="${memberVo.mem_type == 3}">
								<li><a href="/consulting/schedule">일정관리</a></li>	
							</c:if>
							<c:if test="${memberVo.mem_type != 3}">
								<li><a href="/consulting/memberConsultingCheck?mem_id=${memberVo.mem_id}">나의 컨설팅 내역</a></li>
							</c:if>
							<li><a href="/member/logout">로그아웃 </a></li>
						
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</header>