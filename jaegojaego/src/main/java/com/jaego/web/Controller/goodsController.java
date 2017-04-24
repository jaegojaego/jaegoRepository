package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
//20170321권록헌
import java.util.Random;

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
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Sales;
import com.google.gson.Gson;
import com.jaego.web.DAO.GoodsDao;
import com.jaego.web.Util.ExampleSend;
import com.jaego.web.Util.FileService;

@Controller
public class goodsController {

	final String uploadPath = "/goodsfile";
	@Autowired
	GoodsDao dao;

	// 목록에서 value값을 넣으면 이동
	@RequestMapping(value = "goodsinsert", method = RequestMethod.GET)
	public String goodsinsert() {
		return "./goods/goodsinsert";
	}

	// 상품등록부컨트롤러
	@RequestMapping(value = "rgoodsinsert", method = RequestMethod.POST)
	public String rgoodsinsert(Goods goods, HttpSession session, MultipartFile upload,Model model) {
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		goods.setSellerCRN(sellerCRN);//goods에 등록!
		// 상품코드함수
		int codeSize = 1;
		final char[] possiblecode = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };
		final int possiblecodenum = possiblecode.length;
		String[] arr = new String[codeSize];
		Random rnd = new Random();
		int currentindex = 0;
		int i = 0;
		String codenum = null;

		while (currentindex < codeSize) {
			StringBuffer buf = new StringBuffer(16);
			for (i = 8; i > 0; i--) {
				buf.append(possiblecode[rnd.nextInt(possiblecodenum)]);
			}
			codenum = buf.toString();
			arr[currentindex] = codenum;

			if (dao.selectOne(codenum) == null) {
				currentindex++;
				break;
			} else {
				continue;
			}
		}

