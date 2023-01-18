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
	String sql = "update product set pName = ?, pPrice = ?, pInfo = ? , pStock = ? , pImage = ? where pId = ?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(6, productId);
	pstmt.setString(1, productName);
	pstmt.setInt(2, price);
	pstmt.setString(3, description);
	pstmt.setLong(4, stock);
	pstmt.setString(5, fileName);
	
	pstmt.executeUpdate();
	System.out.println("수정 완료");
	
	if(pstmt != null)pstmt.close();
	if(conn != null)conn.close();
	
	response.sendRedirect("editproduct.jsp");
	
%>