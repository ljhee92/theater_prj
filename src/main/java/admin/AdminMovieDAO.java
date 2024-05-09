package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.MovieVO;
import util.DbConnection;



public class AdminMovieDAO {
	private static AdminMovieDAO mDAO;
	public static AdminMovieDAO getInstance() {
		if (mDAO == null) {
			mDAO = new AdminMovieDAO();
		} // end if
		return mDAO;
	}
	
	
	public List<String> movieNameList() throws SQLException {
		List<String> movieList = new ArrayList<String>();
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("movieNameList DAO실행");
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
			String selectQuery = "SELECT  MOVIE_TITLE	FROM MOVIE";
			pstmt = con.prepareStatement(selectQuery);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				movieList.add(rs.getString("MOVIE_TITLE"));
				
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return movieList;
	}// AdminLogin
}

