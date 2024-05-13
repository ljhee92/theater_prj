package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import user.DAO.ReservingDAO;
import user.VO.ReservingVO;

@WebServlet("/ScreeningDateServlet")
public class ScreeningDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String seletScreeningDate = null;
		try {
			seletScreeningDate = getJSON();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		
		response.getWriter().print(seletScreeningDate);
	} // doPost
	
	@SuppressWarnings("unchecked")
	public String getJSON() throws SQLException {
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> screeningDates = rsDAO.selectScreeningDate("Y");
		
		JSONArray jsonArr = new JSONArray();
		
		for(int i = 0; i < screeningDates.size(); i++) {
			ReservingVO rsVO = screeningDates.get(i);
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("screeningDate", rsVO.getScreeningDate());
			
			jsonArr.add(jsonObj);
		} // end for
		
		//System.out.println(jsonArr);
		return jsonArr.toJSONString();
	} // getJSON

} // class