package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbcpDbConnection;

public class AdminUserManageDAO {

	private static AdminUserManageDAO aumDAO;
	
	private AdminUserManageDAO() {
		
	}//생성자
	
	public static AdminUserManageDAO getInstance() {
		if(aumDAO == null) {
			aumDAO = new AdminUserManageDAO();
		}//end if
		return aumDAO;
	}//getInstance
	
	public List<UserVO> selectAllUserList() throws SQLException {
		List<UserVO> list = new ArrayList<UserVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbcpDbConnection dbCon = DbcpDbConnection.getInstance();
		
		try {
			//1. JDNI 사용객체 생성
			//2. DBCP에서 DataSource 얻기
			//3. Connection 얻기
			con = dbCon.getCon();
			//4. 쿼리문 생성 객체 얻기(Dynamic Query)
			StringBuilder selectAll = new StringBuilder();
			selectAll.
			append("	select USER_ID, USER_NAME, USER_BIRTHDAY, USER_PHONE	")
			.append("	from users	");
			
			pstmt = con.prepareStatement(selectAll.toString());
			//5. 바인드 변수에 값 설정
			
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			UserVO uVO = null;
			while(rs.next()) {
				UserVO uVOBuilder = uVO.builder()
						.userId(rs.getString("USER_ID"))
						.userName(rs.getString("USER_NAME"))
						.userBirthday(rs.getDate("USER_BIRTHDAY"))
						.userPhone(rs.getString("USER_PHONE"))
						.build();				
				list.add(uVOBuilder);
			}//end while
			
		}finally {
			//7. 연결 끊기
			dbCon.closeCon(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllUserList
	
}//class