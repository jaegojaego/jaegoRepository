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
	private String expiredDate;
	
	public Goods() {}

	public Goods(String sellerCRN, String goodsName, int goodsPrice, int goodsQuantity, String goodsOimage,
			String goodsSimage, String goodsCode, String goodsDateOfUpload, String goodsDateOfUpdate,
			String goodsStatus, String goodsInfo, String expiredDate) {
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
		this.expiredDate = expiredDate;
	}

	/**
	 * @return the sellerCRN
	 */
	public String getSellerCRN() {
		return sellerCRN;
	}

	/**
	 * @param sellerCRN the sellerCRN to set
	 */
	public void setSellerCRN(String sellerCRN) {
		this.sellerCRN = sellerCRN;
	}

	/**
	 * @return the goodsName
	 */
	public String getGoodsName() {
		return goodsName;
	}

	/**
	 * @param goodsName the goodsName to set
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	/**
	 * @return the goodsPrice
	 */
	public int getGoodsPrice() {
		return goodsPrice;
	}

	/**
	 * @param goodsPrice the goodsPrice to set
	 */
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	/**
	 * @return the goodsQuantity
	 */
	public int getGoodsQuantity() {
		return goodsQuantity;
	}

	/**
	 * @param goodsQuantity the goodsQuantity to set
	 */
	public void setGoodsQuantity(int goodsQuantity) {
		this.goodsQuantity = goodsQuantity;
	}

	/**
	 * @return the goodsOimage
	 */
	public String getGoodsOimage() {
		return goodsOimage;
	}

	/**
	 * @param goodsOimage the goodsOimage to set
	 */
	public void setGoodsOimage(String goodsOimage) {
		this.goodsOimage = goodsOimage;
	}

	/**
	 * @return the goodsSimage
	 */
	public String getGoodsSimage() {
		return goodsSimage;
	}

	/**
	 * @param goodsSimage the goodsSimage to set
	 */
	public void setGoodsSimage(String goodsSimage) {
		this.goodsSimage = goodsSimage;
	}

	/**
	 * @return the goodsCode
	 */
	public String getGoodsCode() {
		return goodsCode;
	}

	/**
	 * @param goodsCode the goodsCode to set
	 */
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	/**
	 * @return the goodsDateOfUpload
	 */
	public String getGoodsDateOfUpload() {
		return goodsDateOfUpload;
	}

	/**
	 * @param goodsDateOfUpload the goodsDateOfUpload to set
	 */
	public void setGoodsDateOfUpload(String goodsDateOfUpload) {
		this.goodsDateOfUpload = goodsDateOfUpload;
	}

	/**
	 * @return the goodsDateOfUpdate
	 */
	public String getGoodsDateOfUpdate() {
		return goodsDateOfUpdate;
	}

	/**
	 * @param goodsDateOfUpdate the goodsDateOfUpdate to set
	 */
	public void setGoodsDateOfUpdate(String goodsDateOfUpdate) {
		this.goodsDateOfUpdate = goodsDateOfUpdate;
	}

	/**
	 * @return the goodsStatus
	 */
	public String getGoodsStatus() {
		return goodsStatus;
	}

	/**
	 * @param goodsStatus the goodsStatus to set
	 */
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}

	/**
	 * @return the goodsInfo
	 */
	public String getGoodsInfo() {
		return goodsInfo;
	}

	/**
	 * @param goodsInfo the goodsInfo to set
	 */
	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}

	/**
	 * @return the expiredDate
	 */
	public String getExpiredDate() {
		return expiredDate;
	}

	/**
	 * @param expiredDate the expiredDate to set
	 */
	public void setExpiredDate(String expiredDate) {
		this.expiredDate = expiredDate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Goods [sellerCRN=" + sellerCRN + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", goodsQuantity=" + goodsQuantity + ", goodsOimage=" + goodsOimage + ", goodsSimage=" + goodsSimage
				+ ", goodsCode=" + goodsCode + ", goodsDateOfUpload=" + goodsDateOfUpload + ", goodsDateOfUpdate="
				+ goodsDateOfUpdate + ", goodsStatus=" + goodsStatus + ", goodsInfo=" + goodsInfo + ", expiredDate="
				+ expiredDate + "]";
	}

	
	
}