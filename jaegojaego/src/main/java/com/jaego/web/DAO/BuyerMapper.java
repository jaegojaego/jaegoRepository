//20170405 박진우
package com.jaego.web.DAO;

import com.jaego.web.VO.Buyer;

public interface BuyerMapper {
	public void addBuyer(Buyer buyer);
	public Buyer selectOne(String id);	
}