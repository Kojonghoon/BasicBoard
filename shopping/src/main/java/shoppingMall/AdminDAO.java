package shoppingMall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	public static final int ADMIN_NONEXISTENT = 0;
	public static final int ADMIN_EXIST = 1;
	public static final int ADMIN_LOGIN_PW_FAIL = 0;
	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_NOT = -1;

	private static AdminDAO insAdmin = new AdminDAO();

	private AdminDAO() {
	}

	public static AdminDAO getInstance() {
		return insAdmin;
	}

	public int adminCheck(String id, String pw) {
		int n = 0;
		String dbPw;

		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from admin where id =?";

		try {
			dbconn = getConnection();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPw = rs.getString("password");
				if (dbPw.equals(pw)) {
					n = AdminDAO.ADMIN_LOGIN_SUCCESS; // 로그인 성공
				} else {
					n = AdminDAO.ADMIN_LOGIN_PW_FAIL; // 비번 불일치
				}
			} else {
				n = AdminDAO.ADMIN_LOGIN_NOT;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return n;
	} // adminCheck

	public AdminDTO getAdmin(String id) {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from admin where id =?";
		AdminDTO adto = null;

		try {
			dbconn = getConnection();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				adto = new AdminDTO();
				adto.setId(rs.getString("id"));
				adto.setPw(rs.getString("password"));
				adto.setName(rs.getString("name"));
				adto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				dbconn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return adto;
	}

	private Connection getConnection() {
		Connection dbconn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/opentutorials?serverTimezone=UTC";
			String username = "root";
			String password = "1234";
			dbconn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC 드라이버를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결에 실패했습니다.");
			e.printStackTrace();
		}
		return dbconn;
	}
}
