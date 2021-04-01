package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.CommentDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class CommentListController
 */
@WebServlet("/board/commentlist")
public class CommentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		BoardDAO dao = BoardDAOImpl.getInstance();
		ArrayList<CommentDTO> carr = dao.findAllComment(bnum);
		
//		[방법1]json-simple라이브러리 사용
//		JSONArray jarr = new JSONArray();
//		for(CommentDTO comment : carr) {
//			JSONObject obj = new JSONObject();
//			obj.put("userid", comment.getUserid());
//			obj.put("bnum", comment.getBnum());
//			obj.put("cnum", comment.getCnum());
//			obj.put("msg", comment.getMsg());
//			obj.put("regdate", comment.getRegdate());
//			jarr.add(obj);
//		}
//		response.setContentType("application/json; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.println(jarr.toJSONString());
		
//		[방법2]gson라이브러리 사용 
		Gson gson = new Gson();
		String obj = gson.toJson(carr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(obj.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
