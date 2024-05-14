package user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.LoginDAO;
import user.VO.UserVO;


@WebServlet("/CheckPasswordServlet")
	public class CheckPasswordServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        
	        
	        String id = request.getParameter("id");
	        String password = request.getParameter("password");


	        UserVO uVO = UserVO.builder()
	        			.userId(id)
	        			.userPassword(password)
	        			.build();
	        
	        


	        try {
	            boolean result = checkPassword(uVO);
	            String jsonResponse = "{\"success\": " + result + "}";
	            response.getWriter().write(jsonResponse);
	        } catch (SQLException e) {
	            // 예외 처리
	            e.printStackTrace();
	            // 클라이언트에게 오류 응답 전송
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating theater.");
	        }
	    }

	    public boolean checkPassword(UserVO uVO) throws SQLException {

	    	boolean result = false;
	        LoginDAO lDAO = LoginDAO.getInstance();
	        // 여기서 업데이트 작업 수행
	    	UserVO resultVO = lDAO.Login(uVO);
	    	if(resultVO!=null) {
	    		result =  true;
	        	
	    	}
	        return result;
	    }
	}
