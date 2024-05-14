package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.AdminMovieVO;
import VO.AdminMovieVO.AdminMovieVOBuilder;
import VO.MovieVO;
import VO.MovieVO.MovieVOBuilder;
import util.DbConnection;



public class AdminMovieDAO {
	private static AdminMovieDAO mDAO;
	public static AdminMovieDAO getInstance() {
		if (mDAO == null) {
			mDAO = new AdminMovieDAO();
		} // end if
		return mDAO;
	}
	
	public List<AdminMovieVO> selectMovieList() throws SQLException {
		List<AdminMovieVO> mVOList = new ArrayList<AdminMovieVO>();
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
			String selectQuery = "SELECT  * FROM MOVIE ";
			pstmt = con.prepareStatement(selectQuery);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				AdminMovieVOBuilder movieVOBuilder = AdminMovieVO.builder();
	            AdminMovieVO movieVO = movieVOBuilder
	                            .movieCode(rs.getString("movie_code"))
	                            .movieTitle(rs.getString("movie_title"))
	                            .movieGenre(rs.getString("movie_genre"))
	                            .movieDistributor(rs.getString("movie_distributor"))
	                            .movieDirector(rs.getString("movie_director"))
	                            .movieRunningTime(rs.getString("movie_running_time"))
	                            .movieMainActor(rs.getString("movie_main_actor"))
	                            .movieSubActor(rs.getString("movie_sub_actor"))
	                            .movieDescription(rs.getString("movie_description"))
	                            .moviePosterPath(rs.getString("movie_poster_path"))
	                            .movieReleaseDate(rs.getDate("movie_release_date"))
	                            .movieRating(rs.getString("movie_rating"))
	                            .movieScreeningStatus(rs.getString("movie_screening_status"))
	                            .build();
				
				mVOList.add(movieVO);

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return mVOList;
	}// AdminLogin
	
	
	
	
	public List<String> movieNameList() throws SQLException {
		List<String> movieList = new ArrayList<String>();
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
	
	public List<AdminMovieVO> searchMovies(String searchType, String searchText) throws SQLException {
	    List<AdminMovieVO> listMovieVO = new ArrayList<>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectMovies = "SELECT * FROM movie WHERE 1=1";

	        // 검색 조건에 따라 동적으로 쿼리 조건을 추가
	        if (searchType != null && searchText != null && !searchText.isEmpty()) {
	            if (searchType.equals("movie_title")) {
	                selectMovies += " AND movie_title LIKE ?";
	            } else if (searchType.equals("movie_genre")) {
	                selectMovies += " AND movie_genre LIKE ?";
	            }
	        }

	        pstmt = con.prepareStatement(selectMovies);

	        // 검색 조건에 맞게 파라미터 설정
	        if (searchType != null && searchText != null && !searchText.isEmpty()) {
	            pstmt.setString(1, "%" + searchText + "%");
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            AdminMovieVOBuilder movieVOBuilder = AdminMovieVO.builder();
	            AdminMovieVO movieVO = movieVOBuilder
	                            .movieCode(rs.getString("movie_code"))
	                            .movieTitle(rs.getString("movie_title"))
	                            .movieGenre(rs.getString("movie_genre"))
	                            .movieDistributor(rs.getString("movie_distributor"))
	                            .movieDirector(rs.getString("movie_director"))
	                            .movieRunningTime(rs.getString("movie_running_time"))
	                            .movieMainActor(rs.getString("movie_main_actor"))
	                            .movieSubActor(rs.getString("movie_sub_actor"))
	                            .movieDescription(rs.getString("movie_description"))
	                            .moviePosterPath(rs.getString("movie_poster_path"))
	                            .movieReleaseDate(rs.getDate("movie_release_date"))
	                            .movieRating(rs.getString("movie_rating"))
	                            .movieScreeningStatus(rs.getString("movie_screening_status"))
	                            .build();

	            listMovieVO.add(movieVO); // 리스트에 추가
	        }
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }

	    return listMovieVO;
	}
	
	public void insertMovie(AdminMovieVO movieVO) throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        String insertQuery = "INSERT INTO Movie (MOVIE_CODE, MOVIE_TITLE, MOVIE_RELEASE_DATE, MOVIE_GENRE, MOVIE_RATING, MOVIE_DIRECTOR, MOVIE_DISTRIBUTOR, MOVIE_RUNNING_TIME, MOVIE_MAIN_ACTOR, MOVIE_SUB_ACTOR, MOVIE_DESCRIPTION, MOVIE_POSTER_PATH, MOVIE_SCREENING_STATUS, MOVIE_INPUT_DATE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        pstmt = con.prepareStatement(insertQuery);

