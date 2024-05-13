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

import VO.MovieVO;
import user.DAO.MovieChartDAO;


@WebServlet("/MovieChartSerlvet")
public class MovieChartSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String checkStauts = request.getParameter("checkStauts");
		String selectMovieChartJson = null;
		try {
			selectMovieChartJson = getJson(checkStauts);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.getWriter().print(selectMovieChartJson);
		
	}
	
	@SuppressWarnings("unchecked")
	public String getJson(String checkStauts) throws SQLException {
		MovieChartDAO mcDAO = MovieChartDAO.getInstance();
		List<MovieVO> mcList = null;
		if(checkStauts != null) {
			mcList = mcDAO.selectShowingMovieList(checkStauts);
		}else {
			mcList = mcDAO.selectMovieList();
		}
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonTemp = null;
		
		try {
			for(int i=0 ; i < mcList.size() ; i++) {
				MovieVO mVO = mcList.get(i);
				jsonTemp = new JSONObject();
				jsonTemp.put("movieCode", mVO.getMovieCode());
				jsonTemp.put("movieTitle", mVO.getMovieTitle());
				jsonTemp.put("movieReleaseDate", mVO.getMovieReleaseDate());
				jsonTemp.put("moviePosterPath", mVO.getMoviePosterPath());
				jsonTemp.put("movieRating", mVO.getMovieRating());
				jsonTemp.put("movieScore", mVO.getMovieScore());
				
				jsonArr.add(jsonTemp);
			}
			jsonObj.put("status", "SUCCESS");
			jsonObj.put("movieList", jsonArr);
		}
		catch(Exception e){
			e.printStackTrace();
			jsonObj.put("status", "FAIL");
		}
		
		System.out.println(jsonObj);
		return jsonObj.toJSONString();
	}

}
