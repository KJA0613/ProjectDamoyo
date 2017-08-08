package com.bitschool.helper;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

public class RecommendHelper {
	LinkedList<Gathering> fileReader(String filePath) throws IOException {
		LinkedList<Gathering> list = new LinkedList<Gathering>();
		BufferedReader br = new BufferedReader(new FileReader(filePath));
		String line = null;
		while((line = br.readLine()) != null) {
			String[] tokens = line.split(":");
			Gathering gathering = new Gathering();
			gathering.setName(tokens[0]);
			gathering.setScore(Integer.parseInt(tokens[1]));
			list.add(gathering);
		}
		br.close();
		return list;
	}
}
