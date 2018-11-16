<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<title>말해 YES or NO</title>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
* {
	font-family: Verdana, Arial, sans-serif;
}

a:link {
	color: #000;
	text-decoration: none;
}

a:visited {
	color: #000;
}

a:hover {
	color: #33F;
}

.button {
	background: -webkit-linear-gradient(top, #008dfd 0, #0370ea 100%);
	border: 1px solid #076bd2;
	border-radius: 3px;
	color: #fff;
	display: none;
	font-size: 13px;
	font-weight: bold;
	line-height: 1.3;
	padding: 8px 25px;
	text-align: center;
	text-shadow: 1px 1px 1px #076bd2;
	letter-spacing: normal;
}

.center {
	/* padding: 10px; */
	text-align: center;
}

.final {
	color: black;
	padding-right: 3px;
}

.interim {
	color: gray;
}

.info {
	font-size: 14px;
	text-align: center;
	color: #777;
	display: none;
}

.right {
	float: right;
}

.sidebyside {
	display: inline-block;
	width: 45%;
	min-height: 40px;
	text-align: left;
	vertical-align: top;
}

#headline {
	font-size: 50px;
	font-weight: 300;
	font-style: italic;
	font-variant: normal;
}

#info {
	font-size: 13px;
	text-align: center;
	color: #656565;
	visibility: hidden;
}

#results {
	font-size: 14px;
	font-weight: bold;
	border: 1px solid #ddd;
	padding: 15px;
	text-align: left;
	min-height: 150px;
}

#start_button {
	border: 0;
	background-color: transparent;
	padding: 0;
}
#aa{
/* 	background-image: url("/img/rain.gif"); */
}
</style>

<div id="aa">
<h1 class="center" id="headline"><img src="/img/chatbot.png" style="width: 50px; height: 50px;"> Chat-Bot</h1>
<div class="center">
	<p>
	<div id="div_language">
		<select id="select_language" onchange="updateCountry()"></select>
		&nbsp;&nbsp; <select id="select_dialect"></select>
	</div>
</div>

<p class="clearfix"></p>
<!-- 간격 벌리기 -->

<div id="info">
	<p id="info_start">마이크를 누르고 말하세요~</p>
	<p id="info_speak_now">지금 말하세요~ㅎㅎ</p>
	<p id="info_no_speech">음성감지 실패. 마이크 설정을 확인하세요</p>
	<p id="info_no_microphone" style="display: none">
		No microphone was found. Ensure that a microphone is installed and
		that <a
			href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
			microphone settings</a> are configured correctly.
	</p>
	<p id="info_allow">마이크를 사용하려면 위의 '허용' 버튼을 클릭하세요.</p>
	<p id="info_denied">Permission to use microphone was denied.</p>
	<p id="info_blocked">마이크 사용권한이 없네요~ㅎㅎㅎ</p>
	<p id="info_upgrade">
		이 브라우저에서는 API를 지원하지 않습니다. 업데이트 하세요 <a href="//www.google.com/chrome">크롬</a>에서
		25 또는 그 이상의 버전으로
	</p>
</div>
<div class="right">
	<button id="start_button" onclick="startButton(event)">
		<img id="start_img" src="/Moderna/img/mic.gif" alt="Start">
	</button>
</div>
<div id="results">
	<span id="final_span" class="final"></span> <span id="interim_span"
		class="interim"></span>
	<p>
		<span id="answer" class="interim"></span>
