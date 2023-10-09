package shoppingMall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDAO {

	private static CategoryDAO insCatDAO = new CategoryDAO();

	private CategoryDAO() {
	}

	public static CategoryDAO getInstance() {
		return insCatDAO;
	}

	public int insertCat(String code, String cname) {
		int n = 0;
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into category(code, cateName) values(?, ?)";

		try {
			dbconn = getConnection();
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, cname);
			n = pstmt.executeUpdate();

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
		return n;
	}// insertCat

	// ** 카테고리 목록을 자겨오기 **//
	public ArrayList<CategoryDTO> categoryAll() throws SQLException {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			dbconn = getConnection();
			String sql = "select * from category order by cateNum desc";
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<CategoryDTO> cdtos = new ArrayList<CategoryDTO>();

			while (rs.next()) {
				String cnum = rs.getString("cateNum");
				String code = rs.getString("code");
				String cname = rs.getString("cateName");

				CategoryDTO cdto = new CategoryDTO(cnum, code, cname);
				cdtos.add(cdto);
			} // while End
			return cdtos;
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (dbconn != null) dbconn.close();
		}
	}// categoryAll()

	public int categoryDelete(String cnum) throws SQLException {
		Connection dbconn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			dbconn = getConnection();
			String sql = "delete from category where cateNum=?";
			pstmt = dbconn.prepareStatement(sql);
			pstmt.setString(1, cnum);
			int n = pstmt.executeUpdate();
			return n;
		} finally {
			if (pstmt != null) pstmt.close();
			if (dbconn != null) dbconn.close();
		}
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
