package com.jaego.web.VO;

public class Grade {

	private int stars;
	private String ment;
	private String buyerId;
	private String sellerCRN;
	private String inputDate;
	
	public Grade() {
		super();
	}

	public Grade(int stars, String ment, String buyerId, String sellerCRN, String inputDate) {
		super();
		this.stars = stars;
		this.ment = ment;
		this.buyerId = buyerId;
		this.sellerCRN = sellerCRN;
		this.inputDate = inputDate;
	}

	/**
	 * @return the stars
	 */
	public int getStars() {
		return stars;
	}

	/**
	 * @param stars the stars to set
	 */
	public void setStars(int stars) {
		this.stars = stars;
	}

	/**
	 * @return the ment
	 */
	public String getMent() {
		return ment;
	}

	/**
	 * @param ment the ment to set
	 */
	public void setMent(String ment) {
		this.ment = ment;
	}

	/**
	 * @return the buyerId
	 */
	public String getBuyerId() {
		return buyerId;
	}

	/**
	 * @param buyerId the buyerId to set
	 */
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
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
	 * @return the inputDate
	 */
	public String getInputDate() {
		return inputDate;
	}

	/**
	 * @param inputDate the inputDate to set
	 */
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Grade [stars=" + stars + ", ment=" + ment + ", buyerId=" + buyerId + ", sellerCRN=" + sellerCRN
				+ ", inputDate=" + inputDate + "]";
	}
	
}
