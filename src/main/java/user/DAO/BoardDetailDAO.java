package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import VO.BoardVO;
import util.DbConnection;

public class BoardDetailDAO {
	private static BoardDetailDAO bdDAO;
	
	private BoardDetailDAO() {
		
	}
	
	public static BoardDetailDAO getInstance() {
		if(bdDAO == null) {
			bdDAO = new BoardDetailDAO();
		}
		return bdDAO;
	}
	
	
	public BoardVO selectBoardInfo(String FAQS, int boardNumber, int num ) throws SQLException {
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardVO bVO = null;
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
			StringBuilder sbQUery = new StringBuilder();
	        sbQUery
	        .append("SELECT c.CATEGORY_NAME, b.BOARD_NUMBER, b.BOARD_TITLE, b.BOARD_CONTENT, ")
	        .append(" b.BOARD_INPUT_DATE, b.BOARD_VIEWS, b.ADMIN_ID FROM BOARD b ")
	        .append("JOIN CATEGORY c on b.CATEGORY_NUMBER = c.CATEGORY_NUMBER ")
	        .append("WHERE  c.CATEGORY_TYPE_FLAG = ? AND b.BOARD_NUMBER = ? + ?");
			String selectQuery = sbQUery.toString();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, FAQS);
			pstmt.setInt(2, boardNumber);
			pstmt.setInt(3, num);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				bVO = BoardVO.builder()
						.categoryName(rs.getString("CATEGORY_NAME"))
						.boardNumber(rs.getString("BOARD_NUMBER"))
						.boardTitle(rs.getString("BOARD_TITLE"))
						.boardContent(rs.getString("BOARD_CONTENT"))
						.boardInputDate(rs.getDate("BOARD_INPUT_DATE"))
						.boardViews(rs.getInt("BOARD_VIEWS"))
						.adminId(rs.getString("ADMIN_ID"))
						.build();
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return bVO;
	}
}
