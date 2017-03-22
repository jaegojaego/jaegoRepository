//20170321권록헌
package com.jaego.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Goods;

@Repository
public class GoodsDao {

	
	@Autowired
	private SqlSession sqlsession;
	//상품 구매 등록
	public int insertGoods(Goods goods){
		GoodsMapper mapper=sqlsession.getMapper(GoodsMapper.class);
		int result = 0;
		try{
		result=mapper.insertGoods(goods);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
}
