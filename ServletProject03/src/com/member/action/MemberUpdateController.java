package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDAOImpl;
import com.member.model.MemberDTO;
import com.member.util.SHA256;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/member/update")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDTO member = new MemberDTO();
		member.setName(request.getParameter("name"));
		member.setUserid(request.getParameter("userid"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		
//		패스워드 암호화
		String pwd = request.getParameter("pwd");
		String encPwd = SHA256.getEncrypt(pwd, member.getUserid());
		member.setPwd(encPwd);

		member.setAdmin(Integer.parseInt(request.getParameter("admin")));
		
		MemberDAO dao = MemberDAOImpl.getInstance();
		dao.memeberUpdate(member);
		
		response.sendRedirect("view");
		
	}

}
