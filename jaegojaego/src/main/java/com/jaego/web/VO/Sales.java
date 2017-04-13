package com.jaego.web.VO;

public class Sales {

	private String sellerCRN;
	private String salesName;
	private String salesCode;
	private int salesPrice;
	private String salesTime;
	private int salesQuantity;
	
	public Sales(String sellerCRN, String salesName, String salesCode, int salesPrice, String salesTime,
			int salesQuantity) {
		super();
		this.sellerCRN = sellerCRN;
		this.salesName = salesName;
		this.salesCode = salesCode;
		this.salesPrice = salesPrice;
		this.salesTime = salesTime;
		this.salesQuantity = salesQuantity;
	}

	public Sales() {
		super();
	}

	public String getSellerCRN() {
		return sellerCRN;
	}

	public void setSellerCRN(String sellerCRN) {
		this.sellerCRN = sellerCRN;
	}

	public String getSalesName() {
		return salesName;
	}

	public void setSalesName(String salesName) {
		this.salesName = salesName;
	}

	public String getSalesCode() {
		return salesCode;
	}

	public void setSalesCode(String salesCode) {
		this.salesCode = salesCode;
	}

	public int getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}

	public String getSalesTime() {
		return salesTime;
	}

	public void setSalesTime(String salesTime) {
		this.salesTime = salesTime;
	}

	public int getSalesQuantity() {
		return salesQuantity;
	}

	public void setSalesQuantity(int salesQuantity) {
		this.salesQuantity = salesQuantity;
	}

	@Override
	public String toString() {
		return "Sales [sellerCRN=" + sellerCRN + ", salesName=" + salesName + ", salesCode=" + salesCode
				+ ", salesPrice=" + salesPrice + ", salesTime=" + salesTime + ", salesQuantity=" + salesQuantity + "]";
	}
	
	
}
