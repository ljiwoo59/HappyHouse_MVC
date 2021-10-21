package com.happyhouse.api;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.xml.parsers.*;
import org.w3c.dom.*;

import com.happyhouse.util.DBUtil;

public class api {
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nlList.item(0);
		if (nValue == null) return null;
		return nValue.getNodeValue();
	}
	
	public static void main(String[] args) {
		DBUtil db = DBUtil.getInstance();
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {
			String url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
			String serviceKey = "wBmDXLbR+wiK+lSUqvCzBuPli+W+B+RoALqqu6cpoyPSLXuIiF67XX/roGxGB3VFtJAyb3/lS5Dy7zRiEYsGGg==";
			String LAWD_CD = "11110";
			String DEAL_YMD = "201512";
			String numOfRows = "20";
			
			Document documentInfo = DocumentBuilderFactory.newInstance().newDocumentBuilder()
					.parse("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey=nDNSD%2BIxQe5pGmgfgUdjmsnXlrL8ehNMWk6iM5hr49aF7RS7sY0CiZ0rxqC%2BuA3b8qCehUTNtH1LC0RWSmi0rQ%3D%3D&numOfRows=100&LAWD_CD=11110&DEAL_YMD=201512");
			
			documentInfo.getDocumentElement().normalize();
			
			NodeList nList = documentInfo.getElementsByTagName("item");

			for(int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					String full = getTagValue("일련번호", eElement);
					String code[] = full.split("-");
					
					int aptCode = Integer.parseInt(code[1]);
					String aptName = getTagValue("아파트", eElement).trim();
					String dongCode = getTagValue("법정동본번코드", eElement).trim();
					String dongName = getTagValue("법정동", eElement).trim();
					int buildYear = Integer.parseInt(getTagValue("건축년도", eElement));
					String jibun = getTagValue("지번", eElement).trim();
					String dealAmount = getTagValue("거래금액", eElement).trim();
					String lat = "";
					String lng = "";
					if (dongName.equals("사직동")) {
						lat = "35.1990";
						lng = "129.0557";
					} else if (dongName.equals("당주동")) {
						lat = "37.5715";
						lng = "126.9742";
					} else if (dongName.equals("내수동")) {
						lat = "37.5733";
						lng = "126.9720";
					} else if (dongName.equals("연건동")) {
						lat = "37.5789";
						lng = "126.9996";
					} else if (dongName.equals("명륜1가")) {
						lat = "37.5881";
						lng = "126.9980";
					} else if (dongName.equals("명륜2가")) {
						lat = "37.5845";
						lng = "126.9991";
					} else if (dongName.equals("창신동")) {
						lat = "37.5751";
						lng = "127.0122";
					} else if (dongName.equals("숭인동")) {
						lat = "37.5747";
						lng = "127.0186";
					} else if (dongName.equals("교북동")) {
						lat = "37.5714";
						lng = "126.9613";
					} else if (dongName.equals("평창동")) {
						lat = "37.6053";
						lng = "126.9669";
					} else if (dongName.equals("무악동")) {
						lat = "37.5774";
						lng = "126.9586";
					}
					
					conn = db.getConnection();
					String query = "Insert into houseinfo(aptCode, aptName, dongCode, dongName, buildYear, jibun, dealAmount, lat, lng)";
					query += "values(?, ?, ?, ?, ?, ?, ?,?,?)";
					stat = conn.prepareStatement(query);
			        stat.setInt(1, aptCode);
			        stat.setString(2, aptName);
			        stat.setString(3, dongCode);
			        stat.setString(4, dongName);
			        stat.setInt(5, buildYear);
			        stat.setString(6, jibun);
			        stat.setString(7, dealAmount);
			        stat.setString(8, lat);
			        stat.setString(9, lng);
			        stat.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(stat, conn);
		}
	}
}