</div>
</div>
<script>
	var langs = [
			[ 'Afrikaans', [ 'af-ZA' ] ],
			[ 'Bahasa Indonesia', [ 'id-ID' ] ],
			[ 'Bahasa Melayu', [ 'ms-MY' ] ],
			[ 'Català', [ 'ca-ES' ] ],
			[ 'Čeština', [ 'cs-CZ' ] ],
			[ 'Deutsch', [ 'de-DE' ] ],
			[ 'English', [ 'en-AU', 'Australia' ], [ 'en-CA', 'Canada' ],
					[ 'en-IN', 'India' ], [ 'en-NZ', 'New Zealand' ],
					[ 'en-ZA', 'South Africa' ], [ 'en-GB', 'United Kingdom' ],
					[ 'en-US', 'United States' ] ],
			[ 'Español', [ 'es-AR', 'Argentina' ], [ 'es-BO', 'Bolivia' ],
					[ 'es-CL', 'Chile' ], [ 'es-CO', 'Colombia' ],
					[ 'es-CR', 'Costa Rica' ], [ 'es-EC', 'Ecuador' ],
					[ 'es-SV', 'El Salvador' ], [ 'es-ES', 'España' ],
					[ 'es-US', 'Estados Unidos' ], [ 'es-GT', 'Guatemala' ],
					[ 'es-HN', 'Honduras' ], [ 'es-MX', 'México' ],
					[ 'es-NI', 'Nicaragua' ], [ 'es-PA', 'Panamá' ],
					[ 'es-PY', 'Paraguay' ], [ 'es-PE', 'Perú' ],
					[ 'es-PR', 'Puerto Rico' ],
					[ 'es-DO', 'República Dominicana' ],
					[ 'es-UY', 'Uruguay' ], [ 'es-VE', 'Venezuela' ] ],
			[ 'Euskara', [ 'eu-ES' ] ],
			[ 'Français', [ 'fr-FR' ] ],
			[ 'Galego', [ 'gl-ES' ] ],
			[ 'Hrvatski', [ 'hr_HR' ] ],
			[ 'IsiZulu', [ 'zu-ZA' ] ],
			[ 'Íslenska', [ 'is-IS' ] ],
			[ 'Italiano', [ 'it-IT', 'Italia' ], [ 'it-CH', 'Svizzera' ] ],
			[ 'Magyar', [ 'hu-HU' ] ],
			[ 'Nederlands', [ 'nl-NL' ] ],
			[ 'Norsk bokmål', [ 'nb-NO' ] ],
			[ 'Polski', [ 'pl-PL' ] ],
			[ 'Português', [ 'pt-BR', 'Brasil' ], [ 'pt-PT', 'Portugal' ] ],
			[ 'Română', [ 'ro-RO' ] ],
			[ 'Slovenčina', [ 'sk-SK' ] ],
			[ 'Suomi', [ 'fi-FI' ] ],
			[ 'Svenska', [ 'sv-SE' ] ],
			[ 'Türkçe', [ 'tr-TR' ] ],
			[ 'български', [ 'bg-BG' ] ],
			[ 'Pусский', [ 'ru-RU' ] ],
			[ 'Српски', [ 'sr-RS' ] ],
			[ '한국어', [ 'ko-KR' ] ],
			[ '中文', [ 'cmn-Hans-CN', '普通话 (中国大陆)' ],
					[ 'cmn-Hans-HK', '普通话 (香港)' ],
					[ 'cmn-Hant-TW', '中文 (台灣)' ], [ 'yue-Hant-HK', '粵語 (香港)' ] ],
			[ '日本語', [ 'ja-JP' ] ], [ 'Lingua latīna', [ 'la' ] ] ];

	for (var i = 0; i < langs.length; i++) {
		select_language.options[i] = new Option(langs[i][0], i);
	}
	select_language.selectedIndex = 28;
	updateCountry();
	select_dialect.selectedIndex = 6;
	showInfo('info_start');

	function updateCountry() {
		for (var i = select_dialect.options.length - 1; i >= 0; i--) {
			select_dialect.remove(i);
		}
		var list = langs[select_language.selectedIndex];
		for (var i = 1; i < list.length; i++) {
			select_dialect.options.add(new Option(list[i][1], list[i][0]));
		}
		select_dialect.style.visibility = list[1].length == 1 ? 'hidden'
				: 'visible';
	}

	var create_email = false;
	var final_transcript = '';
	var recognizing = false;
	var ignore_onend;
	var start_timestamp;
	if (!('webkitSpeechRecognition' in window)) {
		upgrade();
	} else {
		start_button.style.display = 'inline-block';
		var recognition = new webkitSpeechRecognition();
		recognition.continuous = false; //true면 마이크 버튼 누르고 말해도 계속 말할 수 있음
		recognition.interimResults = true;
		recognition.onstart = function() {
			recognizing = true;
			showInfo('info_speak_now');
			start_img.src = '/Moderna/img/mic-animate.gif';
		};
		recognition.onerror = function(event) {
			if (event.error == 'no-speech') {
				start_img.src = '/Moderna/img/mic.gif';
				showInfo('info_no_speech');
				ignore_onend = true;
			}
			if (event.error == 'audio-capture') {
				start_img.src = '/Moderna/img/mic.gif';
				showInfo('info_no_microphone');
				ignore_onend = true;
			}
			if (event.error == 'not-allowed') {
				if (event.timeStamp - start_timestamp < 100) {
					showInfo('info_blocked');
				} else {
					showInfo('info_denied');
				}
				ignore_onend = true;
			}
		};
		recognition.onend = function() {
			recognizing = false;
			if (ignore_onend) {
				return;
			}
			start_img.src = '/Moderna/img/mic.gif';

			//////////////////////////명령어랑 답변 적은거
			if (final_span.innerHTML.indexOf("의견") > -1) {
				window.open("/post/opinion", "",
						"width=510,height=485,left=500");
			}
			if (final_span.innerHTML.indexOf("종료") > -1 || final_span.innerHTML.indexOf("꺼 줘") > -1) {//종료라는 단어가 들어갔을때
				alert("좋은 하루 되세요~~");
				window.close();
			} 
			if(final_span.innerHTML.indexOf("로그아웃") > -1){
				opener.document.location.href = "/member/logout";
			}
			if (final_span.innerHTML.indexOf("메인") > -1) {
				opener.document.location.href = "/main/view";
			}
			if (final_span.innerHTML.indexOf("상권") > -1) {
				opener.document.location.href = "/map/taSelect";
			}
			if (final_span.innerHTML.indexOf("입지") > -1) {
				opener.document.location.href = "/location/selectLocation";
			}
			if (final_span.innerHTML.indexOf("수익") > -1) {
				opener.document.location.href = "/profit/proSelect";
			}
			if (final_span.innerHTML.indexOf("미래") > -1) {
				opener.document.location.href = "/future/view";
			}
			if (final_span.innerHTML.indexOf("이름") > -1) {
				answer.innerHTML = "제 이름은 대전봇 입니다.";
			}
			var y = new Date().getFullYear();
			var m = new Date().getMonth();
			var d = new Date().getDate();
			if (final_span.innerHTML.indexOf("날짜") > -1 || final_span.innerHTML.indexOf("며칠") > -1) {
				answer.innerHTML = y + "년 " + m + "월 " + d + "일 입니다";
			}
			var h = new Date().getHours();
			var m = new Date().getMinutes();
			var s = new Date().getSeconds();
			if (final_span.innerHTML.indexOf("시간") > -1) {
				answer.innerHTML = "현재 시간은 " + h + "시 " + m + "분 " + s
						+ "초 입니다";
			}
			//////////////////////////여기까지 명령어랑 답변(추가예정)
			if (!final_transcript) {
				showInfo('info_start');
				return;
			}
			showInfo('');
			if (window.getSelection) {
				window.getSelection().removeAllRanges();
				var range = document.createRange();
				range.selectNode(document.getElementById('final_span'));
				window.getSelection().addRange(range);
			}
		};

		recognition.onresult = function(event) {
			var interim_transcript = '';
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					final_transcript += event.results[i][0].transcript;
				} else {
					interim_transcript += event.results[i][0].transcript;
				}
			}
			final_transcript = capitalize(final_transcript);
			final_span.innerHTML = linebreak(final_transcript);
			interim_span.innerHTML = linebreak(interim_transcript);
			if (final_transcript || interim_transcript) {
				showButtons('inline-block');
			}
		};
	}

	function upgrade() {
		start_button.style.visibility = 'hidden';
		showInfo('info_upgrade');
	}

	var two_line = /\n\n/g;
	var one_line = /\n/g;
	function linebreak(s) {
		return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
	}

	var first_char = /\S/;
	function capitalize(s) {
		return s.replace(first_char, function(m) {
			return m.toUpperCase();
		});
	}

	function startButton(event) {
		if (recognizing) {
			recognition.stop();
			return;
		}
		final_transcript = '';
		recognition.lang = select_dialect.value;
		recognition.start();
		ignore_onend = false;
		final_span.innerHTML = '';
		interim_span.innerHTML = '';
		answer.innerHTML = '';
		start_img.src = '/Moderna/img/mic-slash.gif';
		showInfo('info_allow');
		showButtons('none');
		start_timestamp = event.timeStamp;
	}

	function showInfo(s) {
		if (s) {
			for (var child = info.firstChild; child; child = child.nextSibling) {
				if (child.style) {
					child.style.display = child.id == s ? 'inline' : 'none';
				}
			}
			info.style.visibility = 'visible';
		} else {
			info.style.visibility = 'hidden';
		}
	}

	var current_style;
	function showButtons(style) {
		if (style == current_style) {
			return;
		}
		current_style = style;
	}
</script>