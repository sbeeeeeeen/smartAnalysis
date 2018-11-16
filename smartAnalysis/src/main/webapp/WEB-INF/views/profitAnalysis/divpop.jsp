<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 탭 -->
	<ul class="nav nav-tabs depth-1 nav-justified" role="">
		<li class="active"><a href="#category1" role="tab"data-toggle="tab">음식업</a></li>
		<li class=""><a href="#category2" role="tab" data-toggle="tab">서비스업</a></li>
		<li class=""><a href="#category3" role="tab" data-toggle="tab">소매업</a></li>
	</ul>
	<!-- /탭 -->
	<!-- 탭 콘텐츠 -->
	<div class="tab-content" id="allUpjongList">
		<div class="tab-pane active" id="category1">
			<div id="up1Tab_Q" class="categorylist">
				<input type="hidden" name="test" id="test" value="간이음식">
					<h4>간이음식</h4>
					<ul>
						<li>
							<label class="control radio">
								<input type="radio" class="add-contrast" name="upjong" value="Q07A07" data-role="collar">
								<span class="control-indicator"></span>아이스크림판매
							</label>
						</li>
						<li>
							<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q08A01" data-role="collar">
							<span class="control-indicator"></span>제과점</label>
						</li>
						<li>
							<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q12A01" data-role="collar">
							<span class="control-indicator"></span>커피전문점/카페/다방</label>
						</li>
						<li>
							<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q07A04" data-role="collar">
							<span class="control-indicator"></span>패스트푸드</label>
						</li>
						<li>
							<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q07A01" data-role="collar">
							<span class="control-indicator"></span>피자전문</label>
						</li>
					</ul><hr>
				<h4>한식/분식</h4>
				<ul>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q04A01" data-role="collar">
						<span class="control-indicator"></span>국수/만두/칼국수</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q07A02" data-role="collar">
						<span class="control-indicator"></span>도시락전문점</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q04A02" data-role="collar">
						<span class="control-indicator"></span>떡볶이전문</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q04A05" data-role="collar">
						<span class="control-indicator"></span>라면김밥분식</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q10A01" data-role="collar">
						<span class="control-indicator"></span>죽전문점</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q01A01" data-role="collar">
						<span class="control-indicator"></span>한식/백반/한정식</label>
					</li>
					<li>
						<label class="control radio"><input type="radio" class="add-contrast" name="upjong" value="Q01A05" data-role="collar">
						<span class="control-indicator"></span>해장국/감자탕</label>
					</li>
				</ul><hr>
				<h4>외식</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q02A00" data-role="collar">
							<span class="control-indicator"></span>중국음식/중국집</label>
					</li>
				</ul><hr>
				<h4>주점/고기요리</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q01A02" data-role="collar">
						<span class="control-indicator"></span>갈비/삼겹살</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q01A03" data-role="collar">
						<span class="control-indicator"></span>곱창/양구이전문</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q01A08" data-role="collar">
						<span class="control-indicator"></span>족발/보쌈전문</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q09A01" data-role="collar">
						<span class="control-indicator"></span>호프/맥주</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="Q05A08" data-role="collar">
						<span class="control-indicator"></span>후라이드/양념치킨</label>
					</li>
				</ul><hr>
			</div>
		</div>

		<!-- 서비스 탭 -->
		<div class="tab-pane" id="category2">
			<div id="up1Tab_Q" class="categorylist">
				<h4>이미용</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="F01A02" data-role="collar">
						<span class="control-indicator"></span>발/네일케어</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="F01A03" data-role="collar">
						<span class="control-indicator"></span>비만/피부관리</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="F01A01" data-role="collar">
						<span class="control-indicator"></span>여성미용실</label>
					</li>
				</ul><hr>
				<h4>여가/오락</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="N02A01" data-role="collar">
						<span class="control-indicator"></span>노래방</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="O02A01" data-role="collar">
						<span class="control-indicator"></span>모텔/여관/여인숙</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="P02A10" data-role="collar">
						<span class="control-indicator"></span>실내골프연습장</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="P02A13" data-role="collar">
						<span class="control-indicator"></span>헬스클럽</label>
					</li>
				</ul><hr>
				<h4>학문/교육</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="R08A02" data-role="collar">
						<span class="control-indicator"></span>어린이집</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="R09A01" data-role="collar">
						<span class="control-indicator"></span>학원(종합)</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="R01A01" data-role="collar">
						<span class="control-indicator"></span>학원-입시</label>
					</li>
				</ul><hr>
				<h4>세탁/가사</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="F02A01" data-role="collar">
						<span class="control-indicator"></span>세탁소/빨래방</label>
					</li>
				</ul><hr>
				<h4>차량관리</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="F14A01" data-role="collar">
						<span class="control-indicator"></span>자동차정비/카센타</label>
					</li>
				</ul><hr>
			</div>
		</div>
		
		<div class="tab-pane" id="category3">
			<div id="up1Tab_Q" class="categorylist">
				<h4>종합소매</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D10A04" data-role="collar">
						<span class="control-indicator"></span>건강식품판매</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D03A02" data-role="collar">
						<span class="control-indicator"></span>슈퍼마켓</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D03A01" data-role="collar">
						<span class="control-indicator"></span>편의점</label>
					</li>
				</ul><hr>
				<h4>의류/패션</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D06A01" data-role="collar">
						<span class="control-indicator"></span>신발소매</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D18A04" data-role="collar">
						<span class="control-indicator"></span>안경원</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D05A01" data-role="collar">
						<span class="control-indicator"></span>일반의류</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D05A02" data-role="collar">
						<span class="control-indicator"></span>캐쥬얼/스포츠의류</label>
					</li>
				</ul><hr>
				<h4>화훼</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D02A02" data-role="collar">
						<span class="control-indicator"></span>꽃집/꽃배달</label>
					</li>
				</ul><hr>
				<h4>화장품소매</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D16A01" data-role="collar">
						<span class="control-indicator"></span>화장품판매점</label>
					</li>
				</ul><hr>
				<h4>사무집기</h4>
				<ul>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D08A01" data-role="collar">
						<span class="control-indicator"></span>사무/문구용품</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D07A01" data-role="collar">
						<span class="control-indicator"></span>인테리어/욕실용품/커튼</label>
					</li>
					<li>
						<label class="control radio"> <input type="radio" class="add-contrast" name="upjong" value="D15A01" data-role="collar">
						<span class="control-indicator"></span>일반가구소매</label>
					</li>
				</ul><hr>
			</div>
		</div>
		<div style="height: 10%" class="layer-pop-footer">
			<ul style="text-align: center;">
				<li id="selectuj" class="btn btn-theme" style="background: #546799;">확인</li>
				<li id="close" class="btn btn-warning">취소</li>
			</ul>
		</div>
	</div>

