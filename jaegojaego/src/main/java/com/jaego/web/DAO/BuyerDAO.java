//20170405 박진우
package com.jaego.web.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Buyer;

@Repository
public class BuyerDAO {

	@Autowired
	private SqlSession sqlsession;
	
	//구매자 추가
	public void addBuyer(Buyer buyer) {
		BuyerMapper mapper = sqlsession.getMapper(BuyerMapper.class);
		mapper.addBuyer(buyer);
	}

	//판매자 검색
	public Buyer selectOne(String id) {
		BuyerMapper mapper = sqlsession.getMapper(BuyerMapper.class);
		Buyer buyer = mapper.selectOne(id);
		return buyer;
	}
	
}
