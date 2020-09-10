package com.koreait.matzip;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class Container extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private HandlerMapper mapper;
	
	public Container() {
		mapper = new HandlerMapper();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);
	}
	
	private void proc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 되어 있으면 login, join 접속 x
		
		String routerCheckResult = LoginChkInterceptor.routerChk(request);
		
		if(routerCheckResult != null) {
			response.sendRedirect(routerCheckResult);
			return;
		}
		
		boolean isLogout = SecurityUtils.isLogout(request);
		//로그인에 따른 접속 가능여부 판단(로그인이 안 되어 있으면 접속할 수 있는 주소만 여기서 체크.. 나머지는 전부 로그인이 되어 있어야 함
		
		
		
		String temp = mapper.nav(request); //보통 템플릿 파일명
		
		if(temp.indexOf("/") >= 0) {
			String prefix = temp.substring(0, temp.indexOf("/"));
			
			
			if("redirect:".equals(prefix)) {
				String value = temp.substring(temp.indexOf("/"));
				response.sendRedirect(value);
				return;
			} else if("ajax:".equals(prefix)) {
				String value = temp.substring(temp.indexOf("/") + 1);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				
				System.out.println("value : " + value);
				out.print(value);
				return;
			}
		}
		
		switch(temp) {
		case "405":
			temp = "/WEB-INF/view/error.jsp";
			break;
		case "404":
			temp = "/WEB-INF/view/notFound.jsp";
			break;
		}
		request.getRequestDispatcher(temp).forward(request, response);
	}

}