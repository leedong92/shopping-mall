package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Product;


public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		//임시 제품
//		Product phone = new Product("P1234", "iPhone 6s", 800000);
//		phone.setDescription("4.7inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
//		phone.setCategory("Smart Phone");
//		phone.setManufacturer("Apple");
//		phone.setUnitsInStock(1000);
//		phone.setCondition("new");
//		phone.setImageName("iphone.png");
//		listOfProducts.add(phone);
		
		
	}
	
	public ArrayList<Product> getAllProducts() throws SQLException{
		Product phone1 = new Product();
		Dbconn dbconn = new Dbconn();
		try {
			
			String sql = "select * from product";
			pstmt = dbconn.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				phone1.setProductId(rs.getString(1));
				phone1.setPname(rs.getString(2));
				phone1.setUnitPrice(rs.getInt(3));
				phone1.setDescription(rs.getString(4));
				phone1.setQuantity(rs.getInt(5));
				phone1.setImageName(rs.getString(6));
				
				listOfProducts.add(phone1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return listOfProducts;
	}
	
	public Product getProductOne(String id) throws SQLException{
		Product phone1 = new Product();
		Dbconn dbconn = new Dbconn();

		try {
			String sql = "select * from product where pId=?";
			pstmt = dbconn.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				phone1.setProductId(rs.getString(1));
				phone1.setPname(rs.getString(2));
				phone1.setUnitPrice(rs.getInt(3));
				phone1.setDescription(rs.getString(4));
				phone1.setQuantity(rs.getInt(5));
				phone1.setImageName(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return phone1;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if(product != null &&
					product != null &&
					product.getProductId() != null &&
					product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	public void CheckAddProduct() {
		
	}

}
