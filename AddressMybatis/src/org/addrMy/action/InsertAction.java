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
 * Servlet implementation class InsertAction
 */
@WebServlet("/address_my/insert.my")
public class InsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addrInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Address address = new Address();
		address.setName(request.getParameter("name"));
		address.setAddr(request.getParameter("addr"));
		address.setZipcode(request.getParameter("zipcode"));
		address.setTel(request.getParameter("tel"));
		
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactor();
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.REUSE);
		sqlSession.insert("insertData", address);
		sqlSession.commit();
		response.sendRedirect("list.my");
	}

}
