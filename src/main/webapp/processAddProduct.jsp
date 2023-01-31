<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>



<%
	request.setCharacterEncoding("utf-8");
	
	String filename = "";
	String realFolder = "C:\\upload";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType);
	
	String productId = multi.getParameter("productId");
	String productName = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String unitInStock = multi.getParameter("unitInStock");
	String productImage = multi.getParameter("productImage");
	Integer price;
	long stock;
	
	if(unitInStock.isEmpty()){
		price=0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	if(unitInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitInStock);
	}
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product();
	
	newProduct.setProductId(productId);
	newProduct.setPname(productName);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setUnitsInStock(stock);
	newProduct.setImageName(fileName);
	
	dao.addProduct(newProduct);
	
	
	PreparedStatement pstmt = null;
	String sql = "insert into product values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, productId);
	pstmt.setString(2, productName);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setLong(5, stock);
	pstmt.setString(6, fileName);
	
	pstmt.executeUpdate();
	
	
	if(pstmt != null)pstmt.close();
	if(conn != null)conn.close();
	
	response.sendRedirect("products.jsp");
	
%>
