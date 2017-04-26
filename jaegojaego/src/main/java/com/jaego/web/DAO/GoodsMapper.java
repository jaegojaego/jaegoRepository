//20170321권록헌
package com.jaego.web.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Sales;



public interface GoodsMapper {
	
public int insertGoods(Goods goods);//상품 등록
public Goods selectOne(String goodscode);//상품 코드검색
public int updateGoods(Goods goods);//상품 수정
public String sellerCRN(String sellerId);//판매자 아이디 가져오기
public ArrayList<Goods>list(String sellerCRN);//목록불러오기
public Goods select(String goodsCode);//수정시 미리뜨게하는것
public Goods selectPic(String goodsCode);//사진
public int del(String goodsCode);//상품삭제	
public int update(int goodsQuantity, String goodsCode);//수량수정
public int insertsales(Sales sales);//판매분석 정보 등록
public int updatestatus(String goodsCode, String goodsStatus);//상품 상태 변경(on/off)
public ArrayList<HashMap<String,Object>>sendinfo(String sellerCRN);//상품 정보 가져오기(문자보내기)
public ArrayList<Buyer>phone(String sellerCRN);//관심매장등록한 유저 전화번호 가져오기
public ArrayList<Buyer>buyer_id(String sellerCRN);//관심매장 추가한 고객 ID 가져오기
public HashMap<String, Object>insertpush(String goodsCode);//status변경시 상품등록 알림하기 위해 가게이름, 상품이름 가져오기
}
