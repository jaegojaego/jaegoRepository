package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaego.web.DAO.MapsDao;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;
import com.jaego.web.VO.Favorite;



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
	
	@RequestMapping(value="map1", method=RequestMethod.GET)
	public String map1(){
		
		return "map/maps";
	}
	
	@RequestMapping(value="shopimg", method=RequestMethod.GET)
	public String download(String sellerCRN,HttpServletResponse response){
		String uploadPath = "/sellerImg";
		Seller seller = dao.shopimg(sellerCRN);
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(seller.getSellerShopOimg(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//����� ���� ���
		String fullPath = uploadPath +"/"+seller.getSellerShopSimg()+".jpg";
		
		
		//������ ������ ���� �Է� ��Ʈ��
		
		//Ŭ���̾�Ʈ���� ������ ��½�Ʈ��
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			//������ ���� ���� ��ƿ
			FileCopyUtils.copy(filein, fileout);
			filein.close();
			fileout.close();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="goodsimg", method=RequestMethod.GET)
	public String download2(String sellerCRN,String goodsCode,HttpServletResponse response){
		String uploadPath = "/goodsImg";
		Goods goods = dao.goodsimg(sellerCRN, goodsCode);
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(goods.getGoodsOimage(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//����� ���� ���
		String fullPath = uploadPath +"/"+goods.getGoodsSimage()+".jpg";
		
		
		//������ ������ ���� �Է� ��Ʈ��
		
		//Ŭ���̾�Ʈ���� ������ ��½�Ʈ��
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			//������ ���� ���� ��ƿ
			FileCopyUtils.copy(filein, fileout);
			filein.close();
			fileout.close();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value="markimg", method=RequestMethod.POST)
	public int mark(String sellerCRN){
		int mark = dao.markimg(sellerCRN);
		return mark;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="addshop", method=RequestMethod.GET)
	public String addshop(String sellerCRN,HttpSession session,Model model){
		Favorite favorite = new Favorite();

		String buyerid = (String) session.getAttribute("custid");
		favorite.setSellerCRN(sellerCRN);
		favorite.setBuyerId(buyerid);
		int result = dao.findfav(favorite);
		if(result==0){
			int result2 =dao.findfavs(favorite);
			if(result2<3){
				dao.addshop(favorite);
				return "add succeed";
			}else{
				return "take under 3 please";
			}
		}else{
			return "This shop is already added";
			
		} 
		//같은샵이있습니다
		 //3개이상은 안됩니다 
		
	}
	
	
	
}
