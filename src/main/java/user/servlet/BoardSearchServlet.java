package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.BoardVO;
import user.DAO.BoardDAO;


@WebServlet("/BoardSearchServlet")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String FAQS = request.getParameter("FAQS");
		String startNum = request.getParameter("startNum");
		String endNum = request.getParameter("endNum");
		
		int intStartNum = 0;
		int intEndNum = 0;
		try {
			intStartNum = Integer.parseInt(startNum);
			intEndNum = Integer.parseInt(endNum);
			
		}catch (NumberFormatException e) {
			
		}
		String selectCategoryJson = null;
		try {
			selectCategoryJson = getJson(intStartNum, intEndNum, FAQS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.getWriter().print(selectCategoryJson);
	}
	
	/**
	 * 선택 카테고리 정보를 json에 담는 메서드
	 * @param startNum
	 * @param endNum
	 * @param FAQS
	 * @param category
	 * @return
	 * @throws SQLException
	 */
	public String getJson(int startNum,int endNum,String FAQS) throws SQLException {
		
		if(FAQS == null) FAQS="";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BoardDAO bDAO = BoardDAO.getInstance();

		
		List<BoardVO> boardList = bDAO.selectBoard(startNum, endNum, FAQS);
		for (int i = 0; i < boardList.size(); i++) {
			BoardVO board = boardList.get(i);
			result.append("{");
			result.append("\"categoryName\":\"").append(board.getCategoryName()).append("\",");
			result.append("\"boardNumber\":\"").append(board.getBoardNumber()).append("\",");
			result.append("\"boardTitle\":\"").append(board.getBoardTitle()).append("\",");
			result.append("\"boardContent\":\"").append(board.getBoardContent()).append("\",");
			result.append("\"boardInputDate\":\"").append(board.getBoardInputDate()).append("\",");
			result.append("\"adminId\":\"").append(board.getAdminId()).append("\",");
			result.append("\"rnum\":").append(board.getRnum()).append(",");
			result.append("\"boardViews\":").append(board.getBoardViews());
			result.append("}");
			// 마지막 요소가 아니면 쉼표를 추가
			if (i < boardList.size() - 1) {
				result.append(",");
			}
		}
		result.append("]}");
		return result.toString();
	}
}
