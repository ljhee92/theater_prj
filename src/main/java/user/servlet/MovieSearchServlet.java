package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.ReservingDAO;
import user.VO.ReservingVO;

@WebServlet("/MovieSearchServlet")
public class MovieSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String screeningDate = request.getParameter("screeningDate");
		String theaterName = request.getParameter("theaterName");
		
		//System.out.println("서블릿 내부 screeningDate : " + screeningDate);
		//System.out.println("서블릿 내부 theaterName : " + theaterName);
		response.getWriter().write(getJSON(screeningDate, theaterName));
	} // doPost
	
	public String getJSON(String screeningDate, String theaterName) {
		if(screeningDate == null) screeningDate = "";
		StringBuilder result = new StringBuilder();
		result.append("{\"result\":[");
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> movieList = new ArrayList<ReservingVO>();
		
		try {
			movieList = rsDAO.selectMovie(screeningDate, theaterName);
			for(int i = 0; i < movieList.size(); i++) {
				result.append("{\"movieTitle\": \"" + movieList.get(i).getMovieTitle() + "\",");
				result.append("\"movieRating\": \"" + movieList.get(i).getMovieRating() + "\",");
				result.append("\"movieCode\": \"" + movieList.get(i).getMovieCode() + "\"}");
				if (i < movieList.size() - 1) {
	                result.append(",");
	            }
			} // end for
			result.append("]}");
			//System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		
		return result.toString();
	} // getJSON

} // class