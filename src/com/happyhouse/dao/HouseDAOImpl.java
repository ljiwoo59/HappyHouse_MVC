package com.happyhouse.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.happyhouse.dto.House;
import com.happyhouse.dto.HouseInfo;

public class HouseDAOImpl implements HouseDAO {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scott?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "scott";
	String password = "tiger";
	
	public HouseDAOImpl() {
		//1.driver 등록
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void insert(House house) {
		try {
			String query = "insert into user values(?, ?, ?, ?, ?)";
			
			Connection con = DriverManager.getConnection(url, user, password);//2
			PreparedStatement stat = con.prepareStatement(query);//3
			stat.setString(1, house.getNid());			
			stat.setString(2, house.getNpw());			
			stat.setString(3, house.getName());			
			stat.setString(4, house.getAddress());	
			stat.setString(5, house.getTel());	
			
			stat.executeUpdate();		
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
	}

	@Override
	public ArrayList<HouseInfo> search(String condition) {
		ArrayList<HouseInfo> infos = new ArrayList<>();
		try {
			String query = "select * from houseinfo where dongName = ?";
			
			Connection con = DriverManager.getConnection(url, user, password);//2
			PreparedStatement stat = con.prepareStatement(query);//3
			stat.setString(1, condition);			
			System.out.println(stat);
			ResultSet rs = stat.executeQuery();	
			while (rs.next()) {
				String aptCode = Integer.toString(rs.getInt("aptCode"));
				String aptName = rs.getString("aptName");
				String dongCode = rs.getString("dongCode");
				String dongName = rs.getString("dongName");
				String buildYear = Integer.toString(rs.getInt("buildYear"));
				String jibun = rs.getString("jibun");
				double lat = Double.parseDouble(rs.getString("lat"));
				double lng = Double.parseDouble(rs.getString("lng"));
				String img = rs.getString("img");
				String dealAmount = rs.getString("dealAmount");
				
				HouseInfo info = new HouseInfo(aptCode, aptName, dongCode, dongName, buildYear, jibun, lat, lng, img, dealAmount);
				infos.add(info);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		return infos;
	}
	
	@Override
	public void delete(String id) {
		try {
			String query = "delete from user where nid = ?";
			
			Connection con = DriverManager.getConnection(url, user, password);//2
	        PreparedStatement stat = con.prepareStatement(query); //3
	        stat.setString(1, id);
	        stat.executeUpdate();
	        con.close();
        }catch (Exception e) {
        	e.printStackTrace();
		}
		
	}

	@Override
	public ArrayList<HouseInfo> searchApt(String condition) {
		ArrayList<HouseInfo> infos = new ArrayList<>();
		String find = "%" + condition + "%";
		try {
			String query = "select * from houseinfo where aptName like ?";
			
			Connection con = DriverManager.getConnection(url, user, password);//2
			PreparedStatement stat = con.prepareStatement(query);//3
			stat.setString(1, find);			
			System.out.println(stat);
			ResultSet rs = stat.executeQuery();	
			while (rs.next()) {
				String aptCode = Integer.toString(rs.getInt("aptCode"));
				String aptName = rs.getString("aptName");
				String dongCode = rs.getString("dongCode");
				String dongName = rs.getString("dongName");
				String buildYear = Integer.toString(rs.getInt("buildYear"));
				String jibun = rs.getString("jibun");
				double lat = Double.parseDouble(rs.getString("lat"));
				double lng = Double.parseDouble(rs.getString("lng"));
				String img = rs.getString("img");
				String dealAmount = rs.getString("dealAmount");
				
				HouseInfo info = new HouseInfo(aptCode, aptName, dongCode, dongName, buildYear, jibun, lat, lng, img, dealAmount);
				infos.add(info);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return infos;
	}

}

