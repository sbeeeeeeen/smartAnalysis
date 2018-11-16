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
					<li><a href="/util/view">지역별순위</a></li>
					<li class="active"><a href="/util/upzong">업종별순위</a></li>
				</ul>
			</div>
		</div>

		<!-- 업종선택 -->
		<div id="area" class="w3-container rank">
			<div class="selectwrap">
				<div class="col-1 col-offset-3 text-right">
					<h5>업종</h5>
				</div>

				<!-- 셀렉트 박스 -->
				<form id="frm" role="form" name="frm">
					<div class="col-1 ng-scope">
						<select id="ind_l" name="ind_l" class="btn btn-select btn-block">
							<option value="" selected="selected" disabled>대분류</option>
							<c:forEach items="${Ind_lList }" var="vo">
								<option value="${vo.IND_LCODE }">${vo.IND_L }</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-1 ng-scope">
						<select id="ind_m" name="ind_m" class="btn btn-select btn-block">
						</select>
					</div>

					<!-- 현황보기 -->
					<div class="col-4 text-left">
						&nbsp;&nbsp;&nbsp; <input type="button" id="upzongResultBtn"
							class="btn btn-dark" value="현황보기" />
					</div>
				</form>
			</div>
		</div>

	</div>

	<div class="container ng-scope">
		<table class="table table-striped table-hover">
			<thead id="upzongTable">

			</thead>

			<tbody id="lookSangHa">
			</tbody>
		</table>
	</div>

</body>

<script>
	//대분류 클릭하면 중분류 리스트 넘겨주는 메서드
	$("#ind_l").on('change', function() {

		$.ajax({
			method : "post",
			data : {
				"ind_l" : encodeURI($('#ind_l option:selected').val())
			},
			url : "/util/ind_l",
			datatype : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

				console.log(data);

				var htmlStr = '<option value="">중분류</option>';
				$.each(data.Ind_mList, function(index, value) {
					htmlStr += '<option value='+ value.ind_MCODE + '>';
					htmlStr += value.ind_M + '</option>';
				})

				$("#ind_m").html(htmlStr);

			},
			error : function(error) {
				alert("ERROR");
			}
		});
	});

	$("#upzongResultBtn")
			.on(
					"click",
					function() {

						var ind_l = $("#ind_l option:selected").val(); //대분류
						var ind_m = $("#ind_m option:selected").val(); //중분류

						if (ind_l == "") {
							alert("대분류를 선택하세요")
							return false;
						}

						if (ind_m == "") {
							alert("중분류를 선택하세요.")
							return false;
						}

						//-------------------------오류 검사 끝
						$
								.ajax({
									method : 'POST',
									data : {
										"ind_m" : encodeURI($(
												'#ind_m option:selected').val())
									},
									url : "/util/upzongResult",
									datatype : "json",
									contentType : "application/json; charset=UTF-8",
									success : function(data) {

										console.log(data);
										var upTable = "<tr><th rowspan=\"2\">순위</th><th colspan=\"3\">2018년 상반기</th><th colspan=\"3\">2018년 하반기</th></tr><tr><th>업종</th><th>지역</th><th>분석횟수</th><th>업종</th><th>지역</th><th>분석횟수</th></tr>";
										$("#upzongTable").html(upTable);

										var sang0 = '<tr><td>';

										if (data.upzongResultSang[0] != null) {

											for (var i = 0; i < 1; i++) {
												sang0 += i
														+ 1
														+ '</td><td>'
														+ data.upzongResultSang[0].ind_m
														+ '</td><td><a class=\"showmore\">전체</a></td><td>'
														+ data.sangCnt
														+ '</td>';
											}

										} else {
											sang0 += '<td></td><td>데이터가 없습니다.</td><td></td><td></td>';
										}

										var ha0 = sang0;

										if (data.upzongResultHa[0] != null) {
											ha0 += '<td>'
													+ data.upzongResultHa[0].ind_m
													+ '</td><td><a class=\"showmore\">전체</a></td><td>'
													+ data.haCnt + '</td></tr>';
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
								               if (data.upzongResultSang[i] != null) {
								                  inviSangHa += '<td width="10%"></td>';
								                  inviSangHa += '<td width="10%"></td>';
								                  inviSangHa += '<td width="17%">└'+data.upzongResultSang[i].reg_dong+'</td>';
								                  inviSangHa += '<td width="17%">'+data.upzongResultSang[i].cnt+'</td>';
								               } else {
								                  inviSangHa += '<td width="8.9%"></td>';
								                  inviSangHa += '<td width="8.9%"></td>';
								                  inviSangHa += '<td width="26.9%">-- --</td>';
								                  inviSangHa += '<td width="18%"></td>';
								               }
								               if (data.upzongResultHa[i] != null) {
								                  inviSangHa += '<td width="10.5%"></td>';
								                  inviSangHa += '<td width="18%">└'+data.upzongResultHa[i].reg_dong+'</td>';
								                  inviSangHa += '<td width="18%">'+data.upzongResultHa[i].cnt+'</td></tr>';
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
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});

					});
</script>
<script>
	$(document).ready(function() {
		console.log("ready!");
		$(function() {
			/* 	$('a.showmore').click(function(e) { */
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