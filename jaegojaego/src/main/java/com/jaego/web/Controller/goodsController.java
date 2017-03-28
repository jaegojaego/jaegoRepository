package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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

import com.jaego.web.VO.Goods;
import com.jaego.web.DAO.GoodsDao;
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
		// String sellerCRN=(String) session.getAttribute("0000");
		String sellerCRN = "0";
		goods.setSellerCRN(sellerCRN);
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
		List<HashMap>result = dao.list();
		model.addAttribute("list",result);
		return "./goods/goodslist";
	}

	@RequestMapping(value = "goodsupdate", method = RequestMethod.GET)
	public String goodsupdate() {
		return "./goods/goodsupdate";
	}
	//상품수정
	@RequestMapping(value="rgoodsupdate",method=RequestMethod.POST)
	public String rgoodsupdate(Goods goods,HttpSession session,MultipartFile upload,Model model){
		// String sellerCRN=(String) session.getAttribute("0000");
				String sellerCRN = "0";
				goods.setSellerCRN(sellerCRN);
				String codenum="RZQAFUqz";
		//String codenum=goods.getGoodsCode();
		goods.setGoodsCode(codenum);
		
		//기존에첨부파일있다면 기존에파일을지우는것
		//새로파일을 작성
		String savefile = dao.selectOne(codenum).getGoodsSimage();
		if(!upload.isEmpty()){

			//업로드된 파일삭제
			
			FileService.deleteFile(uploadPath+"/"+savefile);//upload 실제 저장된경로 savefile파일이름과 확장자
		
		
			savefile = FileService.saveFile(upload, uploadPath);
	
			goods.setGoodsOimage(upload.getOriginalFilename());
			goods.setGoodsSimage(savefile);

		}
		
		dao.updateGoods(goods);
		List<HashMap>result = dao.list();
		model.addAttribute("list",result);
		
		return "./goods/goodslist";
	}
	
	//목록 가져오기
	@RequestMapping(value = "goodslist", method = RequestMethod.GET)
	public String goodslist(Model model){
		//날짜 띄우기
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
		String todate = today.format(new Date());
		model.addAttribute("todate",todate);
		
		List<HashMap>result = dao.list();
		System.out.println(result);//
		model.addAttribute("list",result);
		return "./goods/goodslist";
	}
	
	//사진
	@RequestMapping(value="download",method=RequestMethod.GET)
	public String download(String goodsCode,HttpServletResponse response){
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
		return "null";
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
	@RequestMapping(value="update", method = RequestMethod.GET)
	public int update(String goodsCode, int goodsQuantity){
		int result = dao.update(goodsQuantity, goodsCode);
		return result;
	}
}
