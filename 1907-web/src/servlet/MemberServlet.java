package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao2;
import bean.MemberPhoto;
import bean.MemberVo2;
import bean.Page;
@WebServlet("*.mm")
public class MemberServlet extends HttpServlet{
	String url = "index.jsp?inc=./jsp/index_jsp.jsp&sp=./jsp_member";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		switch(tempUrl) {
		case "/insert.mm":
			insert(req, resp);
			break;
		case "/insertR.mm":
			insertR(req, resp);
			break;
		case "/modify.mm":
			modify(req, resp);
			break;
		case "/modifyR.mm":
			modifyR(req, resp);
			break;
		case "/view.mm":
			view(req, resp);
			break;
		case "/deleteR.mm":
			deleteR(req, resp);
			break;
		case "/select.mm":
			select(req, resp);
			break;
		}		
	}
	public void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr = req.getParameter("findStr");
		
		String path = url + "/insert.jsp?findStr="+findStr;
		RequestDispatcher rd = req.getRequestDispatcher(path);
		
		rd.forward(req, resp);
	}
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/insert_result.jsp";
		bean.FileUpload upload = new bean.FileUpload(req, resp);
		if(upload.uploadFormCheck()) {
			MemberVo2 vo = upload.uploading();
			List<MemberPhoto> list = vo.getPhotos();
			
			MemberDao2 dao = new MemberDao2();
			String msg = dao.insert(vo);
			req.setAttribute("msg", msg);			
			
			System.out.println("mId=" + vo.getmId());
			System.out.println("pwd=" + vo.getPwd());
			System.out.println("mName=" + vo.getmName());
			System.out.println("rDate=" + vo.getrDate());
			System.out.println("grade=" + vo.getGrade());
			
			
			for(MemberPhoto p : list) {
				System.out.println("ori=" + p.getOriFile());
				System.out.println("sys=" + p.getSysFile());
			}
			
		}else {
			System.out.println("error");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		path += "?nowPage=" + req.getAttribute("nowPage");
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/modify.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDao2 dao = new MemberDao2();
		int nowPage = 1;
		String findStr ="";
		if(req.getParameter("nowPage") !=null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}		
		if(req.getParameter("findStr")!=null) {//hidden에 검색어 저장이 되면 낫널로 해도됨
			findStr = req.getParameter("findStr");
		}
		
		Page p = new Page();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		
		List<MemberVo2> list = dao.select(p);
		
		req.setAttribute("list", list);		
		req.setAttribute("p", p);
		String path = url + "/select.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/delete_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}

	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}

	public void modifyR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/modify_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}





}
