package com.bitschool.dao;

import java.sql.SQLException;

public interface IPageDAO {
	public int selectCountAll() throws SQLException;
	public int selectSearchCount(String query, String boardName) throws SQLException;
}
