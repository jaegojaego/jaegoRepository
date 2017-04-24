//20170321권록헌
package com.jaego.web.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Sales;

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
		//수정시 모든목록
		public Goods select(String goodsCode){
			GoodsMapper mapper= sqlsession.getMapper(GoodsMapper.class);
			Goods goods=mapper.select(goodsCode);
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
		
		//판매자 아이디 가져오기
		public String sellerCRN(String sellerId){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.sellerCRN(sellerId);
		}
		
		//목록불러오기
		public ArrayList<Goods>list(String sellerCRN){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.list(sellerCRN);
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
		
		//판매분석 정보 등록
		public int insertsales(Sales sales){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.insertsales(sales);
		}
		
		//상품 상태 변경(on/off)
		public int updatestatus(String goodsCode, String goodsStatus){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.updatestatus(goodsCode, goodsStatus);
		}
		
		//상품 정보 가져오기(문자보내기)
		public ArrayList<HashMap<String,Object>>sendinfo(String sellerCRN){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.sendinfo(sellerCRN);
		}
		
		//관심매장등록한 유저 전화번호 가져오기
		public ArrayList<Buyer>phone(String sellerCRN){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.phone(sellerCRN);
		}
		
		//관심매장 추가한 고객 ID 가져오기
		public ArrayList<Buyer> buyer_id(String sellerCRN){
			GoodsMapper mapper = sqlsession.getMapper(GoodsMapper.class);
			return mapper.buyer_id(sellerCRN);
		}
}
