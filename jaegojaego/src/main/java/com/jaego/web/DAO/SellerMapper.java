//20170321 박진우
package com.jaego.web.DAO;

import com.jaego.web.VO.Seller;

public interface SellerMapper {
	public void addSeller(Seller seller);
	public Seller selectOne(String id);
}