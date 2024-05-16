package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import user.VO.ReviewVO;
import util.DbConnection;

public class UserReviewDAO {

	private static UserReviewDAO urDAO = null;
	
	private UserReviewDAO() {
		
	}
	
	public static UserReviewDAO getInstance() {
		if(urDAO == null) {
			urDAO = new UserReviewDAO();
		}
		
		return urDAO;
	}
	
	/**
	 * 마이페이지에서 내가 본 영화메뉴에 들어가면 호출될 메서드
	 * 
	 * @param userId
	 * @return 유저 예매 정보 및 리뷰 정보가 담긴 메서드 
	 * @throws SQLException
	 */
	public List<ReviewVO> selectReview(String userId) throws SQLException{
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		DbConnection dbcon = DbConnection.getInstance();
		ReviewVO rVO= null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String id = "son";
			String pass = "jimin";

			con = dbcon.getConnection(id, pass);

			StringBuilder sqlQuery = new StringBuilder();
			sqlQuery.append("SELECT ")
	        .append("    r.RESERVATION_NUMBER, ")
	        .append("    m.MOVIE_CODE, ")
	        .append("    m.MOVIE_TITLE, ")
	        .append("    m.MOVIE_POSTER_PATH, ")
	        .append("    s.THEATER_NAME, ")
	        .append("    s.THEATER_NUMBER, ")
	        .append("    TO_DATE(s.SCREENING_DATE, 'yyyy-mm-dd') AS SCREENING_DATE, ")
	        .append("    st.SCREENING_TIME, ")
	        .append("    rev.REVIEW_NUMBER, ")
	        .append("    rev.REVIEW_SCORE, ")
	        .append("    rev.REVIEW_CONTENT, ")
	        .append("    TO_DATE(rev.REVIEW_INPUT_DATE,'yyyy-mm-dd') AS REVIEW_INPUT_DATE ")
	        .append("FROM ")
	        .append("    RESERVATION r ")
	        .append("INNER JOIN ")
	        .append("    SCREENING s ON r.SCREENING_CODE = s.SCREENING_CODE ")
	        .append("INNER JOIN ")
	        .append("    SCREENING_TIME st ON s.SCREENING_ROUND = st.SCREENING_ROUND ")
	        .append("INNER JOIN ")
	        .append("    MOVIE m ON s.MOVIE_CODE = m.MOVIE_CODE ")
	        .append("LEFT JOIN ")
	        .append("    REVIEW rev ON r.RESERVATION_NUMBER = rev.RESERVATION_NUMBER ")
	        .append("WHERE ")
	        .append("    r.USER_ID = ? ")
	        .append("    AND (s.SCREENING_DATE < TRUNC(SYSDATE) ")
	        .append("    OR (s.SCREENING_DATE = TRUNC(SYSDATE) ")
	        .append("    AND TO_NUMBER(SUBSTR(st.SCREENING_TIME, 1, 2)) <= TO_NUMBER(TO_CHAR(SYSDATE, 'hh24')))) ")
	        .append("ORDER BY ")
	        .append("    s.SCREENING_DATE DESC");
			pstmt = con.prepareStatement(sqlQuery.toString());
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			
		
			while (rs.next()) {
				rVO = null;
				rVO = ReviewVO.builder()
					    .reservationNumber(rs.getString("RESERVATION_NUMBER"))
					    .movieCode(rs.getString("MOVIE_CODE"))
					    .movieTitle(rs.getString("MOVIE_TITLE"))
					    .moviePosterPath(rs.getString("MOVIE_POSTER_PATH"))
					    .theaterName(rs.getString("THEATER_NAME"))
					    .theaterNumber(rs.getString("THEATER_NUMBER"))
					    .screeningDate(rs.getDate("SCREENING_DATE"))
					    .screeningTime(rs.getString("SCREENING_TIME"))
					    .reviewNumber(rs.getInt("REVIEW_NUMBER"))
					    .reviewScore(rs.getInt("REVIEW_SCORE"))
					    .reviewContent(rs.getString("REVIEW_CONTENT"))
					    .reviewInputDate((rs.getDate("REVIEW_INPUT_DATE") != null) ? rs.getDate("REVIEW_INPUT_DATE").toString() : null)
					    .build();
				
				
				
				list.add(rVO);
			}
		} finally {
			dbcon.dbClose(rs, pstmt, con);
		}

		return list;
	}//selectUserReservation	
}