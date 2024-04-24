package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.ScreeningVO.ScreeningVOBuilder;
import util.DbConnection;


public class ScreeningDAO {
	private static ScreeningDAO sDAO;
	public static ScreeningDAO getInstance() {
		if (sDAO == null) {
			sDAO = new ScreeningDAO();
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

	        String selectDeptProf = "select * from screening";
	        pstmt = con.prepareStatement(selectDeptProf);

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            
	             ScreeningVOBuilder srVOBuilder = ScreeningVO.builder();
	             ScreeningVO srVO = srVOBuilder.movieName(rs.getString("THEATER_NAME")).build();
	            
	             srVOBuilder.movieName(rs.getString("THEATER_NAME"));

	            listScreeningVO.add(srVO); // 리스트에 추가
	        } // end while
	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    } // end finally

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
