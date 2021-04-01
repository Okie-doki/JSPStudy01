package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.member.model.MemberDAO;
import com.member.model.MemberDAOImpl;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class UserDeleteController
 */
@WebServlet("/member/userDelete")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		MemberDAO dao = MemberDAOImpl.getInstance();
		dao.memberDelete(userid);
		ArrayList<MemberDTO> arr = dao.getMember();
		int count = dao.memberCount();
		
//		json 출력하기 위해..
		JSONObject mainObj = new JSONObject();
//		개수
		JSONObject countObj = new JSONObject();
		countObj.put("count", count);
//		회원목록
		JSONArray jarr = new JSONArray();
		for(MemberDTO member : arr) {
			JSONObject obj = new JSONObject();
			obj.put("name", member.getName());
			obj.put("userid", member.getUserid());
			obj.put("email", member.getEmail());
			obj.put("phone", member.getPhone());
			obj.put("mode", member.getAdmin()==0? "일반회원":"관리자");
			jarr.add(obj);
		}
		
		mainObj.put("jarr", jarr);
		mainObj.put("countObj", countObj);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(mainObj.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
