package com.test.ex;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	public ArrayList<StudentDTO> execute(HttpServletRequest request, HttpServletResponse response) throws SQLException;

};
