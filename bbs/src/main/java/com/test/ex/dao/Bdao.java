package com.test.ex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import com.test.ex.dto.Bdto;

public class Bdao {

	Connection dbconn;
	PreparedStatement ps;
	ResultSet rs;
	String url = "jdbc:mysql://localhost:3306/opentutorials";
	String uid = "root", pwd = "1234";

	DataSource dataSource;

	public Bdao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bdto> list() {
		ArrayList<Bdto> dtos = new ArrayList<Bdto>();
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql = "select bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from tboard order by bGroup desc, bStep asc";
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");

				Bdto dto = new Bdto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	} // select

	public void write(String bName, String bTitle, String bContent) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;

		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql = "insert into tboard(bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)"
					+ "values(?, ?, ?, 0, LAST_INSERT_ID(), 0, 0)";
			//LAST_INSERT_ID() 오라클 curval을 MySQL에도 적용해보자 이부분에서 좀 다르다
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);

			int n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}// insert

	public Bdto view(String sbId) {
		
		plusHit(sbId);
		
		Bdto dto = null;
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql = "select * from tboard where bId=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(sbId));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				
				dto = new Bdto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}// view

	public void modify(String bId, String bName, String bTitle, String bContent) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql = "update tboard set bName=?, bTitle=?, bContent=? where bId=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bId));
			
			int n = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}//modify

	public void delete(String bId) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql ="delete from tboard where bId=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bId));
			
			int n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}//delete

	public Bdto replyView(String sBid) {
		Bdto dto = null;
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql ="select * from tboard where bId=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(sBid));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				
				dto = new Bdto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
			}
			
//			int n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}//replyView

	public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep,
			String bIndent) {
		replyForm(bGroup, bStep);
		
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		
		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql ="insert into tboard(bName, bTitle, bContent, bGroup, bStep, bIndent)"
					+"values(?, ?, ?, ?, ?, ?)";
			pstmt = dbconn.prepareStatement(sql);
			
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bGroup));
			pstmt.setInt(5, Integer.parseInt(bStep)+1);
			pstmt.setInt(6, Integer.parseInt(bIndent)+1);
			
			int n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//reply
	
	private void replyForm(String sGroup, String sStep) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		try {
			dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
					"1234");
			String sql = "update tboard set bStep = bStep+1 where bGroup = ? and bStep > ?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(sGroup));
			pstmt.setInt(2, Integer.parseInt(sStep));
			
			int n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (dbconn != null) dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//replyForm
	

	private void plusHit(String bId) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
			try {
				dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC", "root",
						"1234");
				String sql = "update tboard set bHit = bHit+1 where bId=?";
				pstmt = dbconn.prepareStatement(sql);
				pstmt.setString(1, bId);
				
				int n = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if (pstmt != null) pstmt.close();
					if (dbconn != null) dbconn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
	}//plusHit
}
