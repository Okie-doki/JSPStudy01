package org.addrMy.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.addrMy.config.MybatisManager;
import org.addrMy.model.Address;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/**
 * Servlet implementation class UpdateAction
 */
@WebServlet("/address_my/update.my")
public class UpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAction() {
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
		Address address = new Address();
		address.setNum(Integer.parseInt(request.getParameter("num")));
		address.setName(request.getParameter("name"));
		address.setAddr(request.getParameter("addr"));
		address.setTel(request.getParameter("tel"));
		address.setZipcode(request.getParameter("zipcode"));
		
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactor();
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.REUSE);
		
		sqlSession.update("updateData", address);
		sqlSession.commit();
		
		response.sendRedirect("list.my");
	}

}
