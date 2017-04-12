package com.jaego.web.VO;

public class Favorite {

	private String buyerId;
	private String sellerCRN;
	public Favorite() {
		super();
	}
	public Favorite(String buyerId, String sellerCRN) {
		super();
		this.buyerId = buyerId;
		this.sellerCRN = sellerCRN;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Favorite [buyerId=" + buyerId + ", sellerCRN=" + sellerCRN + "]";
	}
	
	
}
