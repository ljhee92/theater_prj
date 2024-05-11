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
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/BoardSearchServlet")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String searchText = request.getParameter("text");
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
		
		String selectCategoryJson = "";
		try {
			selectCategoryJson = getJson(intStartNum,intEndNum, FAQS, searchText);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.getWriter().print(selectCategoryJson);

	}
	
	@SuppressWarnings("unchecked")
	public String getJson(int startNum,int endNum,String FAQS,String searchText) throws SQLException {
		BoardDAO bDAO = BoardDAO.getInstance();
		
		List<BoardVO> boardList = null;
		boolean searchTextExists = false;
		
		boardList = bDAO.selectSearchBoard(startNum,endNum, FAQS, searchText);
		int totalSearchCount = bDAO.selectSearchCount(FAQS, searchText);
		
		if(boardList.size() == 0) {
			searchTextExists = true;
		}
		
        int totalPage = (int) Math.ceil((double) totalSearchCount / (endNum - startNum + 1));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	     String date = null;
	      
	      
	        
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
			jsonObj.put("result", jsonArr);
			jsonObj.put("FAQS", FAQS);
			jsonObj.put("searchTextExists", searchTextExists);
			jsonObj.put("Categorycount", totalSearchCount );
			jsonObj.put("totalPage", totalPage);
			jsonObj.put("searchText", searchText);
			
			}catch(Exception e) {
				e.printStackTrace();
				jsonObj.put("status", "FAIL");
			}
			
			System.out.println(jsonObj);
			return jsonObj.toJSONString();
		
	}
}
