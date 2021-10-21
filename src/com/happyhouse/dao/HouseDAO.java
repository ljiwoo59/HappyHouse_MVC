
package com.happyhouse.dao;

import java.util.ArrayList;

import com.happyhouse.dto.House;
import com.happyhouse.dto.HouseInfo;

public interface HouseDAO {

	void insert(House house);
	ArrayList<HouseInfo> search(String condition);
	void delete(String id);
	ArrayList<HouseInfo> searchApt(String condition);
	
	

}

