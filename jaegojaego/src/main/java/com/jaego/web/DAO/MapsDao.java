package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;


@Repository
public class MapsDao {

	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<Seller> Shoplist(){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		ArrayList<Seller> Shoplist = mapper.Shoplist();
		return Shoplist;
		
		
	}
	
	public ArrayList<Goods> Goodslist(String sellerCRN){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		ArrayList<Goods> Goodslist = mapper.Goodslist(sellerCRN);
		return Goodslist;
	}
	
}