	        // 상영 코드 생성
	        String movieCode = getMovieCode();
	        pstmt.setString(1, movieCode);
	        pstmt.setString(2, movieVO.getMovieTitle());
	        pstmt.setDate(3, new java.sql.Date(movieVO.getMovieReleaseDate().getTime())); // 수정
	        pstmt.setString(4, movieVO.getMovieGenre());
	        pstmt.setString(5, movieVO.getMovieRating());
	        pstmt.setString(6, movieVO.getMovieDirector());
	        pstmt.setString(7, movieVO.getMovieDistributor());
	        pstmt.setString(8, movieVO.getMovieRunningTime());
	        pstmt.setString(9, movieVO.getMovieMainActor());
	        pstmt.setString(10, movieVO.getMovieSubActor());
	        pstmt.setString(11, movieVO.getMovieDescription());
	        pstmt.setString(12, movieVO.getMoviePosterPath());
	        pstmt.setString(13, movieVO.getMovieScreeningStatus());
	        pstmt.setDate(14, new java.sql.Date(movieVO.getMovieInputDate().getTime())); // 수정

	        pstmt.executeUpdate();
	    } finally {
	        dbCon.dbClose(null, pstmt, con);
	    }
	}

	private String getMovieCode() throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String movieCode = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        // 가장 마지막으로 사용된 상영 코드 조회
	        String selectQuery = "SELECT MAX(MOVIE_CODE) AS LAST_CODE FROM MOVIE";
	        pstmt = con.prepareStatement(selectQuery);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // 가장 마지막으로 사용된 상영 코드를 가져옴
	            String lastCode = rs.getString("LAST_CODE");
	            // 마지막으로 사용된 상영 코드에서 숫자 부분만 추출하여 증가시킴
	            int lastNumber = Integer.parseInt(lastCode.substring(3)) + 1;
	            // 새로운 상영 코드 생성
	            movieCode = String.format("MOV%03d", lastNumber); // 예: SCR00035
	        } else {
	            // 데이터베이스에 상영 코드가 없는 경우
	            // 새로운 상영 코드를 1부터 시작하도록 설정
	            movieCode = "MOV001";
	        }
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }
	    return movieCode;
	}

	public void updateMovie(AdminMovieVO mVO) throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        System.out.println("updateMovie로 전달된 VO String : " + mVO.toString());
	        // 상영 정보를 업데이트하기 위한 SQL 쿼리
	        String updateQuery = "UPDATE MOVIE SET MOVIE_RELEASE_DATE=?, MOVIE_GENRE=?, MOVIE_RATING=?, MOVIE_DIRECTOR=?, MOVIE_DISTRIBUTOR=?, MOVIE_RUNNING_TIME=?, MOVIE_MAIN_ACTOR=?, MOVIE_SUB_ACTOR=?, MOVIE_DESCRIPTION=?, MOVIE_POSTER_PATH=?, MOVIE_SCREENING_STATUS=?  WHERE MOVIE_CODE=?";

	        pstmt = con.prepareStatement(updateQuery);

	        // 영화 정보 설정
	        pstmt.setDate(1, new java.sql.Date(mVO.getMovieReleaseDate().getTime()));
	        pstmt.setString(2, mVO.getMovieGenre());
	        pstmt.setString(3, mVO.getMovieRating());
	        pstmt.setString(4, mVO.getMovieDirector());
	        pstmt.setString(5, mVO.getMovieDistributor());
	        pstmt.setString(6, mVO.getMovieRunningTime());
	        pstmt.setString(7, mVO.getMovieMainActor());
	        pstmt.setString(8, mVO.getMovieSubActor());
	        pstmt.setString(9, mVO.getMovieDescription());
	        pstmt.setString(10, mVO.getMoviePosterPath());
	        pstmt.setString(11, mVO.getMovieScreeningStatus());
	        pstmt.setString(12, mVO.getMovieCode());

	        pstmt.executeUpdate();
	    } finally {
	        dbCon.dbClose(null, pstmt, con);
	    }
	}
	
	public AdminMovieVO getMovieByCode(String movieCode) throws SQLException {
		AdminMovieVO movieVO = null;
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        // 영화 코드로 해당하는 영화 정보 조회
	        String selectQuery = "SELECT * FROM MOVIE WHERE MOVIE_CODE = ?";
	        pstmt = con.prepareStatement(selectQuery);
	        pstmt.setString(1, movieCode);
	        rs = pstmt.executeQuery();

	        // 조회된 결과가 있으면 MovieVO 객체에 저장
	        if (rs.next()) {
	        	AdminMovieVOBuilder movieVOBuilder = AdminMovieVO.builder();
	            movieVO = movieVOBuilder
	                    .movieCode(rs.getString("movie_code"))
	                    .movieTitle(rs.getString("movie_title"))
	                    .movieGenre(rs.getString("movie_genre"))
	                    .movieDistributor(rs.getString("movie_distributor"))
	                    .movieDirector(rs.getString("movie_director"))
	                    .movieRunningTime(rs.getString("movie_running_time"))
	                    .movieMainActor(rs.getString("movie_main_actor"))
	                    .movieSubActor(rs.getString("movie_sub_actor"))
	                    .movieDescription(rs.getString("movie_description"))
	                    .moviePosterPath(rs.getString("movie_poster_path"))
	                    .movieReleaseDate(rs.getDate("movie_release_date"))
	                    .movieRating(rs.getString("movie_rating"))
	                    .movieScreeningStatus(rs.getString("movie_screening_status"))
	                    .build();
	        }
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }

	    return movieVO;
	}

}