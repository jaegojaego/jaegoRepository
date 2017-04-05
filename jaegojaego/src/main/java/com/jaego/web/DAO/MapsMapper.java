package com.jaego.web.DAO;

import java.util.ArrayList;

import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;

public interface MapsMapper {

	
	public ArrayList<Seller> Shoplist(); 
	public ArrayList<Goods> Goodslist(String sellerCRN);
	
}
