package shoppingMall;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;

public class ProductDAO {
	private static ProductDAO insPDAO = new ProductDAO();

	private ProductDAO() {
	}// 기본 생성자

	public static ProductDAO getInstance() {
		return insPDAO;
	}

	// 상품 등록 모듈
	public int registerProduct(MultipartRequest multi) throws SQLException {
		Connection dbconn = null;
		PreparedStatement ps = null;
		try {
			dbconn = getConnection();
			String sql = "insert into product(pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate) values(?, ?, ?, ?, ?, ? , ?, ?, ?, sysdate())";

			ps = dbconn.prepareStatement(sql);

			String pname = multi.getParameter("pname");
			String pcategory_fk = multi.getParameter("pcategory_fk");
			String pcompany = multi.getParameter("pcompany");
			String pimage = multi.getFilesystemName("pimage");
			String pqty = multi.getParameter("pqty");
			String price = multi.getParameter("price");
			String pspec = multi.getParameter("pspec");
			String pcontents = multi.getParameter("pcontents");
			String point = multi.getParameter("point");

			ps.setString(1, pname);
			ps.setString(2, pcategory_fk);
			ps.setString(3, pcompany);
			ps.setString(4, pimage);
			ps.setString(5, pqty);
			ps.setString(6, price);
			ps.setString(7, pspec);
			ps.setString(8, pcontents);
			ps.setString(9, point);

			int n = ps.executeUpdate();
			return n;

		} finally {
			if (ps != null)
				ps.close();
			if (dbconn != null)
				dbconn.close();
		}
	}// registerProduct()

	// 모든 상품 리스트를 가져오기 모듈
	public ArrayList<ProductDTO> productAll() throws SQLException {
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from product order by pnum desc";

		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> pdtos = makeArrayList(rs);
			return pdtos;
		} finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(dbconn!=null) dbconn.close();
		}
	}// productAll()

	public ArrayList<ProductDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<ProductDTO> pdtos = new ArrayList<ProductDTO>();

		while (rs.next()) {
			String pnum = rs.getString(1);
			String pname = rs.getString(2);
			String pcategory_fk = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pspec = rs.getString(8);
			String pcontents = rs.getString(9);
			int point = rs.getInt(10);
			Date d = rs.getDate(11);
			String pinputDate = d.toString();

			ProductDTO pdto = new ProductDTO(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents,
					point, pinputDate, 0, 0);

			pdtos.add(pdto);
		} // while End
		return pdtos;
	}// makeArrayList()

	// connection pool에서 connection확보
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