		goods.setGoodsCode(codenum);
		// file저장
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			goods.setGoodsOimage(upload.getOriginalFilename());
			goods.setGoodsSimage(savedfile);
		}
		dao.insertGoods(goods);
		ArrayList<Goods> result = dao.list(sellerCRN);
		model.addAttribute("list",result);
		return "redirect:goodslist";
	}
	@RequestMapping(value = "goodsupdate", method = RequestMethod.GET)
	public String goodsupdate(String goodsCode,Model model) {
		Goods goods=dao.select(goodsCode);
		model.addAttribute("goods",goods);
		System.out.println("야호여기야여기"+goods);
		return "./goods/goodsupdate";
		
	}
	//상품수정
	@RequestMapping(value="rgoodsupdate",method=RequestMethod.POST)
	public String rgoodsupdate(Goods goods,HttpSession session,MultipartFile upload,Model model){
		// String sellerCRN=(String) session.getAttribute("0000");
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
				//String codenum="R3QncP8f";
				//goods.setGoodsCode(codenum);
		String codenum=goods.getGoodsCode();
		System.out.println(codenum);
		System.out.println("수정된 상품 : " + goods);
		//기존에첨부파일있다면 기존에파일을지우는것
		//새로파일을 작성
		String savefile = dao.select(codenum).getGoodsSimage();
		if(!upload.isEmpty()){

			//업로드된 파일삭제
			
			FileService.deleteFile(uploadPath+"/"+savefile);//upload 실제 저장된경로 savefile파일이름과 확장자
		
		
			savefile = FileService.saveFile(upload, uploadPath);
	
			goods.setGoodsOimage(upload.getOriginalFilename());
			goods.setGoodsSimage(savefile);

		}
		
		dao.updateGoods(goods);
		ArrayList<Goods> result = dao.list(sellerCRN);
		model.addAttribute("list",result);
		
		return "redirect:goodslist";
	}
	
	//목록 가져오기
	@RequestMapping(value = "goodslist", method = RequestMethod.GET)
	public String goodslist(Model model,HttpSession session){
		//날짜 띄우기
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
		String todate = today.format(new Date());
		model.addAttribute("todate",todate);
		
		//목록 가져오기
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		ArrayList<Goods> result = dao.list(sellerCRN);
		System.out.println("목록가져왕:"+result);//
		model.addAttribute("list",result);
		return "./goods/goodslist";
	}
	
	@RequestMapping(value = "goodslist3", method = RequestMethod.GET)
	public String goodslist3(Model model,HttpSession session){
		//날짜 띄우기
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
		String todate = today.format(new Date());
		model.addAttribute("todate",todate);
		
		//목록 가져오기
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		ArrayList<Goods> result = dao.list(sellerCRN);
		System.out.println("목록가져왕:"+result);//
		model.addAttribute("list",result);
		return "./goods/goodslist3";
	}

	@RequestMapping(value = "goodslist4", method = RequestMethod.GET)
	public String goodslist4(Model model,HttpSession session){
		//날짜 띄우기
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
		String todate = today.format(new Date());
		model.addAttribute("todate",todate);
		
		//목록 가져오기
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		ArrayList<Goods> result = dao.list(sellerCRN);
		System.out.println("목록가져왕:"+result);//
		model.addAttribute("list",result);
		return "./goods/goodslist4";
	}
	
	
	//사진
	@RequestMapping(value="download",method=RequestMethod.GET)
	public void download(String goodsCode,HttpServletResponse response){
		Goods goods=dao.selectPic(goodsCode);
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(goods.getGoodsOimage(),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//저장된 파일 경로
		String fullPath=uploadPath +"/"+goods.getGoodsSimage();
		//서버의 파일을 읽을 입력 스트림
		//클라이언트에게 전달할 출력 스트림
		FileInputStream fis=null;
		ServletOutputStream sos=null;
		try {
			fis=new FileInputStream(fullPath);
			sos=response.getOutputStream();
			//Spring 파일 관련 유틸
			FileCopyUtils.copy(fis, sos);
			fis.close();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//삭제하기
	@ResponseBody
	@RequestMapping(value="del", method = RequestMethod.GET)
	public int del(String goodsCode){
		int result = dao.del(goodsCode);
		return result;
	}
	
	//수량 수정
	@ResponseBody
	@RequestMapping(value="update", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String update(String goodsCode, int goodsQuantity,HttpSession session){
		//수량 수정
		int result = dao.update(goodsQuantity, goodsCode);
		
		//favorite 상품 정보 가져오기
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		ArrayList<HashMap<String,Object>> resultinfo = dao.sendinfo(sellerCRN);
		System.out.println("favorite상품이야!"+resultinfo);//
			
		String text = "";
		int i;
		text += "★"+resultinfo.get(0).get("SELLERSHOPNAME")+"의 재고소식★"+"\n";
		for(i=0; i<resultinfo.size(); i++){
			text += "상품 : " + resultinfo.get(i).get("GOODSNAME")+"\n";
			text += "가격 : " + resultinfo.get(i).get("GOODSPRICE")+"\n";
			text += "수량 : " + resultinfo.get(i).get("GOODSQUANTITY")+"\n";
			text += "----------------------------"+"\n";
		}
		//System.out.println(text);

		ArrayList<Buyer>buyerphonelist = dao.phone(sellerCRN);
		String phone = "";
		for(int j=0; j<buyerphonelist.size(); j++){
			if(j!=buyerphonelist.size()-1){
				phone += buyerphonelist.get(j).getBuyerPhone()+",";
			}else{
				phone += buyerphonelist.get(j).getBuyerPhone();
			}
		}
		System.out.println("받아온 buyer정보들"+dao.phone(sellerCRN));
		System.out.println("phone번호들!"+phone);
			
		//문자보내기
		//ExampleSend send = new ExampleSend();//
		//send.main(text,phone);//
		System.out.println("sellerCRN : "+sellerCRN);
		ArrayList<Buyer> buyer_id = dao.buyer_id(sellerCRN);
		System.out.println("구매자id들"+buyer_id);
		HashMap<String, Object>content = new HashMap<String, Object>();
		String shopname = resultinfo.get(0).get("SELLERSHOPNAME")+"의 상품목록이 변경되었습니다.";
		content.put("shopname", shopname);
		content.put("buyer_id", buyer_id);
		Gson gson = new Gson();
		System.out.println("보내는 값(shopname,buyer_id)"+content);
		return gson.toJson(content);
		}
	
	//판매분석 테이블
	@ResponseBody
	@RequestMapping(value="insertsales", method=RequestMethod.GET)
	public int insertsales(Sales sales,HttpSession session){
		//System.out.println("넘어온sales값들:"+sales);
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN = dao.sellerCRN(sellerId);
		sales.setSellerCRN(sellerCRN);
		//System.out.println("판매기록setsellerCRN"+sales);
		int result = dao.insertsales(sales);
		return result;
	}
		
	//상품상태수정
	@ResponseBody
	@RequestMapping(value="updatestatus", method=RequestMethod.GET)
	public int updatestatus(String goodsCode, String goodsStatus){
		//System.out.println(goodsCode+"와"+goodsStatus);
		int result = dao.updatestatus(goodsCode, goodsStatus);
		return result;
	}
}
