<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<link href="/css/utilization.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<!-- container -->
	<div class="container ng-scope">

		<!-- 활용현황 큰 글자 -->
		<div class="page-header">
			<h2>활용현황</h2>
		</div>

		<!-- 작은 탭 -->
		<div class="container mt-3">
			<div class="col-5">
				<ul class="nav nav-tabs">
					<li class="active"><a href="/util/view">지역별순위</a></li>
					<li><a href="/util/upzong">업종별순위</a></li>
				</ul>
			</div>
		</div>

		<!-- 지역선택 -->
		<div id="area" class="w3-container rank">
			<div class="selectwrap">
				<div class="col-1 col-offset-3 text-right">
					<h5>지역</h5>
				</div>

				<!-- 셀렉트 박스 -->
				<form id="frm" role="form" name="frm" method="post">
					<div class="col-1 ng-scope">
						<select id="reg_gu" name="reg_gu" class="btn btn-select btn-block">
							<option value="" selected="selected" disabled>구</option>
							<c:forEach items="${reg_guList }" var="vo">
								<option value="${vo.reg_gucode }">${vo.reg_gu }</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-1 ng-scope">
						<select id="reg_dong" name="reg_dong"
							class="btn btn-select btn-block">
						</select>
					</div>

					<!-- 현황보기 -->
					<div class="col-4 text-left">
						&nbsp;&nbsp;&nbsp; <input type="button" id="resultBtn"
							class="btn btn-dark" value="현황보기">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 여기서부터 결과값 출력 -->
	<div class="container ng-scope">
		<table class="table table-striped table-hover">
			<thead id="utilTable">

			</thead>

			<tbody id="lookSangHa">

			</tbody>
		</table>

	</div>

</body>

<script>
	//대분류 클릭하면 중분류 리스트 넘겨주는 메서드
	$("#reg_gu").on('change', function() {

		$.ajax({
			method : "post",
			data : {
				"reg_gu" : encodeURI($('#reg_gu option:selected').val())
			},
			url : "/util/regGu",
			datatype : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

				var htmlStr = '<option value="">동</option>';
				$.each(data.dongList, function(index, value) {
					htmlStr += '<option value='+ value.reg_code + '>';
					htmlStr += value.reg_dong + '</option>';
				})

				$("#reg_dong").html(htmlStr);
			},
			error : function(error) {
				swal('ERROR', '에러발생', 'error')
			}
		});
	});

	$("#resultBtn")
			.on(
					"click",
					function() {

						var reg_gu = $("#reg_gu option:selected").val(); //구
						var reg_dong = $("#reg_dong option:selected").val(); //동

						if (reg_gu == "") {
								swal('warning', '지역 구를 선택하세요.', 'warning')
							return false;
						}

						if (reg_dong == "") {
								swal('warning', '동을 선택하세요.', 'warning')
							return false;
						}

						//-------------------- 지역 검사 끝

						$
								.ajax({
									method : 'POST',
									data : {
										"reg_dong" : $(
												'#reg_dong option:selected')
												.val()
									},
									url : "/util/result",
									datatype : "json",
									contentType : "application/json; charset=UTF-8",
									success : function(data) {

										var utilTable = '<tr><th rowspan=\"2\">순위</th><th colspan=\"3\">2018년 상반기</th><th colspan=\"3\">2018년 하반기</th></tr><tr><th>지역</th><th>업종</th><th>분석횟수</th><th>지역</th><th>업종</th><th>분석횟수</th></tr>';
										$("#utilTable").html(utilTable);

										var sang0 = '<tr><td>';

										if (data.resultListSang[0] != null) {

											for (var i = 0; i < 1; i++) {
												sang0 += i
														+ 1
														+ '</td><td>'
														+ data.resultListSang[0].reg_dong
														+ '</td><td><a class=\"showmore\">전체</a></td><td>'
														+ data.sangCnt
														+ '</td>';
											}
										} else {
											sang0 += '<td></td><td>데이터가 없습니다.</td><td></td><td></td>';
										}

										var ha0 = sang0;

										if (data.resultListHa[0] != null) {
											ha0 += '<td>'
													+ data.resultListHa[0].reg_dong
													+ '</td><td><a class="showmore">전체</a></td><td>'
													+ data.haCnt + '</td></tr>'
										} else {
											ha0 += '<td></td><td>데이터가 없습니다.</td><td></td><td></td></tr>';
										}

										//lookSangHa 에 적재
										ha0 += "<tr class=\"detail\">";
										ha0 += '<td colspan="7">';
										ha0 += '<div><table class="table" id="inviTable" style="margin: auto;">';
										ha0 += '</table></div></td></tr>';
										$("#lookSangHa").html(ha0);

										// 안보이는 tr 출력 시작 부분 ---------------------------------------------------------------------
								         if (data.listSize != 0) {
								            var inviSangHa = '';
								            for (var i = 0; i < data.listSize; i++) {
								                inviSangHa += '<tr>';
								               if (data.resultListSang[i] != null) {
								                  inviSangHa += '<td width="10%"></td>';
								                  inviSangHa += '<td width="10%"></td>';
								                  inviSangHa += '<td width="17%">└'+data.resultListSang[i].ind_m+'</td>';
								                  inviSangHa += '<td width="17%">'+data.resultListSang[i].cnt+'</td>';
								               } else {
								                  inviSangHa += '<td width="8.9%"></td>';
								                  inviSangHa += '<td width="8.9%"></td>';
								                  inviSangHa += '<td width="26.9%">-- --</td>';
								                  inviSangHa += '<td width="18%"></td>';
								               }
								               if (data.resultListHa[i] != null) {
								                  inviSangHa += '<td width="10.5%"></td>';
								                  inviSangHa += '<td width="18%">└'+data.resultListHa[i].ind_m+'</td>';
								                  inviSangHa += '<td width="18%">'+data.resultListHa[i].cnt+'</td></tr>';
								               } else {
								                  inviSangHa += '<td width="10.5%"></td>';
								                  inviSangHa += '<td width="18%">-- --</td>';
								                  inviSangHa += '<td width="18%"></td>';
								                  inviSangHa += '</tr>';
								               }
								               
								            }//for문 끝 부분 invisibleSangHa 에 적재
								            $("#inviTable").html(inviSangHa);
								         }
								         
								      },
									error : function(request, status, error) {
										swal('warning', "code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error, 'warning')
									}
								});

					});
</script>
<script>
	$(document).ready(function() {
		console.log("ready!");
		$(function() {
			$(document).on("click", "a.showmore", function(e) {
				e.preventDefault();
				// We break and store the result so we can use it to hide
				// the row after the slideToggle is closed
				var targetrow = $(this).closest('tr').next('.detail');
				targetrow.show().find('div').slideToggle('slow', function() {
					if (!$(this).is(':visible')) {
						targetrow.hide();
					}
				});
			});
		});
	});
</script>


</html>