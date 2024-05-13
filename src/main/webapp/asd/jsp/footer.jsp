<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>


		<footer>
		


			<div id="BottomWrapper" class="sect-ad">
				<iframe
					src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Bottom"
					width="100%" height="240" title="" frameborder="0" scrolling="no"
					marginwidth="0" marginheight="0" name="Bottom" id="Bottom"></iframe>
			</div>
			<ul class="policy_list">
				<li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
				<li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
				<li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
				<li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
				<li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
				<li><a href="../admin/jsp/dashboard.jsp">관리자 로그인</a></li>
			</ul>
			<article class="company_info_wrap">
				<section class="company_info">

					<address>(16293)경기도 수원시 장안구 조원동 광교산 임광그대가 101동 1002호</address>

					<dl class="company_info_list">
						<dt>대표이사</dt>
						<dd>윤웅찬</dd>
						<dt>사업자등록번호</dt>
						<dd>010-8623-5905</dd>
						<dt>통신판매업신고번호</dt>
						<dd>
							1998-경기수원-0513 <a href="#none" onclick="goFtc()"
								class="btn_goFtc">사업자정보확인<a></a></a>
						</dd>
					</dl>

					<dl class="company_info_list">
						<dt>호스팅사업자</dt>
						<dd>SSANGYONG</dd>
						<dt>개인정보보호 책임자</dt>
						<dd>윤웅찬</dd>
						<dt>대표이메일</dt>
						<dd>woong@sist.co.kr</dd>

					</dl>

					<p class="copyright">&copy; 예찬,주희,지민,무영,웅찬 LET'S GO</p>
				</section>
			</article>
			<script>
				//footer GA Analytics 영역 LOG
				$('.policy_list > li > a').on({
					click : function(e) {
						gaEventLog('PC_footer', this.text, '');
					}
				});
			</script>

		</footer>

		

