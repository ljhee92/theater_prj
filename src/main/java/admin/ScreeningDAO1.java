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
	
	public List<ScreeningVO> selectTheater(ScreeningVO sVO){
		List<ScreeningVO> listProfVO = new ArrayList<ScreeningVO>();
		ScreeningVO pVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String selectDeptProf = "select * from screening";
			pstmt = con.prepareStatement(selectDeptProf);
			pstmt.setInt(1, dept_code);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				pVO = new ProfVO(rs.getInt("prof_number"), rs.getString("prof_name"));
				listProfVO.add(pVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		
		return listProfVO;
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
