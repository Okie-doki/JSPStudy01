package com.file;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileController
 */
@WebServlet("/file/upload.do")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileController() {
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
		
//		업로드 셋팅(위치, 파일크기)
		String savePath = "upload"; //저장될 파일의 위치(폴더)
		int uploadFileSizeLimit = 5*1024*1024; //파일 최대 크기
		String encType = "utf-8";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath); //저장되는 경로
		System.out.println("서버 실제 디렉토리 : "+uploadFilePath);
		
//		cos.jar 라이브러리 사용(파일 업로드를 위한 용도)
		MultipartRequest multi = new MultipartRequest(
				request, //request 객체
				uploadFilePath, //저장할 실제 디렉토리
				uploadFileSizeLimit, //최대 업로드 파일 크기
				encType, //인코딩 방법
				new DefaultFileRenamePolicy() //동일한 이름의 파일 존재 여부(존재 시 새로운 이름 부여)
		);
		
//		업로드한 파일 이름
		String fileName = multi.getFilesystemName("uploadFile");
		System.out.println("파일명 : "+fileName);
		
		if(fileName==null) {
			System.out.println("파일 업로드 실패");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("글쓴이 : "+multi.getParameter("name")+"<br>");
			out.println("제목 : "+multi.getParameter("title")+"<br>");
			out.println("파일명 : "+fileName);
		}
	}

}
