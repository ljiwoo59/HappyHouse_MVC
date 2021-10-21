package com.happyhouse.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happyhouse.controller.HouseController;


@WebServlet("*.happy")
public class HouseFrontController extends HttpServlet {
	
	HouseController con;
	
	public HouseFrontController() {
		con = new HouseController();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) {
		String reqString = request.getServletPath();
		
		if(reqString.equals("/addUser.happy")) { //초기화면 요청
			con.add(request,response);
		}else if (reqString.equals("/loginProcess.happy")) { //login 처리 (세션)
			con.loginProcess(request, response);
		}else if (reqString.equals("/logout.happy")) { //login 처리 (세션)
			con.logout(request, response);
		} else if (reqString.equals("/views/search.happy")) { // 동 검색
			con.search(request, response);
		}else if (reqString.equals("/delete.happy")) { //login 처리 (세션)
			con.delete(request, response);
		} else if (reqString.equals("/views/searchApt.happy")) { // 아파트검색
			con.searchApt(request, response);
		}
	}

}

