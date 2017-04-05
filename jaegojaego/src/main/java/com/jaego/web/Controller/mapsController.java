package com.jaego.web.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaego.web.DAO.MapsDao;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;



@Controller
public class mapsController {

	@Autowired
	private MapsDao dao;
	
	@ResponseBody
	@RequestMapping(value="Shoplist", method=RequestMethod.GET)
	public ArrayList<Seller> slist(){
		ArrayList<Seller> Shoplist = dao.Shoplist();
		return Shoplist;
	}
	
	@ResponseBody
	@RequestMapping(value="Goodslist", method=RequestMethod.POST)
	public ArrayList<Goods> goodsinfo(String sellerCRN){
		ArrayList<Goods> Goodslist = dao.Goodslist(sellerCRN);	
		return Goodslist;
	}
	
	@RequestMapping(value="zonemap", method=RequestMethod.GET)
	public String zonemap(){
		
		return "map/zone";
	}
	
	
	
}
