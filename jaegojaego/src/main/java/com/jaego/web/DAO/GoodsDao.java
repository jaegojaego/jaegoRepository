//20170321권록헌
package com.jaego.web.DAO;

import java.util.HashMap;
import java.util.List;

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
	
	//검색기능
		public Goods selectOne(String goodscode){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			Goods goods = mapper.selectOne(goodscode);
			return goods;
		}
		
	//수정기능
		public int updateGoods(Goods goods){
			GoodsMapper mapper=sqlsession.getMapper(GoodsMapper.class);
			int result=0;
			try{
			result=mapper.updateGoods(goods);
			}catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
		
		//목록불러오기
		public List<HashMap>list(){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.list();
		}
		
		//사진
		public Goods selectPic(String goodsCode){
			GoodsMapper mapper= sqlsession.getMapper(GoodsMapper.class);
			Goods goods=mapper.selectPic(goodsCode);
			return goods;
		}
		
		//상품삭제하기
		public int del(String goodsCode){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.del(goodsCode);
		}
		
		//수량수정하기
		public int update(int goodsQuantity, String goodsCode){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.update(goodsQuantity,goodsCode);
		}
}
