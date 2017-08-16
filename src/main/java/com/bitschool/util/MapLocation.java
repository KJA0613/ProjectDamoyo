package com.bitschool.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import com.bitschool.dto.PlaceDTO;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MapLocation {

	public PlaceDTO GetDatum(PlaceDTO pdto) {
		
		
		try {
			System.out.println(pdto.getPlaceAddr3());
			String text = URLEncoder.encode(pdto.getPlaceAddr3(), "UTF-8");
			String apiURL = "https://dapi.kakao.com/v2/local/search/keyword.json?query="+text+"&page=3&appkey=ebfbfbd7a5ec71c10c63936dd90beb22&size=15";
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println("response.toString() : " + response.toString());
			String data = response.toString();
			String[] splitData = data.split("\"documents\":");
			String docudata = splitData[1].substring(1, splitData[1].length()-2);
			
			/*
			System.out.println(ss[0]);
			System.out.println(ss[1]);*/
			
			
			/*HashMap<String, String> mapData = new HashMap<String, String>();
			System.out.println(mapData.get("documents"));
			
			String docudata = data.substring(142, data.length() - 1);*/
			System.out.println("docudata : " + docudata);
			ObjectMapper mapper = new ObjectMapper();
			
			HashMap<String, String> map = new HashMap<String, String>();
			 
			try {
				System.out.println("try 지나감");
				map = mapper.readValue(docudata, new TypeReference<HashMap<String, String>>() {});        

				System.out.println("map"+map);
				System.out.println(map.get("x"));
				System.out.println(map.get("y"));
				pdto.setPlaceX(map.get("x"));
				pdto.setPlaceY(map.get("y"));
				
				
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			

		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println();
		
		return pdto;
	}
}
