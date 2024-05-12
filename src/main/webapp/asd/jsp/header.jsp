<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
 
		
		<div class="header">
			<!-- 서비스 메뉴 -->

			<div class="header_content">
				<div class="contents">
					<h1 onclick="">
						<a href="index.jsp"><img
							src="../logo.png"
							alt="CGV" /></a><span>CULTUREPLEX</span>
					</h1>
					<ul class="memberInfo_wrap">



						<%
						String id="";
						
						if (session.getAttribute("id") != null) {
							id = session.getAttribute("id").toString();
						}
						%>
						
						<li>
						
						<% if( id.equals("")){ %>
						
						<a href="login.jsp">
							<img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" />
							<span>로그인</span></a></li>
							
						<li><a href="join.jsp"><img
								src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
								alt="회원가입" /><span>회원가입</span></a></li>
							
							
							<%}else{ %>
							
						<li><a href="logout.jsp" class="logout" title="로그아웃" >
							<img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" />
							<span>로그아웃</span></a></li>
							<% } %>
								
								

						<li><a href="myPage.jsp"><img
								src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
								alt="MY CGV" /><span>MY CGV</span></a></li>
					</ul>
				</div>
			</div>

			<script>
				//GA Analytics TopMenu 영역 LOG
				//빨강 CGV클릭
				$('.header_content > .contents > h1 > a').on({
					click : function(e) {
						gaEventLog('PC_GNB', '홈', '');
					}
				});
				//서비스 메뉴
				$('.header_content > .contents > ul > li > a').on({
					click : function(e) {
						gaEventLog('PC_GNB', '서비스메뉴_' + this.text, '');
					}
				});
			</script>
			<!-- 서비스 메뉴 -->

			<!-- 서브 메뉴 -->

			<script type="text/javascript">
				$(document)
						.ready(
								function() {
									$('.nav_menu > li > h2 > a')
											.on(
													{
														mouseenter : function(e) {
															var target = e.target;
															$(target)
																	.parents(
																			'.nav_menu')
																	.find(
																			'.nav_overMenu')
																	.slideDown(
																			function() {
																				$(
																						'.nav')
																						.addClass(
																								'active');
																			});
														},
														click : function(e) {
															var target = e.target;
															if (!$('.nav')
																	.hasClass(
																			'active')) {
																$(this)
																		.trigger(
																				'mouseenter');
															} else {
																$('.nav')
																		.trigger(
																				'mouseleave');
															}
														}
													});

									/********************************************************
									//서브메뉴 구글 GA Analytics 로그 처리 - 2022.01.12 myilsan
									 ********************************************************/
									//cgv화이트 메뉴클릭
									$('.nav > .contents > h1 > a').on({
										click : function(e) {
											gaEventLog('PC_GNB', '홈', '');
										}
									});

									//주메뉴 클릭
									$('.nav_menu > li > h2 > a').on(
											{
												click : function(e) {
													gaEventLog('PC_GNB', '주메뉴_'
															+ this.text, '');
												}
											});

									//주메뉴 하위메뉴 클릭
									$('.nav_overMenu > dd > h3 > a')
											.on(
													{
														click : function(e) {
															var target = e.target;
															var parText = $(
																	target)
																	.parents(
																			'.nav_overMenu')
																	.find('dt')[0].innerText;
															gaEventLog(
																	'PC_GNB',
																	parText
																			+ '_'
																			+ this.text,
																	'');
														}
													});

									//하위메뉴 최상위 클릭
									$(".nav_overMenu > dt > h2 > a")
											.on(
													{
														click : function(e) {
															gaEventLog(
																	'PC_GNB',
																	this.text
																			+ '_'
																			+ this.text,
																	'');
														}
													});

									//------------------end----------------------- [@,.o]>

									$('.nav')
											.on(
													{
														mouseleave : function(e) {
															$(this)
																	.find(
																			'.nav_overMenu')
																	.slideUp(
																			200,
																			function() {
																				$(
																						'.nav')
																						.removeClass(
																								'active');
																			});
														}
													});

									$(this)
											.on(
													{
														scroll : function(e) {
															/* S GNB fixed */
															var headerOffsetT = $(
																	'.header')
																	.offset().top;
															var headerOuterH = $(
																	'.header')
																	.outerHeight(
																			true);
															var fixedHeaderPosY = headerOffsetT
																	+ headerOuterH;
															var scrollT = $(
																	this)
																	.scrollTop();
															var scrollL = $(
																	this)
																	.scrollLeft();

															if (scrollT >= fixedHeaderPosY) {
																$('.nav')
																		.addClass(
																				'fixed');
																$(
																		'.fixedBtn_wrap')
																		.addClass(
																				'topBtn');
															} else {
																$('.nav')
																		.removeClass(
																				'fixed');
																$(
																		'.fixedBtn_wrap')
																		.removeClass(
																				'topBtn');
															}

															/* S > GNB fixed 좌우 스크롤
															Description
															- GNB가 fixed 되었을때 좌우 스크롤 되게 처리
															 */
															if ($('.nav')
																	.hasClass(
																			'fixed')) {
																$('.nav')
																		.css(
																				{
																					'left' : -1
																							* scrollL
																				})
															} else {
																$('.nav').css({
																	'left' : 0
																})
															}
															/* E > GNB fixed 좌우 스크롤 */
															/* S GNB fixed */
														}
													});

									$('.btn_gotoTop').on({
										click : function() {
											$('html, body').stop().animate({
												scrollTop : '0'
											}, 400);
										}
									});

								});
			</script>
			<div class="nav">
				<div class="contents">
					<h1>
						<a href="/" tabindex="-1"><img
							src="../logo.png"
							alt="띵화관" /></a>
					</h1>
					<ul class="nav_menu">
						<li>
							<h2>
								<a href="movieChart.jsp">영화</a>
							</h2>
							<dl class="nav_overMenu">
								<dt>
									<h2>
										<a href="movieChart.jsp" tabindex="-1">영화</a>
									</h2>
								</dt>

								<dd>
									<h3>
										<a href="movieChart.jsp">무비차트</a>
									</h3>
								</dd>
							</dl>
						</li>

						<li>
							<h2>
								<a href="ticket.jsp"><strong>예매</strong></a>
							</h2>

							<dl class="nav_overMenu">
								<dt>
									<h2>
										<a href="ticket.jsp" tabindex="-1">예매</a>
									</h2>
								</dt>

								<dd>
									<h3>
										<a href="ticket.jsp">빠른예매</a>
									</h3>
								</dd>

							</dl>
						</li>

						<li>
							<h2>
								<a href="#/">스토어</a>
							</h2>

							<dl class="nav_overMenu">
								<dt>
									<h2>
										<a href="#" tabindex="-1">스토어</a>
									</h2>
								</dt>

								<dd>
									<h3>
										<a
											href="#">영화관람권</a>
									</h3>
								</dd>

								<dd>
									<h3>
										<a
											href="#">콤보</a>
									</h3>
								</dd>

								<dd>
									<h3>
										<a
											href="#">팝콘</a>
									</h3>
								</dd>

								<dd>
									<h3>
										<a
											href="#">음료</a>
									</h3>
								</dd>

								<dd>
									<h3>
										<a
											href="#">스낵</a>
									</h3>
								</dd>


							</dl>
						</li>

						<li>
							<h2>
								<a href="#">커뮤니티</a>
							</h2>
							<dl class="nav_overMenu">
								<dt>
									<h2>
										<a href="#"
											tabindex="-1">커뮤니티</a>
									</h2>
								</dt>

								<dd>
									<h3>
										<a href="#">영화게시판</a>
									</h3>
								</dd>

								<dd>
									<h3>
										<a href="#">영화리뷰</a>
									</h3>
								</dd>

							</dl>
						</li>
						
						<li>
							<h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')">
								<a href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=N">공지사항</a>
							</h2>

							<dl class="nav_overMenu">

								<dt>
									<h2>
										<a href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=N">공지사항</a>
									</h2>
								</dt>

							</dl>
						</li>

						<li>
							<h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')">
								<a href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=Q">자주찾는 질문</a>
							</h2>

							<dl class="nav_overMenu">

								<dt>
									<h2>
									<a href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=Q">자주찾는질문</a>
									</h2>
								</dt>

							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- 서브 메뉴 -->
		</div>
		<script type="text/javascript">
    function setFAQSValue(value) {
        document.getElementById("FAQSInput").value = value;
        document.getElementById("noticeForm").submit();
    }
</script>