package com.jaego.web.VO;

public class Buyer {
	
	private String buyerId;
	private String buyerPw;
	private String buyerName;
	private String buyerPhone;
	private String buyerEmail;
	private String buyerStatus;
	private String buyerDateOfJoin;
	private String buyerDateOfUpdate;
	private String buyerDateOfDelete;

	public Buyer(String buyerId, String buyerPw, String buyerName, String buyerPhone, String buyerEmail, String buyerStatus, String buyerDateOfJoin, String buyerDateOfUpdate, String buyerDateOfDelete) {
		this.buyerId = buyerId;
		this.buyerPw = buyerPw;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.buyerEmail = buyerEmail;
		this.buyerStatus = buyerStatus;
		this.buyerDateOfJoin = buyerDateOfJoin;
		this.buyerDateOfUpdate = buyerDateOfUpdate;
		this.buyerDateOfDelete = buyerDateOfDelete;
	}
	
	public Buyer() {
		
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getBuyerPw() {
		return buyerPw;
	}

	public void setBuyerPw(String buyerPw) {
		this.buyerPw = buyerPw;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerStatus() {
		return buyerStatus;
	}

	public void setBuyerStatus(String buyerStatus) {
		this.buyerStatus = buyerStatus;
	}

	public String getBuyerDateOfJoin() {
		return buyerDateOfJoin;
	}

	public void setBuyerDateOfJoin(String buyerDateOfJoin) {
		this.buyerDateOfJoin = buyerDateOfJoin;
	}

	public String getBuyerDateOfUpdate() {
		return buyerDateOfUpdate;
	}

	public void setBuyerDateOfUpdate(String buyerDateOfUpdate) {
		this.buyerDateOfUpdate = buyerDateOfUpdate;
	}

	public String getBuyerDateOfDelete() {
		return buyerDateOfDelete;
	}

	public void setBuyerDateOfDelete(String buyerDateOfDelete) {
		this.buyerDateOfDelete = buyerDateOfDelete;
	}

	@Override
	public String toString() {
		return "Buyer [buyerId=" + buyerId + ", buyerPw=" + buyerPw + ", buyerName=" + buyerName + ", buyerPhone=" + buyerPhone + ", buyerEmail=" + buyerEmail + ", buyerStatus=" + buyerStatus + ", buyerDateOfJoin=" + buyerDateOfJoin + ", buyerDateOfUpdate=" + buyerDateOfUpdate + ", buyerDateOfDelete=" + buyerDateOfDelete + "]";
	}

}