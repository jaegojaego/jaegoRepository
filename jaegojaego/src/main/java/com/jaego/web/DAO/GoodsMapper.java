//20170321권록헌
package com.jaego.web.DAO;

import java.util.HashMap;
import java.util.List;

import com.jaego.web.VO.Goods;

public interface GoodsMapper {
	
public int insertGoods(Goods goods);//상품 등록
public Goods selectOne(String goodscode);//상품 코드검색
public int updateGoods(Goods goods);//상품 수정
public List<HashMap>list();//목록불러오기
public Goods select(String goodscode);//수정시 미리뜨게하는것
public Goods selectPic(String goodsCode);//사진
public int del(String goodsCode);//상품삭제	
public int update(int goodsQuantity, String goodsCode);//수량수정
}
