package com.board.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/boardlist")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		String word = request.getParameter("word")==null? "":request.getParameter("word");
		String field = request.getParameter("field")==null? "subject":request.getParameter("field");
		
		String pageNum = request.getParameter("pageNum")==null? "1":request.getParameter("pageNum");
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		ArrayList<BoardDTO> arr = dao.boardList(startRow, endRow, field, word);
		int count = dao.boardCount(field, word);
		
//		총페이지 수
		int totPage = count/pageSize + (count%pageSize==0? 0:1);
		int blockPage = 3; //[이전] 1 2 3 [다음] -> 가운데 보여지는 페이지 번호 개수
		int startPage = ((currentPage-1)/blockPage)*blockPage+1;
		int endPage = startPage+blockPage-1;
		
		if(endPage>totPage) endPage = totPage;
		
//		번호
		int rowNo = count - (currentPage-1)*pageSize;
		
//		방법1(각각 셋팅)
		request.setAttribute("totPage", totPage);
		request.setAttribute("blockPage", blockPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("field", field);
		request.setAttribute("word", word);
		
//		방법2(객체 생성하여 사용)
//		PageUtil page = new PageUtil();
//		page.setBlockPage(blockPage);
//		page.setCurrentPage(currentPage);
//		page.setEndPage(endPage);
//		page.setStartPage(startPage);
//		page.setTotPage(totPage);
//		page.setWord(word);
//		page.setField(field);
//		
//		request.setAttribute("p", page);
		
		request.setAttribute("rowNo", rowNo);
		request.setAttribute("boards", arr);
		request.setAttribute("count", count);
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
