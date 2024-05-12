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

/**
 * Servlet implementation class MovieTimeServlet
 */
@WebServlet("/MovieTimeServlet")
public class MovieTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String screeningDate = request.getParameter("screeningDate");
		String theaterName = request.getParameter("theaterName");
		String movieCode = request.getParameter("movieCode");
		
		String selectMovieTime = null;
		try {
			selectMovieTime = getJSON(screeningDate, theaterName, movieCode);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	
		response.getWriter().print(selectMovieTime);
	} // doPost
	
	@SuppressWarnings("unchecked")
	public String getJSON(String screeningDate, String theaterName, String movieCode) throws SQLException {
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> movieTimeList = rsDAO.selectMovieTime(screeningDate, theaterName, movieCode);

		JSONArray jsonArr = new JSONArray();
		
		for(int i = 0; i < movieTimeList.size(); i++) {
			ReservingVO rsVO = movieTimeList.get(i);
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("screeningDate", screeningDate);
			jsonObj.put("theaterName", theaterName);
			jsonObj.put("movieTitle", rsVO.getMovieTitle());
			jsonObj.put("movieRating", rsVO.getMovieRating());
			jsonObj.put("theaterNumber", rsVO.getTheaterNumber());
			jsonObj.put("screeningCode", rsVO.getScreeningCode());
			jsonObj.put("screeningTime", rsVO.getScreeningTime());
			
			jsonArr.add(jsonObj);
		} // end for
		
		//System.out.print(jsonArr);
		return jsonArr.toJSONString();
	}

} // class