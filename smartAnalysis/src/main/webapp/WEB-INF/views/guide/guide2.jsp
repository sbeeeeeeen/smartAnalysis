<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/guide2/extras/jquery.min.1.7.js"></script>
<script type="text/javascript"
	src="/guide2/extras/modernizr.2.5.3.min.js"></script>
<script type="text/javascript" src="/guide2/lib/hash.js"></script>

<script src='https://code.responsivevoice.org/responsivevoice.js'></script>

<script>
	setTimeout(
			responsiveVoice.speak("썸네일을 선택하면 해당 설명이 나옵니다.", "Korean Female"),
			15000);
</script>

</head>
<body>

	<%@include file="top.jsp"%>

	<div id="canvas">

		<div class="magazine-viewport">
			<div class="container">
				<div class="magazine">
					<!-- Next button -->
					<div ignore="1" class="next-button"></div>
					<!-- Previous button -->
					<div ignore="1" class="previous-button"></div>
				</div>
			</div>
		</div>

		<!-- Thumbnails -->
		<div class="thumbnails">
			<ul>
				<li class="i"><a
					onclick='responsiveVoice.speak("대전 스마트 상권분석 사용자 가이드입니다.", "Korean Female")'><img
						src="/guide2/pages/1-thumb.jpg" width="76" height="100"
						class="page-1"></a> <span>1</span></li>
				<li class="d"><a><img src="/guide2/pages/2-thumb.jpg"
						width="76" height="100" class="page-2"> <img
						src="/guide2/pages/3-thumb.jpg" width="76" height="100"
						class="page-3"></a> <span>2-3</span></li>
				<li class="d"><a><img src="/guide2/pages/4-thumb.jpg"
						width="76" height="100" class="page-4"> <img
						src="/guide2/pages/5-thumb.jpg" width="76" height="100"
						class="page-5"></a> <span>4-5</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("선택 지역의 상권정보를 제공합니다.", "Korean Female")'><img
						src="/guide2/pages/6-thumb.jpg" width="76" height="100"
						class="page-6"> <img src="/guide2/pages/7-thumb.jpg"
						width="76" height="100" class="page-7"></a> <span>6-7</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("대전광역시 행정동별 입지정보를 제공합니다.", "Korean Female")'><img
						src="/guide2/pages/8-thumb.jpg" width="76" height="100"
						class="page-8"> <img src="/guide2/pages/9-thumb.jpg"
						width="76" height="100" class="page-9"></a> <span>8-9</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("대전광역시 행정동별 선택 업종의 수익분석 정보를 제공합니다.", "Korean Female")'><img
						src="/guide2/pages/10-thumb.jpg" width="76" height="100"
						class="page-10"> <img src="/guide2/pages/11-thumb.jpg"
						width="76" height="100" class="page-11"></a> <span>10-11</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("선택 지역의 현재 지표와 향후 발전 ", "Korean Female")'><img
						src="/guide2/pages/12-thumb.jpg" width="76" height="100"
						class="page-12"><img src="/guide2/pages/13-thumb.jpg"
						width="76" height="100" class="page-13"></a> <span>12-13</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("SNS 데이터를 기반으로 입력한 키워드를 분석하여 시장 트렌드 정보를 제공 합니다.", "Korean Female")'><img
						src="/guide2/pages/14-thumb.jpg" width="76" height="100"
						class="page-14"><img src="/guide2/pages/15-thumb.jpg"
						width="76" height="100" class="page-15"></a> <span>14-15</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("선택한 지역과 업종의 관련 점포 정보를 제공합니다.", "Korean Female")'><img
						src="/guide2/pages/16-thumb.jpg" width="76" height="100"
						class="page-16"><img src="/guide2/pages/17-thumb.jpg"
						width="76" height="100" class="page-17"></a> <span>16-17</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("골목상권을 함께 꾸려갈 조합원을 구할 수 있도록 커뮤니티를 제공합니다.", "Korean Female")'><img
						src="/guide2/pages/18-thumb.jpg" width="76" height="100"
						class="page-18"><img src="/guide2/pages/19-thumb.jpg"
						width="76" height="100" class="page-19"></a> <span>18-19</span></li>
				<li class="d"><a
					onclick='responsiveVoice.speak("입력한 키워드를 블로그,뉴스 데이터를 기반으로 시장 트렌드를 분석할 수 있습니다.", "Korean Female")'><img
						src="/guide2/pages/20-thumb.jpg" width="76" height="100"
						class="page-20"><img src="/guide2/pages/21-thumb.jpg"
						width="76" height="100" class="page-21"></a> <span>20-21</span></li>
				<li class="i"><a><img src="/guide2/pages/22-thumb.jpg"
						width="76" height="100" class="page-22"></a> <span>22</span></li>

			</ul>
		</div>
	</div>

	<script type="text/javascript">
		function loadApp() {

			$('#canvas').fadeIn(1000);

			var flipbook = $('.magazine');

			// Check if the CSS was already loaded

			if (flipbook.width() == 0 || flipbook.height() == 0) {
				setTimeout(loadApp, 10);
				return;
			}

			// Create the flipbook

			flipbook
					.turn({

						// Magazine width

						width : 922,

						// Magazine height

						height : 600,

						// Duration in millisecond

						duration : 1000,

						// Hardware acceleration

						acceleration : !isChrome(),

						// Enables gradients

						gradients : true,

						// Auto center this flipbook

						autoCenter : true,

						// Elevation from the edge of the flipbook when turning a page

						elevation : 50,

						// The number of pages

						pages : 22,

						// Events

						when : {
							turning : function(event, page, view) {

								var book = $(this), currentPage = book
										.turn('page'), pages = book
										.turn('pages');

								// Update the current URI

								Hash.go('page/' + page).update();

								// Show and hide navigation buttons

								disableControls(page);

								$('.thumbnails .page-' + currentPage).parent()
										.removeClass('current');

								$('.thumbnails .page-' + page).parent()
										.addClass('current');

							},

							turned : function(event, page, view) {

								disableControls(page);

								$(this).turn('center');

								if (page == 1) {
									$(this).turn('peel', 'br');
								}

							},

							missing : function(event, pages) {

								// Add pages that aren't in the magazine

								for (var i = 0; i < pages.length; i++)
									addPage(pages[i], $(this));

							}
						}

					});

			// URIs - Format #/page/1 

			Hash.on('^page\/([0-9]*)$', {
				yep : function(path, parts) {
					var page = parts[1];

					if (page !== undefined) {
						if ($('.magazine').turn('is'))
							$('.magazine').turn('page', page);
					}

				},
				nop : function(path) {

					if ($('.magazine').turn('is'))
						$('.magazine').turn('page', 1);
				}
			});

			$(window).resize(function() {
				resizeViewport();
			}).bind('orientationchange', function() {
				resizeViewport();
			});

			// Events for thumbnails

			$('.thumbnails').click(
					function(event) {

						var page;

						if (event.target
								&& (page = /page-([0-9]+)/.exec($(event.target)
										.attr('class')))) {

							$('.magazine').turn('page', page[1]);
						}
					});

			$('.thumbnails li').bind($.mouseEvents.over, function() {

				$(this).addClass('thumb-hover');

			}).bind($.mouseEvents.out, function() {

				$(this).removeClass('thumb-hover');

			});

			if ($.isTouch) {

				$('.thumbnails').addClass('thumbanils-touch').bind(
						$.mouseEvents.move, function(event) {
							event.preventDefault();
						});

			} else {

				$('.thumbnails ul').mouseover(function() {

					$('.thumbnails').addClass('thumbnails-hover');

				}).mousedown(function() {

					return false;

				}).mouseout(function() {

					$('.thumbnails').removeClass('thumbnails-hover');

				});

			}

			// Regions

			if ($.isTouch) {
				$('.magazine').bind('touchstart', regionClick);
			} else {
				$('.magazine').click(regionClick);
			}

			// Events for the next button

			$('.next-button').bind($.mouseEvents.over, function() {

				$(this).addClass('next-button-hover');

			}).bind($.mouseEvents.out, function() {

				$(this).removeClass('next-button-hover');

			}).bind($.mouseEvents.down, function() {

				$(this).addClass('next-button-down');

			}).bind($.mouseEvents.up, function() {

				$(this).removeClass('next-button-down');

			}).click(function() {

				$('.magazine').turn('next');

			});

			// Events for the next button

			$('.previous-button').bind($.mouseEvents.over, function() {

				$(this).addClass('previous-button-hover');

			}).bind($.mouseEvents.out, function() {

				$(this).removeClass('previous-button-hover');

			}).bind($.mouseEvents.down, function() {

				$(this).addClass('previous-button-down');

			}).bind($.mouseEvents.up, function() {

				$(this).removeClass('previous-button-down');

			}).click(function() {

				$('.magazine').turn('previous');

			});

			resizeViewport();

			$('.magazine').addClass('animated');

		}

		// Load the HTML4 version if there's not CSS transform

		yepnope({
			test : Modernizr.csstransforms,
			yep : [ '/guide2/lib/turn.js' ],
			nope : [ '/guide2/lib/turn.html4.min.js' ],
			both : [ '/guide2/js/magazine.js', '/guide2/css/magazine.css' ],
			complete : loadApp
		});
	</script>
</body>
</html>