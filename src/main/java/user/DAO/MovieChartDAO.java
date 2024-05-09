package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.MovieVO;
import util.DbConnection;

public class MovieChartDAO {	
	
	 // -------- Singleton start---------
	  
	private static MovieChartDAO mcDAO;
	
	private MovieChartDAO() {
	
	}
	
	public static MovieChartDAO getInstance() {
		if(mcDAO == null) {
			mcDAO = new MovieChartDAO();
		}
		return mcDAO;
	}//getInstance
	//--------Singleton end-----------
	
	/**
	 * 계시물 상단 카테고리 구분 메서드
	 * 자주찾는 질문 / 공지사항으로 나눔
	 * 
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public List<MovieVO> selectMovieList() throws SQLException {
		List<MovieVO> mVOList = new ArrayList<MovieVO>();
		MovieVO mVO = null;
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
			StringBuilder sbQueryString = new StringBuilder();
			sbQueryString.append("SELECT M.MOVIE_CODE, M.MOVIE_TITLE, M.MOVIE_RELEASE_DATE, M.MOVIE_POSTER_PATH, M.MOVIE_RATING, ");
			sbQueryString.append("ROUND(NVL(SUM(R.review_score) / NULLIF(COUNT(R.REVIEW_NUMBER), 0), 0), 2) AS AVG_REVIEW ");
			sbQueryString.append("FROM MOVIE M ");
			sbQueryString.append("LEFT JOIN REVIEW R ON M.MOVIE_CODE = R.MOVIE_CODE ");
			sbQueryString.append("GROUP BY M.MOVIE_CODE, M.MOVIE_TITLE, M.MOVIE_RELEASE_DATE, M.MOVIE_POSTER_PATH, M.MOVIE_RATING ");
			sbQueryString.append("ORDER BY AVG_REVIEW DESC, M.MOVIE_RELEASE_DATE DESC");


			String selectQuery = sbQueryString.toString();
			pstmt = con.prepareStatement(selectQuery);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				mVO = null;
				mVO = MovieVO.builder()
						.movieCode(rs.getString("MOVIE_CODE"))
						.movieTitle(rs.getString("MOVIE_TITLE"))
						.movieReleaseDate(rs.getDate("MOVIE_RELEASE_DATE").toString())
                        .moviePosterPath(rs.getString("MOVIE_POSTER_PATH"))
                        .movieRating(rs.getString("MOVIE_RATING"))
                        .movieScore(rs.getString("AVG_REVIEW"))
                        .build();
				

				mVOList.add(mVO);
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return mVOList;
	
}
}
