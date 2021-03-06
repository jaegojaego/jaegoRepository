package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.jaego.web.VO.Grade;
import com.jaego.web.VO.Seller;
import com.jaego.web.VO.Favorite;



@Controller
public class mapsController {

	@Autowired
	private MapsDao dao;
	
	@ResponseBody
	@RequestMapping(value="Shoplist", method=RequestMethod.GET)
	public ArrayList<Seller> slist(String sellerTOB){
		ArrayList<Seller> Shoplist = dao.Shoplist(sellerTOB);
		return Shoplist;
	}
	
	@ResponseBody
	@RequestMapping(value="Goodslist", method=RequestMethod.GET)
	public ArrayList<Goods> goodsinfo(String sellerCRN){
		ArrayList<Goods> Goodslist = dao.Goodslist(sellerCRN);	
		return Goodslist;
	}
	
	@RequestMapping(value="map1", method=RequestMethod.GET)
	public String map1(){
		return "map/maps";
	}
	
	//20170502 박진우 : 시원이 maps 테스트용
	@RequestMapping(value="mapPSW", method=RequestMethod.GET)
	public String mapPSW(){
		return "map/mapPSW";
	}	
	
	@RequestMapping(value="map2", method=RequestMethod.GET)
	public String map2(){
		
		return "map/maps2";
	}
	
	
	@RequestMapping(value="shopimg", method=RequestMethod.GET)
	public String download(String sellerCRN,HttpServletResponse response){
		String uploadPath = "/sellerShopOimg";
		Seller seller = dao.shopimg(sellerCRN);
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(seller.getSellerShopOimg(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//����� ���� ���
		String fullPath = uploadPath +"/"+seller.getSellerShopSimg();
		
	
		
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
	public String download2(String goodsCode,HttpServletResponse response){
		String uploadPath = "/goodsfile";
		Goods goods = dao.goodsimg(goodsCode);
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(goods.getGoodsOimage(), "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//����� ���� ���
		String fullPath = uploadPath +"/"+goods.getGoodsSimage();
		
		
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
	@RequestMapping(value="addshop", method=RequestMethod.GET,produces="application/text;charset=UTF-8")
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
				return "この店をブックマークしました。";
			}else{
				return "관심매장을 3개 이하로 선택해주세요.";
			}
		}else{
			return "この店をブックマークしました。";
			
		} 
		//같은샵이있습니다
		 //3개이상은 안됩니다 
		
	}



	//20170429 박진우 - 관심매장 삭제
	@ResponseBody
	@RequestMapping(value="delshop", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	public String delshop(String sellerCRN,HttpSession session,Model model){
		Favorite favorite = new Favorite();
		String buyerid = (String) session.getAttribute("custid");
		favorite.setSellerCRN(sellerCRN);
		favorite.setBuyerId(buyerid);

		int result = dao.findfav(favorite);
		if(result!=0){
			//지워야겠지...
			
			dao.delshop(favorite);
			return "관심매장에서 삭제하였습니다.";
		}else{
			return "관심매장이 아닙니다.";
		} 

	}



	@ResponseBody
	@RequestMapping(value="gradelist", method=RequestMethod.GET)
	public ArrayList<Grade> gradelist(String sellerCRN,HttpSession session){
		ArrayList<Grade> gradelist = dao.gradelist(sellerCRN);
	
		return gradelist;
	}
	
	
	@ResponseBody
	@RequestMapping(value="gradelist2", method=RequestMethod.GET)
	public HashMap<String, Object> gradelist2(String sellerCRN,String ment,int star,HttpSession session){
	
			String buyerId = (String) session.getAttribute("custid");
			Grade grade = new Grade();
			
			grade.setBuyerId(buyerId);
			grade.setMent(ment);
			grade.setSellerCRN(sellerCRN);
			grade.setStars(star);
			dao.addcomment(grade);
			ArrayList<Grade> gradelist = dao.gradelist(sellerCRN);
			HashMap<String, Object> a = new HashMap<String, Object>();
			double hmap = dao.starsac(sellerCRN);
			a.put("gradelist", gradelist);
			a.put("star", hmap);

			return a;

	}
	
	@ResponseBody
	@RequestMapping(value="starsac", method=RequestMethod.GET)
	public double starsac(String sellerCRN){
		double hmap = dao.starsac(sellerCRN);
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping(value="nostar", method=RequestMethod.POST)
	public int nostar(String sellerCRN,HttpSession session){
		String buyerId = (String) session.getAttribute("custid");
		int ns = dao.nostar(sellerCRN, buyerId);
		return ns;
	}
	
	@RequestMapping(value="test", method=RequestMethod.GET)
	public String test(){
		
		return "test";
	}
	

}
