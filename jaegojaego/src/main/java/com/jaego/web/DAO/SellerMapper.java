package com.jaego.web.DAO;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;

public interface SellerMapper {
   public void addSeller(Seller seller);
   public Seller selectOne(String id);
   public int updateSeller(Seller seller);//판매자정보수정 권록헌
   public Seller selectPic1(String sellerId);//사진권록헌
}








////////////////////////////////////////////////////////////////////////////////
/*
//20170321 박진우
package com.jaego.web.DAO;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;

public interface SellerMapper {
	public void addSeller(Seller seller);
	public Seller selectOne(String id);
}
*/