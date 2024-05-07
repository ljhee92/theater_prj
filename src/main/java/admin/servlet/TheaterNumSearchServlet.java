package admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.TheaterVO;
import admin.DAO.TheaterDAO;

@WebServlet("/TheaterNumSearchServlet")
public class TheaterNumSearchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String theaterName = request.getParameter("theaterName");
        
        
        
        //System.out.println("서블릿내부 theaterName : " + theaterName);
        response.getWriter().write(getJSON(theaterName));

    }

    public String getJSON(String theaterName) {
    	//System.out.println("getJSON시작");
        if (theaterName == null)
            theaterName = "";
        StringBuilder result = new StringBuilder("");
        result.append("{\"result\":[");
        TheaterDAO tDAO = TheaterDAO.getInstance();
        try {
            List<TheaterVO> tVOList = tDAO.selectTheaterNum(theaterName);
            
            for (int i = 0; i < tVOList.size(); i++) {
                result.append("{\"value\": \"" + tVOList.get(i).getTheaterNumber() + "\"}");
                if(i < tVOList.size() - 1) {
                    result.append(",");
                }
            }
            result.append("]}");
        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
        }

        return result.toString();
    }
}