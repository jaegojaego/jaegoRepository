//20170321권록헌
package com.jaego.web.DAO;

import com.jaego.web.VO.Goods;

public interface GoodsMapper {
	
public int insertGoods(Goods goods);//상품 등록
public Goods selectOne(String goodscode);//상품 코드검색
public int updateGoods(Goods goods);//상품 수정
}
