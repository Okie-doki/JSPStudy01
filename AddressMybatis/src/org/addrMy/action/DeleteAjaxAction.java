package org.addrMy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

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

import com.google.gson.Gson;

/**
 * Servlet implementation class DeleteAjaxAction
 */
@WebServlet("/address_my/deleteAjax.my")
public class DeleteAjaxAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAjaxAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactor();
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.REUSE);
		sqlSession.delete("deleteData", num);
		sqlSession.commit();
		
		List<Address> arr = sqlSession.selectList("listData");
		int count = sqlSession.selectOne("countData");
		
		HashMap<String, Object> main = new HashMap<String, Object>();
		main.put("arr", arr);
		main.put("count", count);
		
		Gson gson = new Gson();
		String obj = gson.toJson(main);
		
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
