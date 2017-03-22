package com.jaego.web.VO;
//20170321권록헌
public class Goods {
	private String sellerCRN;
	private String goodsName;
	private int goodsPrice;
	private int goodsQuantity;
	private String goodsOimage;
	private String goodsSimage;
	private String goodsCode;
	private String goodsDateOfUpload;
	private String goodsDateOfUpdate;
	private String goodsStatus;
	private String goodsInfo;
	
	public Goods() {}

	public Goods(String goodsName, int goodsPrice, int goodsQuantity, String goodsOimage,
			String goodsSimage, String goodsCode, String goodsDateOfUpload, String goodsDateOfUpdate,
			String goodsStatus, String goodsInfo) {
		super();
		this.sellerCRN = sellerCRN;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsQuantity = goodsQuantity;
		this.goodsOimage = goodsOimage;
		this.goodsSimage = goodsSimage;
		this.goodsCode = goodsCode;
		this.goodsDateOfUpload = goodsDateOfUpload;
		this.goodsDateOfUpdate = goodsDateOfUpdate;
		this.goodsStatus = goodsStatus;
		this.goodsInfo = goodsInfo;
	}

	public String getSellerCRN() {
		return sellerCRN;
	}

	public void setSellerCRN(String sellerCRN) {
		this.sellerCRN = sellerCRN;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getGoodsQuantity() {
		return goodsQuantity;
	}

	public void setGoodsQuantity(int goodsQuantity) {
		this.goodsQuantity = goodsQuantity;
	}

	public String getGoodsOimage() {
		return goodsOimage;
	}

	public void setGoodsOimage(String goodsOimage) {
		this.goodsOimage = goodsOimage;
	}

	public String getGoodsSimage() {
		return goodsSimage;
	}

	public void setGoodsSimage(String goodsSimage) {
		this.goodsSimage = goodsSimage;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsDateOfUpload() {
		return goodsDateOfUpload;
	}

	public void setGoodsDateOfUpload(String goodsDateOfUpload) {
		this.goodsDateOfUpload = goodsDateOfUpload;
	}

	public String getGoodsDateOfUpdate() {
		return goodsDateOfUpdate;
	}

	public void setGoodsDateOfUpdate(String goodsDateOfUpdate) {
		this.goodsDateOfUpdate = goodsDateOfUpdate;
	}

	public String getGoodsStatus() {
		return goodsStatus;
	}

	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}

	public String getGoodsInfo() {
		return goodsInfo;
	}

	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}

	@Override
	public String toString() {
		return "goods [sellerCRN=" + sellerCRN + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", goodsQuantity=" + goodsQuantity + ", goodsOimage=" + goodsOimage + ", goodsSimage=" + goodsSimage
				+ ", goodsCode=" + goodsCode + ", goodsDateOfUpload=" + goodsDateOfUpload + ", goodsDateOfUpdate="
				+ goodsDateOfUpdate + ", goodsStatus=" + goodsStatus + ", goodsInfo=" + goodsInfo + "]";
	}
	
	
}
