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
	        String selectScreening = "SELECT S.theater_name, S.theater_number, M.movie_title, S.screening_date, ST.screening_time "
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


	

	
//	public List<ScreeningVO> selectTheater(ScreeningVO sVO){
//		List<ScreeningVO> listProfVO = new ArrayList<ScreeningVO>();
//		ScreeningVO pVO = null;
//		DbConnection dbCon = DbConnection.getInstance();
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			String id = "son";
//			String pass = "jimin";
//			
//			con = dbCon.getConnection(id, pass);
//			
//			String selectDeptProf = "select * from screening";
//			pstmt = con.prepareStatement(selectDeptProf);
//			pstmt.setInt(1, dept_code);
//			
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				pVO = new ProfVO(rs.getInt("prof_number"), rs.getString("prof_name"));
//				listProfVO.add(pVO);
//			} // end while
//		} finally {
//			dbCon.dbClose(rs, pstmt, con);
//		} // end finally
//		
//		return listProfVO;
//	}
	
	
}
