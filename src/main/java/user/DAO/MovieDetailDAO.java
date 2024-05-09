package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import VO.MovieVO;
import util.DbConnection;

public class MovieDetailDAO {

		// -------- Singleton start---------
	private static MovieDetailDAO mdDAO;

	private MovieDetailDAO() {

	}

	public static MovieDetailDAO getInstance() {
		if (mdDAO == null) {
			mdDAO = new MovieDetailDAO();
		}
		return mdDAO;
	}// getInstance
		// --------Singleton end-----------

	/**
	 * 영화 상세 조회 메서드
	 * @param movieCode
	 * @return
	 * @throws SQLException 
	 */
	public MovieVO selectMovieDetail(String movieCode) throws SQLException {
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
			String selectQuery = "SELECT * FROM MOVIE WHERE MOVIE_CODE = ?";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, movieCode);
			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				mVO = null;
				mVO = MovieVO.builder()
						.movieCode(rs.getString("MOVIE_CODE"))
						.movieTitle(rs.getString("MOVIE_TITLE"))
						.movieReleaseDate(rs.getDate("MOVIE_RELEASE_DATE").toString())
						.movieGenre(rs.getString("MOVIE_GENRE"))
						.movieRating(rs.getString("MOVIE_RATING"))
						.movieDirector(rs.getString("MOVIE_DIRECTOR"))
						.movieDistributor(rs.getString("MOVIE_DISTRIBUTOR"))
						.movieRunningTime(rs.getString("MOVIE_RUNNING_TIME"))
						.movieMainActor(rs.getString("MOVIE_MAIN_ACTOR"))						
						.movieSubActor(rs.getString("MOVIE_SUB_ACTOR"))						
						.movieDescription(rs.getString("MOVIE_DESCRIPTION"))						
						.moviePosterPath(rs.getString("MOVIE_POSTER_PATH"))
                        .movieScreeningStatus(rs.getString("MOVIE_SCREENING_STATUS"))
                        .movieInputDate(rs.getString("MOVIE_INPUT_DATE"))
                        .build();
				

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}
		return mVO;
}
}
