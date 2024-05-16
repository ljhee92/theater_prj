package admin;

public class BoardUtil {
	
	private static BoardUtil bu;
	
	private BoardUtil() {
	}
	
	public static BoardUtil getInstance() {
		if(bu == null) {
			bu = new BoardUtil();
		} // end if
		return bu;
	} // getInstance
	
	public String pageNation(String url, String param, int totalPage, int currentPage) {
		StringBuilder pageNation = new StringBuilder();
		
		// 1. 한 화면에서 보여줄 페이지 인덱스의 수
		int pageNumber = 3;
		
		// 2. 화면에 보여줄 시작 페이지의 번호
		int startPage = ((currentPage-1) / pageNumber) * pageNumber + 1;
		
		// 3. 화면에 보여줄 마지막 페이지의 번호
		int endPage = (((startPage - 1) + pageNumber) / pageNumber) * pageNumber;
		
		// 4. 총 페이지의 수가 연산된 마지막 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 번호로 설정
		if(totalPage <= endPage) {
			endPage = totalPage;
		} // end if
		
		// 5. 첫 페이지가 인덱스 화면이 아닌 경우
		String prevButton = "<input type=\"button\" class=\"btn btn-primary btn-user btn-block\" "
				+ "style=\"width:40px; height:40px; margin-right:10px; margin-bottom:10px;\" "
				+ "value=\"<\" onclick=\"#\">";
		int movePage = 0;
		
		if(currentPage > pageNumber) { // 시작페이지보다 1 적은 페이지로 이동
			movePage = startPage - 1;
			prevButton = "<input type=\"button\" class=\"btn btn-primary btn-user btn-block\" "
					+ "style=\"width:40px; height:40px; margin-right:10px; margin-bottom:10px;\" "
					+ "value=\"<\" onclick=\"location.href='"+url+"?currentPage="+movePage+param+"'\">";
		} // end if
		
		pageNation.append(prevButton);
		
		// 6. 시작 페이지 번호부터 끝 페이지 번호까지 화면에 출력
		movePage = startPage;
		
		while(movePage <= endPage) {
			if(movePage == currentPage) { // 현재 페이지에 대해서는 링크를 생성하지 않는다.
				pageNation.append("<input type=\"button\" class=\"btn btn-primary focus btn-user btn-block\" ")
						.append("style=\"width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;\" ")
						.append("value=\"").append(currentPage).append("\" onclick=\"#\">");
			} else {
				pageNation.append("<input type=\"button\" class=\"btn btn-primary btn-user btn-block\" ")
						.append("style=\"width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;\" ")
						.append("value=\"").append(movePage)
						.append("\" onclick=\"location.href='").append(url).append("?currentPage=")
						.append(movePage).append(param).append("'\">");
			} // end else
			movePage++;
		} // end while
		
		// 7. 뒤에 페이지가 더 있는 경우
		String nextButton = "<input type=\"button\" class=\"btn btn-primary btn-user btn-block\" "
				+ "style=\"width:40px; height:40px; margin-right:10px; margin-bottom:10px;\" "
				+ "value=\">\" onclick=\"#\">";
		
		if(totalPage > endPage) {
			movePage = endPage + 1;
			nextButton = "<input type=\"button\" class=\"btn btn-primary btn-user btn-block\" "
					+ "style=\"width:40px; height:40px; margin-right:10px; margin-bottom:10px;\" "
					+ "value=\">\" onclick=\"location.href='"+url+"?currentPage="+movePage+param+"'\">";
		} // end if
		
		pageNation.append(nextButton);
		
		return pageNation.toString();
	} // pageNation
	
} // class