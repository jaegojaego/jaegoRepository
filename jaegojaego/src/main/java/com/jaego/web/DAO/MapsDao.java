package com.jaego.web.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Grade;
import com.jaego.web.VO.Seller;
import com.jaego.web.DAO.MapsMapper;
import com.jaego.web.VO.Favorite;


@Repository
public class MapsDao {

	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<Seller> Shoplist(String sellerTOB){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		ArrayList<Seller> Shoplist = mapper.Shoplist(sellerTOB);
		return Shoplist;
		
		
	}
	
	public ArrayList<Goods> Goodslist(String sellerCRN){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		ArrayList<Goods> Goodslist = mapper.Goodslist(sellerCRN);
		return Goodslist;
	}
	
	
	public Seller shopimg(String sellerCRN){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		Seller s = mapper.shopimg(sellerCRN);

		return s;
	}
	
	public Goods goodsimg(String sellerCRN,String goodsCode){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		Goods g = mapper.goodsimg(sellerCRN, goodsCode);

		return g;
	}
	
	public int markimg(String sellerCRN){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		int mark = mapper.markimg(sellerCRN);

		return mark;
	}	

	public int findfav(Favorite favorite){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		int result = mapper.findfav(favorite);
		return result;
		
	}
	
	public int findfavs(Favorite favorite){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		int result = mapper.findfavs(favorite);
		return result;
		
	}
	public int addshop(Favorite favorite){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		int result = mapper.addshop(favorite);
		return result;
	}
	
	public ArrayList<Grade> gradelist(String sellerCRN){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		ArrayList<Grade> gradelist = mapper.gradelist(sellerCRN);
		return gradelist;
		
		
	}
	
	public void addcomment(Grade grade){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		mapper.addcomment(grade);
	}
	
	public double starsac(String sellerCRN){
		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		System.out.println("1"+sellerCRN);
		double starhash = mapper.starsac(sellerCRN);
		System.out.println("2"+starhash);
		return starhash;
		
		
	}
	
	public int nostar(String sellerCRN,String buyerId){

		MapsMapper mapper = sqlsession.getMapper(MapsMapper.class);
		int nostar = mapper.nostar(sellerCRN, buyerId);

		return nostar;
	}	

	
}
