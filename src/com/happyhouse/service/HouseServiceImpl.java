package com.happyhouse.service;

import java.util.ArrayList;

import com.happyhouse.dao.HouseDAO;
import com.happyhouse.dao.HouseDAOImpl;
import com.happyhouse.dto.House;
import com.happyhouse.dto.HouseInfo;

public class HouseServiceImpl implements HouseService {
	
	HouseDAO dao;
	
	public HouseServiceImpl() {
		dao = new HouseDAOImpl();
	}
	
	@Override
	public void insert(House house) {
		dao.insert(house);
	}

	@Override
	public ArrayList<HouseInfo> search(String condition) {
		ArrayList<HouseInfo> infos = dao.search(condition);
		return infos;
	}
	
	@Override
	public void delete(String id) {
		dao.delete(id);
		
	}

	@Override
	public ArrayList<HouseInfo> searchApt(String condition) {
		ArrayList<HouseInfo> infos = dao.searchApt(condition);
		return infos;
	}

}

