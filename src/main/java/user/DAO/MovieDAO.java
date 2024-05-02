package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.MovieVO;
import util.DbConnection;



public class MovieDAO {
	private static MovieDAO mDAO;
	public static MovieDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MovieDAO();
		} // end if
		return mDAO;
	}
	
	/**
	 * index.jsp페이지에서 보여줄 무비 리스트
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
			String selectQuery = "SELECT  MOVIE_CODE, MOVIE_TITLE, MOVIE_RELEASE_DATE, MOVIE_RATING, MOVIE_POSTER_PATH FROM MOVIE";
			pstmt = con.prepareStatement(selectQuery);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				mVO = null;
				mVO = MovieVO.builder()
						.code(rs.getString("MOVIE_CODE"))
                        .posterPath(rs.getString("MOVIE_POSTER_PATH"))
                        .title(rs.getString("MOVIE_TITLE"))
                        .rating(rs.getString("MOVIE_RATING"))
                        .releaseDate(rs.getDate("MOVIE_RELEASE_DATE"))
                        .build();
				System.out.println(mVO.getCode());
				mVOList.add(mVO);

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return mVOList;
	}// AdminLogin
}

