package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import VO.BoardVO;
import user.DAO.BoardDAO;

/**
 * Servlet implementation class BoardCategoryServlet
 */
@WebServlet("/BoardCategoryServlet")
public class BoardCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String FAQS = request.getParameter("FAQS");
		String startNum = request.getParameter("startNum");
		String endNum = request.getParameter("endNum");
		String category = request.getParameter("category");
		String currentPage  = request.getParameter("currentPage");
		
		int intCurrentPage = 0;
		int intStartNum = 0;
		int intEndNum = 0;
		try {
			intStartNum = Integer.parseInt(startNum);
			intEndNum = Integer.parseInt(endNum);
			intCurrentPage = Integer.parseInt(currentPage);
			
		}catch (NumberFormatException e) {
			
		}
		String selectCategoryJson = null;
		try {
			selectCategoryJson = getJson(intStartNum, intEndNum, FAQS, category, intCurrentPage);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	@SuppressWarnings("unchecked")
	public String getJson(int startNum,int endNum,String FAQS,String category,int currentPage) throws SQLException {
		
		BoardDAO bDAO = BoardDAO.getInstance();

		List<BoardVO> boardList = null;
		int totalBoardCount = 0;
		
		if(category== null || category.equals("")) {
			boardList = bDAO.selectBoard(startNum, endNum, FAQS);
			totalBoardCount = bDAO.selectTotalCount(FAQS);
		}
		else{
			boardList = bDAO.selectOneCategory(startNum, endNum, FAQS, category);	
			totalBoardCount = bDAO.selectCategoryCount(FAQS, category);
		}

        int totalPage = (int) Math.ceil((double) totalBoardCount / (endNum - startNum + 1));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = "";
        JSONObject jsonObj=new JSONObject();
		
		JSONArray jsonArr=new JSONArray();
		
		JSONObject jsonTemp=null;
		try {
		for (int i = 0; i < boardList.size(); i++) {
			BoardVO board = boardList.get(i);
			date = sdf.format(board.getBoardInputDate());
			jsonTemp=new JSONObject();
			jsonTemp.put("categoryName", board.getCategoryName());
			jsonTemp.put("boardNumber",board.getBoardNumber());
			jsonTemp.put("boardTitle", board.getBoardTitle());
			jsonTemp.put("boardContent", board.getBoardContent());
			jsonTemp.put("boardAdmin", board.getAdminId());
			jsonTemp.put("boardInputDate", date);
			jsonTemp.put("rnum", board.getRnum());
			jsonTemp.put("boardViews", board.getBoardViews());
			
			jsonArr.add(jsonTemp);
		}
		
		jsonObj.put("status", "SUCCESS");
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("Categorycount", totalBoardCount);
		jsonObj.put("result", jsonArr);
		jsonObj.put("FAQS", FAQS);
		jsonObj.put("startNum", startNum);
		jsonObj.put("endNum", endNum);
		jsonObj.put("currentPage", currentPage);
		
		jsonObj.put("category", category);
		
		}catch(Exception e) {
			e.printStackTrace();
			jsonObj.put("status", "FAIL");
		}
		
		return jsonObj.toJSONString();
	}

}
