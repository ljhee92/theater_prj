package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.UserVO;
import user.VO.ReviewVO;
import util.DbConnection;

public class ReviewDAO {
	private static ReviewDAO rDAO;
	
	private ReviewDAO() {
		
	}//생성자
	
	public static ReviewDAO getInstance() {
		if(rDAO == null) {
			rDAO = new ReviewDAO();
		}//end if
		return rDAO;
	}//getInstance
	
	///////////////////////////////////영화별 리뷰 최신순////////////////////////////////// 
	public List<ReviewVO> selectRecentReviewList(String movieCode) throws SQLException {
		List<ReviewVO> list = new ArrayList<ReviewVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectRecentAll = new StringBuilder();
			selectRecentAll.append("	SELECT u.user_id, r.review_content, r.review_score, r.review_input_date	")
					.append("	FROM review r	")
					.append("	JOIN reservation rv ON r.reservation_number = rv.reservation_number	")
					.append("	JOIN users u ON rv.user_id = u.user_id	")
					.append("	JOIN screening s ON rv.screening_code = s.screening_code	")
					.append("	WHERE s.movie_code = ?	")
					.append("	ORDER BY r.review_input_date DESC	");

			pstmt = con.prepareStatement(selectRecentAll.toString());

			//5. 바인드 변수에 값 설정
			pstmt.setString(1, movieCode);

			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			ReviewVO rVO = null;
			while (rs.next()) {
				ReviewVO rVOBuilder = rVO.builder()
						.userId(rs.getString("user_id"))
						.reviewContent(rs.getString("review_content"))
						.reviewScore(rs.getInt("review_score"))
						.reviewInputDate(rs.getString("review_input_date"))
						.build();
				list.add(rVOBuilder);
			} // end while

		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectRecentReviewList
	
	
	///////////////////////////////////영화별 리뷰 별점순////////////////////////////////// 
	public List<ReviewVO> selectScoreReviewList(String movieCode) throws SQLException {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectScoreAll = new StringBuilder();
			selectScoreAll.append("	SELECT u.user_id, r.review_content, r.review_score, r.review_input_date	")
			.append("	FROM review r	")
			.append("	JOIN reservation rv ON r.reservation_number = rv.reservation_number	")
			.append("	JOIN users u ON rv.user_id = u.user_id	")
			.append("	JOIN screening s ON rv.screening_code = s.screening_code	")
			.append("	WHERE s.movie_code = ?	")
			.append("	ORDER BY r.review_score DESC	");
			
			pstmt = con.prepareStatement(selectScoreAll.toString());
			
			//5. 바인드 변수에 값 설정
			pstmt.setString(1, movieCode);
			
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			ReviewVO rVO = null;
			while(rs.next()) {
				ReviewVO rVOBuilder = rVO.builder()
						.userId(rs.getString("user_id"))
						.reviewContent(rs.getString("review_content"))
						.reviewScore(rs.getInt("review_score"))
						.reviewInputDate(rs.getString("review_input_date"))
						.build();				
				list.add(rVOBuilder);
			}//end while
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectScoreReviewList
	
	
	///////////////////////////////////리뷰 조회////////////////////////////////// 
	public ReviewVO selectReview(String reservationNumber) throws SQLException {
		ReviewVO rVO = new ReviewVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectReview = new StringBuilder();
			selectReview.append("	SELECT r.review_content, r.review_score, r.review_input_date,	")
			.append("	m.movie_title, m.movie_poster_path	")
			.append("	FROM review r	")
			.append("	JOIN movie m ON r.movie_code = m.movie_code	");
			
			pstmt = con.prepareStatement(selectReview.toString());
			
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			rVO = null;
			while(rs.next()) {
				ReviewVO rVOBuilder = rVO.builder()
						.reviewContent(rs.getString("review_content"))
						.reviewScore(rs.getInt("review_score"))
						.reviewInputDate(rs.getString("review_input_date"))
						.movieTitle(rs.getString("movie_title"))
						.moviePosterPath(rs.getString("movie_poster_path"))
						.build();
				rVO = rVOBuilder;
			}//end while
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return rVO;
	}//selectReview
	
	///////////////////////////////////리뷰 등록////////////////////////////////// 
	public int insertReview(ReviewVO rVO) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectReview = new StringBuilder();
			selectReview.append("	INSERT INTO review (review_number, reservation_number, review_content,	")
					.append("	review_score, review_input_date, movie_code)	")
					.append("	VALUES (review_sequence.nextval, ?, ?, ?, TO_CHAR(sysdate, 'YYYY-MM-DD'), ?");

			pstmt = con.prepareStatement(selectReview.toString());

			//5. 바인드 변수에 값 설정
			pstmt.setString(1, rVO.getReservationNumber());
			pstmt.setString(2, rVO.getReviewContent());
			pstmt.setInt(3, rVO.getReviewScore());
			pstmt.setString(4, rVO.getMovieCode());
			
			//6. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();

		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return cnt;
	}// modifyReview
	
	
	///////////////////////////////////리뷰 수정////////////////////////////////// 
	public int modifyReview(ReviewVO rVO) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectReview = new StringBuilder();
			selectReview.append("	UPDATE review	")
					.append("	SET review_content = ?, review_score = ?,	")
					.append("	review_input_date = TO_CHAR(sysdate, 'YYYY-MM-DD')	")
					.append("	WHERE reservation_number = ?	");

			pstmt = con.prepareStatement(selectReview.toString());

			//5. 바인드 변수에 값 설정
			pstmt.setString(1, rVO.getReviewContent());
			pstmt.setInt(2, rVO.getReviewScore());
			pstmt.setString(3, rVO.getReservationNumber());
			
			//6. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();

		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return cnt;
	}// modifyReview
	
	
	///////////////////////////////////리뷰 삭제////////////////////////////////// 
	public int deleteReview(String reservationNumber) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			//3. Connection 얻기
			con = dbCon.getConnection(id, pass);

			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			String deleteReview = "delete from review where reservation_number=?";

			pstmt = con.prepareStatement(deleteReview);
			
			//5. 바인드 변수에 값 설정
			pstmt.setString(1, reservationNumber);

			//6. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();

		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return cnt;
	}// deleteReview
	
}//class
