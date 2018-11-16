<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/Moderna/js/jquery.js"></script>

<script type="text/javascript">
	function cookieVal(cookieName) {
		thisCookie = document.cookie.split("; ");
		for (i = 0; i < thisCookie.length; i++) {
			if (cookieName == thisCookie[i].split("=")[0]) {
				return thisCookie[i].split("=")[1];
			}
		}
		return "x";
	}

	function pop() {
		if (cookieVal("notice") != "1") {
			window.open("/main/pop", "", "width=479,height=448,left=500");
		}
	}
</script>

</head>
<body onload="pop()">
	<section id="featured">
		<!-- start slider -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Slider -->
					<div id="main-slider" class="flexslider">
						<ul class="slides">
							<li><img src="/Moderna/img/slides/2-2.jpg" alt="" /> <!-- <div class="flex-caption"> -->
								<!-- <h3>Modern Design</h3> --> <!-- <p>Duis fermentum auctor ligula ac malesuada. Mauris et -->
								<!-- metus odio, in pulvinar urna</p> --> <!-- <a href="#" class="btn btn-theme">Learn More</a> -->
								<!-- </div> --></li>
							<li><img src="/Moderna/img/slides/1-1.jpg" alt="" /> <!-- <div class="flex-caption"> -->
								<!-- <h3>Fully Responsive</h3> --> <!-- <p>Sodales neque vitae justo sollicitudin aliquet sit amet -->
								<!-- diam curabitur sed fermentum.</p> --> <!-- <a href="#" class="btn btn-theme">Learn More</a> -->
								<!-- </div> --></li>
							<li><img src="/Moderna/img/slides/3.jpg" alt="" /> <!-- <div class="flex-caption"> -->
								<!-- <h3>Clean & Fast</h3> --> <!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit -->
								<!-- donec mer lacinia.</p> --> <!-- <a href="#" class="btn btn-theme">Learn More</a> -->
								<!-- </div> --></li>
						</ul>
					</div>
					<!-- end slider -->
				</div>
			</div>
		</div>
	</section>


	<section id="content">
		<div class="container">
			<!-- 분석 바로 가기 버튼 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<!-- 상권분석 바로가기 버튼 -->
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h2>상권분석</h2>
									<div class="icon">
										<i class="fa fa-map-marker fa-5x"></i>
									</div>
									<!-- <p>특정 위치·업종의 추정매출액, 투자비 회수를 위한 목표매출 및 고객수, 유사한 입지·업종의 매출현황의 비교분석 정보 제공합니다</p> -->
								</div>
								<div class="box-bottom">
									<a href="/map/taSelect">바로가기</a>
								</div>
							</div>
						</div>
						<!-- 입지분석 바로가기 버튼 -->
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h2>입지분석</h2>
									<div class="icon">
										<i class="fa fa-map-marker fa-5x"></i>
									</div>
									<!-- <p>특정 입지에 대한 45개 표본업종별 입지가치(예상매출액)의 평균을 종합하여 평가한 입지등급정보를 제공합니다</p> -->
								</div>
								<div class="box-bottom">
									<a href="/location/selectLocation">바로가기</a>
								</div>
							</div>
						</div>
						<!-- 수익분석 바로가기 버튼 -->
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h2>수익분석</h2>
									<div class="icon">
										<i class="fa fa-map-marker fa-5x"></i>
									</div>
									<!-- <p>특정 위치·업종의 추정매출액, 투자비 회수를 위한 목표매출 및 고객수, 유사한 입지·업종의 매출현황의 비교분석 정보 제공합니다</p> -->
								</div>
								<div class="box-bottom">
									<a href="/profit/proSelect">바로가기</a>
								</div>
							</div>
						</div>
						<!-- 미래지향분석 바로가기 버튼 -->
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h2>미래지향분석</h2>
									<div class="icon">
										<i class="fa fa-map-marker fa-5x"></i>
									</div>
									<!-- <p>Voluptatem accusantium doloremque laudantium sprea totam rem aperiam.</p> -->
								</div>
								<div class="box-bottom">
									<a href="/future/view">바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 분석 바로 가기 버튼 end -->

			<!-- line -->
			<div class="row">
				<div class="col-lg-12">
					<div class="solidline"></div>
				</div>
			</div>
			<!-- end line -->

			<!-- 실시간방송 & 공지사항 section -->
			<section id="projects">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<!-- 실시간 방송 -->
							<div class="col-lg-6">
								<h4 class="heading">실시간 방송</h4>
								<ul id="thumbs" class="portfolio">
									<li data-id="id-0" data-type="web">
										<div class="item-thumbs">
											<%@ include file="/WEB-INF/views/youtube.jsp"%>
										</div>
									</li>
								</ul>
							</div>
							<!-- 공지사항 -->
							<div class="col-lg-6">
								<h4 class="heading">공지사항</h4>
								<ul id="thumbs" class="portfolio">
									<li data-id="id-0" data-type="web">
										<div class="item-thumbs">
											<%@ include file="/WEB-INF/views/notice.jsp"%>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End 실시간방송 & 공지사항 section -->
		</div>
		<!-- end container -->
	</section>

</body>

</html>