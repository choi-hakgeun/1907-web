package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardMybatisDao;
import bean.Page;
import mybatis.BoardVo;

@WebServlet("*.myba")
public class BoardServlet extends HttpServlet{
	HttpServletRequest req;
	HttpServletResponse resp;
	String url = "index_mybatis.jsp?inc=./mybatis/";
	
	RequestDispatcher rd;
	BoardMybatisDao dao;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); //url이 들어오지 않았을때 무조건 select가 호출되도록
		resp.setCharacterEncoding("utf-8");
		this.req = req;
		this.resp = resp;
		
		dao = new BoardMybatisDao();
		select();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		this.req = req;
		this.resp = resp;
		
		int pos = req.getRequestURI().lastIndexOf("/") + 1;
		String tempUrl = req.getRequestURI().substring(pos);		
		dao = new BoardMybatisDao();
		
		System.out.println(tempUrl);
		
		switch(tempUrl) {
		case "select.myba":
			select();
			break;
		case "view.myba":
			view();
			break;
		case "insert.myba":
			insert();
			break;
		case "insertR.myba":
			insertR();
			break;
		case "modify.myba":
			modify();
			break;
		case "modifyR.myba":
			modifyR();
			break;
		case "deleteR.myba":
			deleteR();
			break;
		case "repl.myba":
			repl();
			break;
		case "replR.myba":
			replR();
			break;
		}
	}
	
	public void select() throws ServletException, IOException{
		String path = url+"select.jsp";
		
		Page p = new Page();
		p.setFindStr(req.getParameter("findStr"));
		
		if(req.getParameter("nowPage") !=null) {
			p.setNowPage(Integer.parseInt(req.getParameter("nowPage")) );			
		}
		
		List<BoardVo> list = dao.select(p);		
		
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void view() throws ServletException, IOException{
		String path = url+"view.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void insert() throws ServletException, IOException{
		
		String path = url + "insert.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}	
	
	public void insertR() throws ServletException, IOException{
		String path = url + "insert_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modify() throws ServletException, IOException{
		String path = url + "modify.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void modifyR() throws ServletException, IOException{
		String path = url + "modify_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteR() throws ServletException, IOException{
		String path = url + "delete_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void repl() throws ServletException, IOException{
		String path = url + "repl.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void replR() throws ServletException, IOException{
		String path = url + "repl_result.jsp";
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
