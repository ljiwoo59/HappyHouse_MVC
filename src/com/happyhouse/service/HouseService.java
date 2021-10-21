package com.happyhouse.service;

import java.util.ArrayList;

import com.happyhouse.dto.House;
import com.happyhouse.dto.HouseInfo;

public interface HouseService {

	void insert(House house);

	void delete(String id);
	
	ArrayList<HouseInfo> search(String condition);

	ArrayList<HouseInfo> searchApt(String condition);

}

