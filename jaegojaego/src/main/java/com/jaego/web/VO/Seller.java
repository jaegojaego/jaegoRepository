package com.jaego.web.VO;

public class Seller {

   private String sellerCRN;
   private String sellerId;
   private String sellerPw;
   private String sellerName; 
   private String sellerShopName; 
   private String sellerPhone;
   private String sellerEmail;
   private String sellerBEA;
   private String sellerTOB;
   private String sellerShopOimg; 
   private String sellerShopSimg; 
   private String sellerLat;
   private String sellerLong;
   
   
   
   private Seller() {
      super();
   }



   private Seller(String sellerCRN, String sellerId, String sellerPw, String sellerName, String sellerShopName,
         String sellerPhone, String sellerEmail, String sellerBEA, String sellerTOB, String sellerShopOimg,
         String sellerShopSimg, String sellerLat, String sellerLong) {
      super();
      this.sellerCRN = sellerCRN;
      this.sellerId = sellerId;
      this.sellerPw = sellerPw;
      this.sellerName = sellerName;
      this.sellerShopName = sellerShopName;
      this.sellerPhone = sellerPhone;
      this.sellerEmail = sellerEmail;
      this.sellerBEA = sellerBEA;
      this.sellerTOB = sellerTOB;
      this.sellerShopOimg = sellerShopOimg;
      this.sellerShopSimg = sellerShopSimg;
      this.sellerLat = sellerLat;
      this.sellerLong = sellerLong;
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
    * @return the sellerId
    */
   public String getSellerId() {
      return sellerId;
   }



   /**
    * @param sellerId the sellerId to set
    */
   public void setSellerId(String sellerId) {
      this.sellerId = sellerId;
   }



   /**
    * @return the sellerPw
    */
   public String getSellerPw() {
      return sellerPw;
   }



   /**
    * @param sellerPw the sellerPw to set
    */
   public void setSellerPw(String sellerPw) {
      this.sellerPw = sellerPw;
   }



   /**
    * @return the sellerName
    */
   public String getSellerName() {
      return sellerName;
   }



   /**
    * @param sellerName the sellerName to set
    */
   public void setSellerName(String sellerName) {
      this.sellerName = sellerName;
   }



   /**
    * @return the sellerShopName
    */
   public String getSellerShopName() {
      return sellerShopName;
   }



   /**
    * @param sellerShopName the sellerShopName to set
    */
   public void setSellerShopName(String sellerShopName) {
      this.sellerShopName = sellerShopName;
   }



   /**
    * @return the sellerPhone
    */
   public String getSellerPhone() {
      return sellerPhone;
   }



   /**
    * @param sellerPhone the sellerPhone to set
    */
   public void setSellerPhone(String sellerPhone) {
      this.sellerPhone = sellerPhone;
   }



   /**
    * @return the sellerEmail
    */
   public String getSellerEmail() {
      return sellerEmail;
   }



   /**
    * @param sellerEmail the sellerEmail to set
    */
   public void setSellerEmail(String sellerEmail) {
      this.sellerEmail = sellerEmail;
   }



   /**
    * @return the sellerBEA
    */
   public String getSellerBEA() {
      return sellerBEA;
   }



   /**
    * @param sellerBEA the sellerBEA to set
    */
   public void setSellerBEA(String sellerBEA) {
      this.sellerBEA = sellerBEA;
   }



   /**
    * @return the sellerTOB
    */
   public String getSellerTOB() {
      return sellerTOB;
   }



   /**
    * @param sellerTOB the sellerTOB to set
    */
   public void setSellerTOB(String sellerTOB) {
      this.sellerTOB = sellerTOB;
   }



   /**
    * @return the sellerShopOimg
    */
   public String getSellerShopOimg() {
      return sellerShopOimg;
   }



   /**
    * @param sellerShopOimg the sellerShopOimg to set
    */
   public void setSellerShopOimg(String sellerShopOimg) {
      this.sellerShopOimg = sellerShopOimg;
   }



   /**
    * @return the sellerShopSimg
    */
   public String getSellerShopSimg() {
      return sellerShopSimg;
   }



   /**
    * @param sellerShopSimg the sellerShopSimg to set
    */
   public void setSellerShopSimg(String sellerShopSimg) {
      this.sellerShopSimg = sellerShopSimg;
   }



   /**
    * @return the sellerLat
    */
   public String getSellerLat() {
      return sellerLat;
   }



   /**
    * @param sellerLat the sellerLat to set
    */
   public void setSellerLat(String sellerLat) {
      this.sellerLat = sellerLat;
   }



   /**
    * @return the sellerLong
    */
   public String getSellerLong() {
      return sellerLong;
   }



   /**
    * @param sellerLong the sellerLong to set
    */
   public void setSellerLong(String sellerLong) {
      this.sellerLong = sellerLong;
   }



   /* (non-Javadoc)
    * @see java.lang.Object#toString()
    */
   @Override
   public String toString() {
      return "Map [sellerCRN=" + sellerCRN + ", sellerId=" + sellerId + ", sellerPw=" + sellerPw + ", sellerName="
            + sellerName + ", sellerShopName=" + sellerShopName + ", sellerPhone=" + sellerPhone + ", sellerEmail="
            + sellerEmail + ", sellerBEA=" + sellerBEA + ", sellerTOB=" + sellerTOB + ", sellerShopOimg="
            + sellerShopOimg + ", sellerShopSimg=" + sellerShopSimg + ", sellerLat=" + sellerLat + ", sellerLong="
            + sellerLong + "]";
   }
   
   
   
   
}