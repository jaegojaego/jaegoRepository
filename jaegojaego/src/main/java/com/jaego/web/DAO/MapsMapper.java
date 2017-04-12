package com.jaego.web.DAO;

import java.util.ArrayList;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;
import com.jaego.web.VO.Favorite;

public interface MapsMapper {

	
	public ArrayList<Seller> Shoplist(); 
	public ArrayList<Goods> Goodslist(String sellerCRN);
	public Seller shopimg(String sellerCRN);
	public Goods goodsimg(String sellerCRN,String goodsCode);
	public int markimg(String sellerCRN);
	public int findfav(Favorite favorite);
	public int findfavs(Favorite favorite);
	public int addshop(Favorite favorite);
}
