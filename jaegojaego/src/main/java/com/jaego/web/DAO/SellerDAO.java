//20170321 박진우
package com.jaego.web.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Seller;

@Repository		//DAO 객체에 사용하는 어노테이션
public class SellerDAO {

	@Autowired
	private SqlSession sqlsession;

	//판매자 추가
	public void addSeller(Seller seller) {
		SellerMapper mapper = sqlsession.getMapper(SellerMapper.class);
		mapper.addSeller(seller);
	}
	
	//판매자 검색
	public Seller selectOne(String id) {
		SellerMapper mapper = sqlsession.getMapper(SellerMapper.class);
		Seller seller = mapper.selectOne(id);
		return seller;
	}
	
}