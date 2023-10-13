package shoppingMall.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import shoppingMall.ProductDTO;

public class ProdListDAO {
	private static ProdListDAO insProdDAO = new ProdListDAO();
	
	Hashtable<String, Vector<ProductDTO>> hashTable= new Hashtable<String, Vector<ProductDTO>>();
	
	private Vector<ProductDTO> pdtos;
	
	private ProdListDAO() {
		pdtos = new Vector<ProductDTO>(3,2);
	}

	public static ProdListDAO getInstance() {
		return insProdDAO;
	}

	// 상품 사양별로 상품목록을 가져오는 비즈니스 로직
	public Vector<ProductDTO> selectByPspec(String pspec) throws SQLException {
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dbconn = getConnection();
			String sql = "select * from product where pspec=?";
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();

			pdtos = this.makeVector(rs);

			//상품 사양별로 목록을 해시테이블에 저장
			hashTable.put(pspec, pdtos);
			
			return pdtos;
		} finally {

		}
	}// selectByPspec()

	public Vector<ProductDTO> makeVector(ResultSet rs) throws SQLException {
		Vector<ProductDTO> v = new Vector<ProductDTO>();

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

			v.add(pdto);
		} // while End
		return v;
	}// makeVector()

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
