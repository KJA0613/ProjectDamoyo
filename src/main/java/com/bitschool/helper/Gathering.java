package com.bitschool.helper;

public class Gathering {
	String name;
	int score;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "Gathering [name=" + name + ", score=" + score + "]";
	}
	
	
}
