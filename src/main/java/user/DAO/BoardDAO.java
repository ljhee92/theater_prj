package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.BoardVO;
import VO.SearchVO;
import util.DbConnection;

public class BoardDAO {
		// -------- Singleton start---------
	private static BoardDAO qDAO;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (qDAO == null) {
			qDAO = new BoardDAO();
		}
		return qDAO;
	}// getInstance
		// --------Singleton end-----------
	
	/**
	 * 게시물 상단 카테고리표시 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectCategory(String notice) throws SQLException{
		List<String> categoryList = new ArrayList<String>();
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
	        String selectQuery = "SELECT category_name FROM category WHERE category_type_flag = ?";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, notice);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				String category = rs.getString("category_name");
				categoryList.add(category);
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return categoryList;
	}
	
	
	
	
	/**
	 * 공지/뉴스 , 자주찾는질문 count 구하는 메서드
	 * @param FAQS
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCount(String FAQS) throws SQLException{
		int totalCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {		
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbCon.getConnection(id, pass);

			StringBuilder sbQuery = new StringBuilder();
			sbQuery
			.append("	select count(*) cnt from board b ")
			.append("	join category c on b.category_number = c.category_number ")
			.append("	where c.category_type_flag = ? ");
			
			pstmt = con.prepareStatement(sbQuery.toString());
			pstmt.setString(1, FAQS);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end if
			
		}finally {
			//7. 연결 끊기			
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return totalCnt;
	}
	
	/**
	 * 선택 카테고리 count 구하는 메서드
	 * @param FAQS
	 * @return
	 * @throws SQLException
	 */
	public int selectCategoryCount(String FAQS,String category) throws SQLException{
		int totalCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {		
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";
			
			// 2. 데이터베이스 연결
			con = dbCon.getConnection(id, pass);
			
			StringBuilder sbQuery = new StringBuilder();
			sbQuery
			.append("	select count(*) cnt from board b ")
			.append("	join category c on b.category_number = c.category_number ")
			.append("	where c.category_type_flag = ? and c.category_name = ? ");
			
			pstmt = con.prepareStatement(sbQuery.toString());
			pstmt.setString(1, FAQS);
			pstmt.setString(2, category);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end if
			
		}finally {
			//7. 연결 끊기			
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return totalCnt;
	}
	
	
	
	/**
	 * board list 반환하는 메서드
	 * @param bVO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO>selectBoard(int startNum, int endNum, String FAQS) throws SQLException{
		List<BoardVO> list = new ArrayList<BoardVO>();	

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbCon.getConnection(id, pass);

		
			StringBuilder sbQuery = new StringBuilder();
			sbQuery
			.append("	SELECT * FROM (")
			.append("    SELECT c.CATEGORY_NAME, b.BOARD_NUMBER, b.BOARD_TITLE, b.BOARD_CONTENT, ")
			.append("           b.BOARD_INPUT_DATE, b.BOARD_VIEWS, b.ADMIN_ID, ")
			.append("           ROW_NUMBER() OVER (ORDER BY b.BOARD_INPUT_DATE DESC) AS rnum ")
			.append("    FROM board b ")
			.append("    JOIN category c ON b.category_number = c.category_number ")
			.append("    WHERE c.category_type_flag = ? ")
			.append(") sub ")
			.append("WHERE rnum BETWEEN ? AND ? ")
			.append("ORDER BY BOARD_NUMBER desc");

			
			
			pstmt = con.prepareStatement( sbQuery.toString());
			pstmt.setString(1, FAQS );
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			//5. 바인드변수에 값 설정
			//6. 쿼리문 수행 후 결과얻기
			rs= pstmt.executeQuery();
			BoardVO bVO = null;
			
			while(rs.next()) {
				bVO = BoardVO.builder()
						.categoryName(rs.getString("CATEGORY_NAME"))
						.boardNumber(rs.getString("BOARD_NUMBER"))
						.boardTitle(rs.getString("BOARD_TITLE"))
						.boardContent(rs.getString("BOARD_CONTENT"))
						.boardInputDate(rs.getString("BOARD_INPUT_DATE"))
						.boardViews(rs.getInt("BOARD_VIEWS"))
						.adminId(rs.getString("ADMIN_ID"))
						.rnum(rs.getInt("rnum"))
						.build();
				list.add(bVO);
			}
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 상단카테고리 클릭하면 해당 카테고리의 글만 보여주는 메서드
	 * @param sVO
	 * @param FAQS
	 * @param categoryName
	 * @return
	 * @throws SQLException 
	 */
	public List<BoardVO> selectOneCategory(int startNum,int endNum, String FAQS,String category) throws SQLException{
		List<BoardVO> list = new ArrayList<BoardVO>();	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbCon.getConnection(id, pass);

		
			StringBuilder sbQuery = new StringBuilder();
			sbQuery
			.append("	SELECT * FROM (")
			.append("    SELECT c.CATEGORY_NAME, b.BOARD_NUMBER, b.BOARD_TITLE, b.BOARD_CONTENT, ")
			.append("           b.BOARD_INPUT_DATE, b.BOARD_VIEWS, b.ADMIN_ID, ")
			.append("           ROW_NUMBER() OVER (ORDER BY b.BOARD_INPUT_DATE DESC) AS rnum ")
			.append("    FROM board b ")
			.append("    JOIN category c ON b.category_number = c.category_number ")
			.append("    WHERE c.category_type_flag = ? ")
			.append(") sub ")
			.append("WHERE CATEGORY_NAME = ? ")
			.append("ORDER BY BOARD_NUMBER desc");

			
			
			pstmt = con.prepareStatement( sbQuery.toString());
			pstmt.setString(1, FAQS );
//			pstmt.setInt(2, 1);
//			pstmt.setInt(3, endNum);
			pstmt.setString(2, category);
			//5. 바인드변수에 값 설정
			//6. 쿼리문 수행 후 결과얻기
			rs= pstmt.executeQuery();
			BoardVO bVO = null;
			
			while(rs.next()) {
				bVO = BoardVO.builder()
						.categoryName(rs.getString("CATEGORY_NAME"))
						.boardNumber(rs.getString("BOARD_NUMBER"))
						.boardTitle(rs.getString("BOARD_TITLE"))
						.boardContent(rs.getString("BOARD_CONTENT"))
						.boardInputDate(rs.getString("BOARD_INPUT_DATE"))
						.boardViews(rs.getInt("BOARD_VIEWS"))
						.adminId(rs.getString("ADMIN_ID"))
						.rnum(rs.getInt("rnum"))
						.build();
				list.add(bVO);
			}
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}
}
