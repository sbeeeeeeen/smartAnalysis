<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<script>
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}

	function closePop() {
		if (document.checkClose.Notice.checked) {
			setCookie("notice", "1", 1);
		}
		self.close();
	}
</script>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
.layer-pop-main-header {
	padding: 10px 10px 12px 5px;
	background-color: #2e70c2;
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
}

.layer-pop-main-header h3 {
	margin: 0;
	line-height: 16px;
	color: #ffffff;
	font-size: 16px;
	text-align: left;
	padding-top: 5px;
}

.layer-pop h3 {
	padding: 10px 15px 0 15px;
	min-height: 10px;
	text-align: left;
	font-size: 16px;
	letter-spacing: 0;
	font-weight: 700;
	margin-top: 0px;
	margin-bottom: 5px;
}

.layer-pop-body {
	padding: 5px 15px;
	/* font-size: 13px; */
	/* line-height: 150%; */
}

.layer-pop-footer-grey.text-right {
	padding: 5px 15px 5px 15px;
}

.text-right {
	text-align: right !important;
}

.layer-pop-footer-grey {
	clear: both;
	border-top: 1px solid #c9d0d6;
	padding: 14px 0;
	text-align: center;
	background-color: #f0f3f5;
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px;
}

.control-indicator {
	position: absolute;
	top: 2px;
	left: 0;
	display: block;
	width: 14px !important;
	height: 14px !important;
	line-height: 13px;
	font-size: 13px !important;
	padding: 0;
	color: #333;
	text-align: center;
	vertical-align: middle;
	background-color: #fff;
	border: 1px solid #c9d0d6;
	background-position: center center;
	background-repeat: no-repeat;
}
</style>

<body>

	<div class="layer-pop-main-header">
		<h3>중요 안내</h3>
	</div>

	<div class="layer-pop-body">
		<img src="/img/pop.png">
	</div>

	<form class="layer-pop-footer-grey text-right" name="checkClose">
		<label class="control checkbox" id="noticeClose0"><input
			type="checkbox" id="noticeCookie0" class="add-contrast"
			onClick="closePop()" data-role="collar" name="Notice">오늘은
			그만보기</label>
	</form>

</body>

</html>