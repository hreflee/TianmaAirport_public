package com.servlet.news;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Admin;
import com.entity.News;

/**
 * Servlet implementation class NewsDelete
 */
//WebServlet("/NewsDelete")
public class NewsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processrequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//processrequest(request, response);
	}
	
	void processrequest(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		if(request.getParameter("news-id")==null){
			request.getRequestDispatcher("/Public/News/NewsList.jsp").forward(request, response);
			return;
		}
		String id=(String)request.getParameter("news-id");
		HttpSession session=request.getSession();
		Admin admin=(Admin)session.getAttribute("admin");
		News[] news=(News[])session.getAttribute("news");
		int a=0;
		for(int i=0;i<news.length;i++){
			if(news[i].getNewsId().equals(id))
				a=i;
		}
		if(!news[a].getNewsId().equals(id)){
			request.setAttribute("result", "0");
			request.setAttribute("forward", "delete");
			request.getRequestDispatcher("/Public/News/NewsList.jsp").forward(request,response);
		}else{
		int re=admin.deleteNews(news[a]);
		if(re==-1){
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}else if(re==1){
			request.setAttribute("result", re);
			request.setAttribute("forward", "delete");
			request.getRequestDispatcher("/Public/News/NewsList.jsp").forward(request, response);
		}else {
			request.setAttribute("result", re);
			request.setAttribute("forward", "delete");
			request.getRequestDispatcher("/Public/News/NewsList.jsp").forward(request,response);
		}
		}
	}

}
