package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.ScreeningVO.ScreeningVOBuilder;
import util.DbConnection;


public class ScreeningDAO1 {
	private static ScreeningDAO1 sDAO;
	public static ScreeningDAO1 getInstance() {
		if (sDAO == null) {
			sDAO = new ScreeningDAO1();
		} // end if
		return sDAO;
	}  
	
	public List<ScreeningVO> selectScreeningList() throws SQLException{
	    List<ScreeningVO> listScreeningVO = new ArrayList<ScreeningVO>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
  	        con = dbCon.getConnection(id, pass);
 
	        String selectDeptProf =   "SELECT"
	        					+ "    S.screening_code,"
				        		+ "    S.theater_name,"
				        		+ "    S.theater_number,"
				        		+ "    M.movie_title,"
				        		+ "    S.screening_date,"
				        		+ "    ST.screening_time"
				        		+ "	   FROM"
				        		+ "    screening S"
				        		+ "    INNER JOIN movie M ON S.movie_code = M.movie_code"
				        		+ "    INNER JOIN screening_time ST ON S.screening_round = ST.screening_round";
	        pstmt = con.prepareStatement(selectDeptProf);

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            
	             ScreeningVOBuilder srVOBuilder = ScreeningVO.builder();
	             ScreeningVO srVO = srVOBuilder
	            		 .screeningCode(rs.getString("Screening_Code"))
	            		 .theaterName(rs.getString("THEATER_NAME"))
	            		 .theaterNumber(rs.getString("THEATER_NUMBER"))
	            		 .movieName(rs.getString("MOVIE_TITLE"))
	            		 .screeningDate(rs.getString("SCREENING_DATE"))
	            		 .screeningRound(rs.getString("SCREENING_TIME"))
	            		 .build();

	            listScreeningVO.add(srVO); // 리스트에 추가
	        } // end while
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    } // end finally

	    return listScreeningVO;
	}
	
	public List<ScreeningVO> searchScreening(String theater, String screeningRoom, String date) throws SQLException {
	    List<ScreeningVO> listScreeningVO = new ArrayList<>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectScreening = "SELECT S.screening_Code, S.theater_name, S.theater_number, M.movie_title, S.screening_date, ST.screening_time "
	                                + "FROM screening S "
	                                + "INNER JOIN movie M ON S.movie_code = M.movie_code "
	                                + "INNER JOIN screening_time ST ON S.screening_round = ST.screening_round "
	                                + "WHERE 1=1";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	            selectScreening += " AND S.theater_name = ?";
	        }

	        // screeningRoom 조건 추가
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            selectScreening += " AND S.theater_number = ?";
	        }

	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	            selectScreening += " AND S.screening_date = ?";
	        }

	        pstmt = con.prepareStatement(selectScreening);

	        // 검색 조건에 맞게 파라미터 설정
	        int parameterIndex = 1;
	        if (theater != null && !theater.isEmpty()) {
	            pstmt.setString(parameterIndex++, theater);
	        }
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            pstmt.setString(parameterIndex++, screeningRoom);
	        }
	        if (date != null && !date.isEmpty()) {
	            pstmt.setString(parameterIndex++, date);
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            ScreeningVOBuilder srVOBuilder = ScreeningVO.builder();
	            ScreeningVO srVO = srVOBuilder
	            				.screeningCode(rs.getString("SCREENING_CODE"))
	                            .theaterName(rs.getString("THEATER_NAME"))
	                            .theaterNumber(rs.getString("THEATER_NUMBER"))
	                            .movieName(rs.getString("MOVIE_TITLE"))
	                            .screeningDate(rs.getString("SCREENING_DATE"))
	                            .screeningRound(rs.getString("SCREENING_TIME"))
	                            .build();

	            listScreeningVO.add(srVO); // 리스트에 추가
	        }
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }

	    return listScreeningVO;
	}


	

	
	public List<String> selectTheaterAll() throws SQLException {
	    List<String> listTheaterList = new ArrayList<String>();
	    DbConnection dbCon = DbConnection.getInstance();

	    try (Connection con = dbCon.getConnection("son", "jimin");
	         PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT THEATER_NAME FROM THEATER");
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {
	            listTheaterList.add(rs.getString("THEATER_NAME"));
	        }
	    }

	    return listTheaterList;
	}
	
	public void insertScreening(String theaterName, String screeningRoom, String movieName, String screeningDate, String screeningRound) throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        String insertQuery = "INSERT INTO screening (screening_code, theater_name, theater_number, movie_code, screening_date, screening_round, ticket_price) VALUES (?, ?, ?, ?, ?, ?, 10000)";
	        pstmt = con.prepareStatement(insertQuery);

	        // 상영 코드 생성
	        String screeningCode = getScreeningCode();
	        String movieCode = getMovieCode(movieName);
	        System.out.println("insertScreening메서드 실행중 screeningCode : " + screeningCode+" movieCode : "+movieCode + "theaterName : " +theaterName);

	        pstmt.setString(1, screeningCode); // 상영 코드 설정
	        pstmt.setString(2, theaterName);
	        pstmt.setString(3, screeningRoom);
	        pstmt.setString(4, movieCode);
	        pstmt.setString(5, screeningDate);
	        pstmt.setString(6, screeningRound);

	        pstmt.executeUpdate();
	    } finally {
	        dbCon.dbClose(null, pstmt, con);
	    }
	}


	private String getMovieCode(String movieName) throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String movieCode = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        String selectQuery = "SELECT movie_code FROM movie WHERE movie_title = ?";
	        pstmt = con.prepareStatement(selectQuery);
	        pstmt.setString(1, movieName);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            movieCode = rs.getString("movie_code");
	        }
	        System.out.println("영화등록 코드 : " + movieCode);
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }

	    return movieCode;
	}
	
	private String getScreeningCode() throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String screeningCode = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        // 가장 마지막으로 사용된 상영 코드 조회
	        String selectQuery = "SELECT MAX(SCREENING_CODE) AS LAST_CODE FROM SCREENING";
	        pstmt = con.prepareStatement(selectQuery);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // 가장 마지막으로 사용된 상영 코드를 가져옴
	            String lastCode = rs.getString("LAST_CODE");
	            // 마지막으로 사용된 상영 코드에서 숫자 부분만 추출하여 증가시킴
	            int lastNumber = Integer.parseInt(lastCode.substring(3)) + 1;
	            // 새로운 상영 코드 생성
	            screeningCode = String.format("SCR%05d", lastNumber); // 예: SCR00035
	        } else {
	            // 데이터베이스에 상영 코드가 없는 경우
	            // 새로운 상영 코드를 1부터 시작하도록 설정
	            screeningCode = "SCR00001";
	        }
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }

	    return screeningCode;
	}
	
	public void updateScreening(ScreeningVO sVO) throws SQLException {
	    DbConnection dbCon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);

	        // 상영 정보를 업데이트하기 위한 SQL 쿼리
	        String updateQuery = "UPDATE screening SET theater_name = ?, screening_date = ?, screening_round = ?, theater_number = ? WHERE screening_Code=?";

	        pstmt = con.prepareStatement(updateQuery);

	        // 영화 코드 조회
	        String movieCode = getMovieCode(sVO.getMovieName());

	        pstmt.setString(1, sVO.getTheaterName()); // 상영관 정보 설정
	        pstmt.setString(2, sVO.getScreeningDate()); // 상영 날짜 설정
	        pstmt.setString(3, sVO.getScreeningRound()); // 상영 회차 설정
	        pstmt.setString(4, sVO.getTheaterNumber()); // 상영 극장 이름 설정
	        pstmt.setString(5, sVO.getScreeningCode()); // 상영 극장 이름 설정

	        pstmt.executeUpdate();
	    } finally {
	    	dbCon.dbClose(null, pstmt, con);
	    }
	}
	public void deleteScreening(String screeningCode) throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			String id = "son";
			String pass = "jimin";
			con = dbCon.getConnection(id, pass);
			
			// 상영 정보를 업데이트하기 위한 SQL 쿼리
			String updateQuery = "DELETE FROM screening	"
							   + "WHERE screening_Code = ?";
			
			pstmt = con.prepareStatement(updateQuery);
			
			pstmt.setString(1, screeningCode);
			
			pstmt.executeQuery();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		}
	}
	    
	    public String selectScreeningCode(ScreeningVO sVO) throws SQLException {
	    	DbConnection dbCon = DbConnection.getInstance();
	    	Connection con = null;
	    	ResultSet rs = null;
	    	String screeningCode = null;
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	    		String id = "son";
	    		String pass = "jimin";
	    		con = dbCon.getConnection(id, pass);
	    		
	    		// 상영 정보를 업데이트하기 위한 SQL 쿼리
	    		String selectQuery = "select screening_Code from SCREENING WHERE theater_name = ? AND theater_number = ? AND movie_code = ? AND SCREENING_ROUND=? AND SCREENING_DATE=?";
	    		
	    		pstmt = con.prepareStatement(selectQuery);
	    		
	    		// 영화 코드 조회
	    		String movieCode = getMovieCode(sVO.getMovieName());
	    		pstmt.setString(1, sVO.getTheaterName()); // 상영 극장 이름 설정
	    		pstmt.setString(2, sVO.getTheaterNumber()); // 상영관 정보 설정
	    		pstmt.setString(3, movieCode); // 영화 코드 설정
	    		pstmt.setString(4, sVO.getScreeningRound()); // 상영 회차 설정
	    		pstmt.setString(5, sVO.getScreeningDate()); // 상영 날짜 설정
	    		
	    		System.out.println("theaterName : " + sVO.getTheaterName() + "theaterNumber : " + sVO.getTheaterNumber() + "movieCode : " + movieCode + "ScreeningRound : " + sVO.getScreeningRound() + "ScreeningDate : " + sVO.getScreeningDate());
	    		rs = pstmt.executeQuery();
	    		if(rs.next()) {
	    			screeningCode = rs.getString("Screening_Code");
	    		}else {
					return "해당 컬럼 없음";
				}
	    	} finally {
	    		dbCon.dbClose(null, pstmt, con);
	    	}
			return screeningCode;
	}


	
	
}
