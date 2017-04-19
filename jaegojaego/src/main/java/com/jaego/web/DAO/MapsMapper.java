package com.jaego.web.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Grade;
import com.jaego.web.VO.Seller;

import com.jaego.web.VO.Favorite;

public interface MapsMapper {

	
	public ArrayList<Seller> Shoplist(String sellerTOB); 
	public ArrayList<Goods> Goodslist(String sellerCRN);
	public Seller shopimg(String sellerCRN);
	public Goods goodsimg(String sellerCRN,String goodsCode);
	public int markimg(String sellerCRN);
	public int findfav(Favorite favorite);
	public int findfavs(Favorite favorite);
	public int addshop(Favorite favorite);
	public ArrayList<Grade> gradelist(String sellerCRN);
	public void addcomment(Grade grade);
	public double starsac(String sellerCRN);
	public int nostar(String sellerCRN,String buyerId);
}
