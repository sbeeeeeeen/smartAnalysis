<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' href='/css/jquery-ui.min.css' />
<link href='/css/fullcalendar.css' rel='stylesheet' />
<link href='/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/js/moment.min.js'></script>
<script src='/js/jquery.min.js'></script>
<script src='/js/fullcalendar.min.js'></script>
<script src='/js/lang-all.js'></script>
<script>

	$(document).ready(function() {
		var currentLangCode = 'ko';

		// build the language selector's options
		$.each($.fullCalendar.langs, function(langCode) {
			$('#lang-selector').append(
				$('<option/>')
					.attr('value', langCode)
					.prop('selected', langCode == currentLangCode)
					.text(langCode)
			);
		});

		// rerender the calendar when the selected option changes
		$('#lang-selector').on('change', function() {
			if (this.value) {
				currentLangCode = this.value;
				$('#calendar').fullCalendar('destroy');
				renderCalendar();
			}
		});

		function renderCalendar() {
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				defaultDate: '2018-10-12',
				lang: currentLangCode,
				selectable: true,
				selectHelper: true,
				select: function(start, end) {
					var title = prompt('일정 추가:');
					var eventData;
					if (title) {
						eventData = {
							title: title,
							start: start,
							end: end
						};
						$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
					}
					$('#calendar').fullCalendar('unselect');
				},
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				events: [
					{
						title: '하루종일~',
						start: '2018-10-01'
					},
					{
						title: '길게~',
						start: '2018-10-07',
						end: '2018-10-10'
					},
					{
						id: 999,
						title: '같이 움직',
						start: '2018-10-09T16:00:00'
					},
					{
						id: 999,
						title: '같이 움직',
						start: '2018-10-16T16:00:00'
					},
					{
						title: '회의',
						start: '2018-10-11',
						end: '2018-10-13'
					},
					{
						title: '미팅',
						start: '2018-10-12T10:30:00',
						end: '2018-10-12T12:30:00'
					},
					{
						title: '점심',
						start: '2018-10-12T12:00:00'
					},
					{
						title: '저녁',
						start: '2018-10-12T20:00:00'
					},
					{
						title: '생일파티',
						start: '2018-10-13T07:00:00'
					},
					{
						title: '구글로 가볼까?',
						url: 'http://google.com/',
						start: '2018-10-28'
					}
				]
			});
		}
		renderCalendar();
	});

</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
}
	
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id='top'>
		Language:
		<select id='lang-selector'></select>
	</div>
	<div id='calendar'></div>

</body>
</html>
