package admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.BoardVO;
import admin.SearchVO;
import util.DbConnection;

public class BoardDAO {
	private static BoardDAO bDAO;
	
	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BoardDAO();
		} // end if
		return bDAO;
	} // getInstance
	
	/**
	 * 공지사항의 총 게시물 수 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int selectNoticeTotalCount(SearchVO sVO) throws SQLException {
		int totalCnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt.append("select count(*) cnt ")
			.append("from board b ")
			.append("inner join category c ")
			.append("on c.category_number = b.category_number ")
			.append("where c.category_type_flag = 'N' ");
			
			// 카테고리 혹은 검색 키워드가 존재하면 해당하는 레코드 수만 검색
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				selectTotalCnt.append(" and c.category_name = ? ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				selectTotalCnt.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				selectTotalCnt.append(" and c.category_name = ? ")
				.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && "".equals(sVO.getKeyword())) { // 둘 다 안 넣었을 때
				// 전체 검색!
			} // end else
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				pstmt.setString(1, sVO.getField());
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				pstmt.setString(1, sVO.getKeyword());
			}  else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				pstmt.setString(1, sVO.getField());
				pstmt.setString(2, sVO.getKeyword());
			} // end else
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return totalCnt;
	} // selectTotalCount
	
	/**
	 * 공지사항의 카테고리명, 카테고리번호 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectNoticeCategory() throws SQLException {
		List<BoardVO> categories = new ArrayList<BoardVO>();
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectCategory = new StringBuilder();
			selectCategory.append("select category_name, category_number ")
			.append("from category ")
			.append("where category_type_flag = 'N' ")
			.append("order by category_number");
			
			pstmt = con.prepareStatement(selectCategory.toString());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bVO = BoardVO.builder()
					.categoryName(rs.getString("category_name"))
					.categoryNumber(rs.getInt("category_number"))
					.build();
				categories.add(bVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return categories;
	} // selectNoticeCategory
	
	/**
	 * 공지사항 게시물 리스트 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectNoticeBoard(SearchVO sVO) throws SQLException {
		List<BoardVO> boards = new ArrayList<BoardVO>();
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectBoard = new StringBuilder();
			selectBoard.append("select board_number, board_title, board_content, board_input_date, board_views, admin_id, category_name, rnum ")
			.append("from( ")
			.append("	select b.board_number, b.board_title, b.board_content, b.board_input_date, b.board_views, b.admin_id, c.category_name, ")
			.append("	row_number() over(order by b.board_input_date desc) rnum ")
			.append("	from board b ")
			.append("	inner join category c ")
			.append("	on c.category_number = b.category_number ")
			.append("	where c.category_type_flag = 'N' ");
			
			// Dynamic Query
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				selectBoard.append(" and c.category_name = ? ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				selectBoard.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				selectBoard.append(" and c.category_name = ? ")
				.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && "".equals(sVO.getKeyword())) { // 둘 다 안 넣었을 때
			} // end else
			
			selectBoard.append(") ")
			.append("where rnum between ? and ? ");
			
			pstmt = con.prepareStatement(selectBoard.toString());
			int bindIndex = 0;
			
			// Dynamic Query
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				pstmt.setString(++bindIndex, sVO.getField());
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				pstmt.setString(++bindIndex, sVO.getKeyword());
			}  else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				pstmt.setString(++bindIndex, sVO.getField());
				pstmt.setString(++bindIndex, sVO.getKeyword());
			} // end else
			
			pstmt.setInt(++bindIndex, sVO.getStartNum());
			pstmt.setInt(++bindIndex, sVO.getEndNum());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bVO = BoardVO.builder()
						.rnum(rs.getInt("rnum"))
						.boardNumber(rs.getInt("board_number"))
						.boardTitle(rs.getString("board_title"))
						.boardContent(rs.getString("board_content"))
						.boardDate(rs.getDate("board_input_date"))
						.boardViews(rs.getInt("board_views"))
						.categoryName(rs.getString("category_name"))
						.build();
				boards.add(bVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return boards;
	} // selectNoticeBoard
	
	/**
	 * 게시판 번호 중 가장 마지막 번호 구하기
	 * @return
	 * @throws SQLException
	 */
	public int selectMaxBoardNumber() throws SQLException {
		int maxBoardNumber = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String selectMaxBoardNumber = "select max(board_number) max_board_number from board";
			
			pstmt = con.prepareStatement(selectMaxBoardNumber);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxBoardNumber = rs.getInt("max_board_number");
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return maxBoardNumber;
	} // selectMaxBoardNumber
	
	/**
	 * 선택한 게시물의 상세내용 가져오기
	 * @param boardNumber
	 * @return
	 * @throws SQLException
	 */
	public BoardVO selectOneBoard(int boardNumber) throws SQLException {
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectOneBoard = new StringBuilder();
			selectOneBoard.append("select b.board_title, b.board_content, b.board_input_date, b.board_views, b.admin_id, b.category_number, c.category_name ")
			.append("from board b ")
			.append("inner join category c ")
			.append("on c.category_number = b.category_number ")
			.append("where b.board_number = ?");
			
			pstmt = con.prepareStatement(selectOneBoard.toString());
			
			pstmt.setInt(1, boardNumber);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bVO = BoardVO.builder()
					.boardNumber(boardNumber)
					.boardTitle(rs.getString("board_title"))
					.boardContent(rs.getString("board_content"))
					.boardDate(rs.getDate("board_input_date"))
					.boardViews(rs.getInt("board_views"))
					.adminId(rs.getString("admin_id"))
					.categoryNumber(rs.getInt("category_number"))
					.categoryName(rs.getString("category_name"))
					.build();
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return bVO;
	} // selectOneBoard
	
	/**
	 * 공지사항 게시물 추가
	 * @param bVO
	 * @throws SQLException
	 */
	public void insertNotice(BoardVO bVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder insertNotice = new StringBuilder();
			insertNotice.append("insert into board ")
			.append("(board_number, board_title, board_content, admin_id, category_number) ")
			.append("values(?, ?, ?, ?, ?)");
			
			pstmt = con.prepareStatement(insertNotice.toString());
			
			pstmt.setInt(1, bVO.getBoardNumber());
			pstmt.setString(2, bVO.getBoardTitle());
			pstmt.setString(3, bVO.getBoardContent());
			pstmt.setString(4, bVO.getAdminId());
			pstmt.setInt(5, bVO.getCategoryNumber());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	} // insertBoard
	
	/**
	 * 게시물 클릭 시 조회수 +1
	 * @param boardView
	 * @throws SQLException
	 */
	public void updateBoardView(BoardVO bVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String updateBoardView = "update board set board_views = ? where board_number = ?";
			
			pstmt = con.prepareStatement(updateBoardView);
			
			pstmt.setInt(1, bVO.getBoardViews());
			pstmt.setInt(2, bVO.getBoardNumber());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	} // insertBoardView
	
	/**
	 * 게시물 삭제
	 * @param boardNumber
	 * @throws SQLException
	 */
	public void deleteBoard(int boardNumber) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String deleteBoard = "delete from board where board_number = ?";
			
			pstmt = con.prepareStatement(deleteBoard);
			
			pstmt.setInt(1, boardNumber);
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	} // deleteBoard
	
	/**
	 * 게시물 수정
	 * @param bVO
	 * @throws SQLException
	 */
	public void updateBoard(BoardVO bVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder updateBoard = new StringBuilder();
			updateBoard.append("update board ")
			.append("set board_title = ?, board_content = ?, admin_id = ?, category_number = ? ")
			.append("where board_number = ? ");
			
			pstmt = con.prepareStatement(updateBoard.toString());
			
			pstmt.setString(1, bVO.getBoardTitle());
			pstmt.setString(2, bVO.getBoardContent());
			pstmt.setString(3, bVO.getAdminId());
			pstmt.setInt(4, bVO.getCategoryNumber());
			pstmt.setInt(5, bVO.getBoardNumber());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	} // updateBoard
	
	
	
	
	/**
	 * index.jsp 하단 공지시항 글 가져오는 메서드
	 * 
	 * @param boardNumber
	 * @return
	 * @throws SQLException
	 */
	public BoardVO selectOneNotice() throws SQLException {
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectOneBoard = new StringBuilder();

			selectOneBoard.append("SELECT BOARD_NUMBER, BOARD_TITLE ")
	        .append("FROM (SELECT b.BOARD_NUMBER, b.BOARD_TITLE, ROW_NUMBER() OVER(ORDER BY BOARD_NUMBER DESC) rank ")
	        .append("FROM BOARD b ")
	        .append("INNER JOIN CATEGORY c ON b.CATEGORY_NUMBER = c.CATEGORY_NUMBER ")
	        .append("WHERE c.CATEGORY_TYPE_FLAG = 'N') ")
	        .append("WHERE rank = 1");
			
			pstmt = con.prepareStatement(selectOneBoard.toString());

			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bVO = BoardVO.builder()
					.boardNumber(rs.getInt("BOARD_NUMBER"))
					.boardTitle(rs.getString("BOARD_TITLE"))
					.build();
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return bVO;
	} // selectOneNotice
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////자주찾는 질문///////////////////////////////////////
	
	
	/**
	 * 자주찾는질문의 카테고리명, 카테고리번호 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectQuestionCategory() throws SQLException {
		List<BoardVO> categories = new ArrayList<BoardVO>();
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectCategory = new StringBuilder();
			selectCategory.append("select category_name, category_number ")
			.append("from category ")
			.append("where category_type_flag = 'Q' ")
			.append("order by category_number");
			
			pstmt = con.prepareStatement(selectCategory.toString());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bVO = BoardVO.builder()
					.categoryName(rs.getString("category_name"))
					.categoryNumber(rs.getInt("category_number"))
					.build();
				categories.add(bVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return categories;
	} // selectNoticeCategory
	
	/**
	 * 자주찾는질문 게시물 리스트 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectQuestionBoard(SearchVO sVO) throws SQLException {
		List<BoardVO> boards = new ArrayList<BoardVO>();
		BoardVO bVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectBoard = new StringBuilder();
			selectBoard.append("select board_number, board_title, board_content, board_input_date, board_views, admin_id, category_name, rnum ")
			.append("from( ")
			.append("	select b.board_number, b.board_title, b.board_content, b.board_input_date, b.board_views, b.admin_id, c.category_name, ")
			.append("	row_number() over(order by b.board_input_date desc) rnum ")
			.append("	from board b ")
			.append("	inner join category c ")
			.append("	on c.category_number = b.category_number ")
			.append("	where c.category_type_flag = 'Q' ");
			
			// Dynamic Query
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				selectBoard.append(" and c.category_name = ? ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				selectBoard.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				selectBoard.append(" and c.category_name = ? ")
				.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && "".equals(sVO.getKeyword())) { // 둘 다 안 넣었을 때
			} // end else
			
			selectBoard.append(") ")
			.append("where rnum between ? and ? ");
			
			pstmt = con.prepareStatement(selectBoard.toString());
			int bindIndex = 0;
			
			// Dynamic Query
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				pstmt.setString(++bindIndex, sVO.getField());
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				pstmt.setString(++bindIndex, sVO.getKeyword());
			}  else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				pstmt.setString(++bindIndex, sVO.getField());
				pstmt.setString(++bindIndex, sVO.getKeyword());
			} // end else
			
			pstmt.setInt(++bindIndex, sVO.getStartNum());
			pstmt.setInt(++bindIndex, sVO.getEndNum());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bVO = BoardVO.builder()
						.rnum(rs.getInt("rnum"))
						.boardNumber(rs.getInt("board_number"))
						.boardTitle(rs.getString("board_title"))
						.boardContent(rs.getString("board_content"))
						.boardDate(rs.getDate("board_input_date"))
						.boardViews(rs.getInt("board_views"))
						.categoryName(rs.getString("category_name"))
						.build();
				boards.add(bVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return boards;
	} // selectNoticeBoard
	
	/**
	 * 자주찾는질문 총 게시물 수 구하기
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int selectQuestionTotalCount(SearchVO sVO) throws SQLException {
		int totalCnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt.append("select count(*) cnt ")
			.append("from board b ")
			.append("inner join category c ")
			.append("on c.category_number = b.category_number ")
			.append("where c.category_type_flag = 'Q' ");
			
			// 카테고리 혹은 검색 키워드가 존재하면 해당하는 레코드 수만 검색
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				selectTotalCnt.append(" and c.category_name = ? ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				selectTotalCnt.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				selectTotalCnt.append(" and c.category_name = ? ")
				.append(" and b.board_title like '%'||?||'%' ");
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && "".equals(sVO.getKeyword())) { // 둘 다 안 넣었을 때
				// 전체 검색!
			} // end else
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() == null) { // 카테고리만 넣었을 때
				pstmt.setString(1, sVO.getField());
			} else if(sVO.getField() != null && sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 키워드만 넣었을 때
				pstmt.setString(1, sVO.getKeyword());
			}  else if(sVO.getField() != null && !sVO.getField().equals("NA") && sVO.getKeyword() != null && !sVO.getKeyword().isBlank()) { // 둘 다 넣었을 때
				pstmt.setString(1, sVO.getField());
				pstmt.setString(2, sVO.getKeyword());
			} // end else
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return totalCnt;
	} // selectTotalCount
	
	/**
	 * 자주찾는질문 게시물 추가
	 * @param bVO
	 * @throws SQLException
	 */
	public void insertQuestion(BoardVO bVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder insertQuestion = new StringBuilder();
			insertQuestion.append("insert into board ")
			.append("(board_number, board_title, board_content, admin_id, category_number) ")
			.append("values(?, ?, ?, ?, ?)");
			
			pstmt = con.prepareStatement(insertQuestion.toString());
			
			pstmt.setInt(1, bVO.getBoardNumber());
			pstmt.setString(2, bVO.getBoardTitle());
			pstmt.setString(3, bVO.getBoardContent());
			pstmt.setString(4, bVO.getAdminId());
			pstmt.setInt(5, bVO.getCategoryNumber());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	} // insertBoard
	
	
	
	
} // class