package com.happyhouse.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happyhouse.dto.House;
import com.happyhouse.dto.HouseInfo;
import com.happyhouse.service.HouseService;
import com.happyhouse.service.HouseServiceImpl;

public class HouseController {
	
	HouseService service;

	public HouseController() {
		service = new HouseServiceImpl();
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response) {
		try {
			String nid = request.getParameter("nid");
			String npw = request.getParameter("npw");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			
			service.insert(new House(nid,npw,name,address,tel));
			
			response.setStatus(201);
			response.sendRedirect("index.jsp");
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loginProcess(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
	
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			System.out.println(id);
			
			service.delete(id);
			
			response.sendRedirect("../index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void search(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String condition = request.getParameter("condition");
	
		ArrayList<HouseInfo> infos = service.search(condition);
		request.setAttribute("infos", infos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/dongPrice.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void searchApt(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String condition = request.getParameter("apt");
	
		ArrayList<HouseInfo> infos = service.searchApt(condition);
		request.setAttribute("infos", infos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/aptPrice.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}

