package dto;

public class Product {
	String ProductId, Pname, Description, Category, Manufacturer, Condition;
	String imageName;
	int UnitPrice, quantity;
	long UnitsInStock;
	
	public Product() {
		super();
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Product(String ProductId, String Pname, int UnitPrice) {
		setImageName(imageName);
		setProductId(ProductId);
		setPname(Pname);
		setUnitPrice(UnitPrice);
	}
	
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getManufacturer() {
		return Manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		Manufacturer = manufacturer;
	}
	public String getCondition() {
		return Condition;
	}
	public void setCondition(String condition) {
		Condition = condition;
	}
	public int getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		UnitPrice = unitPrice;
	}
	public long getUnitsInStock() {
		return UnitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		UnitsInStock = unitsInStock;
	}
	

	
	
	
}
