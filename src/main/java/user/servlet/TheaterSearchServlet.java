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

import VO.ReservingVO;
import user.DAO.ReservingDAO;

@WebServlet("/TheaterSearchServlet")
public class TheaterSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String screeningDate = request.getParameter("screeningDate");
		
		//System.out.println("서블릿 내부 screeningDate : " + screeningDate);
		response.getWriter().write(getJSON(screeningDate));
	} // doPost
	
	public String getJSON(String screeningDate) {
		if(screeningDate == null) screeningDate = "";
		StringBuilder result = new StringBuilder();
		result.append("{\"result\":[");
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> theaterList = new ArrayList<ReservingVO>();
		
		try {
			theaterList = rsDAO.selectTheater(screeningDate);
			for(int i = 0; i < theaterList.size(); i++) {
				result.append("{\"value\": \"" + theaterList.get(i).getTheaterName() + "\"}");
				if(i < theaterList.size() - 1) {
                    result.append(",");
                } // end if
			} // end for
			result.append("]}");
			//System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		
		return result.toString();
	} // getJSON

} // class