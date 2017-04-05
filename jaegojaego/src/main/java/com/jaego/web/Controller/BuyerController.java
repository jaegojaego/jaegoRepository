//박진우 : 구매자 컨트롤러
package com.jaego.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.DAO.BuyerDAO;
import com.jaego.web.VO.Buyer;

@Controller
public class BuyerController {
	
	@Autowired
	private BuyerDAO dao;

	//박진우 - 20170329 회원가입 : 부트스트랩 적용
	@RequestMapping(value="buyerJoinForm", method = RequestMethod.GET)
	public String BuyerJoinForm() {
		return "./Buyer/buyerJoinForm";
	}
	
	//박진우 - ID 체크 폼 불러오기
	@RequestMapping(value="buyerIDcheck",method=RequestMethod.GET)
	public String BuyerIDcheck() {
		return "./Buyer/buyerIDcheck";
	}
	
	//박진우 - 실제 ID 체크(DB 조회)
	@ResponseBody		//★ Ajax 통신에서는 이 @ResponseBody를 붙여줘야 함!
	@RequestMapping(value="buyerIDcheck",method=RequestMethod.POST)
	public Buyer BuyerIDcheck(String idcheck_to_ctr) {
		System.out.println(idcheck_to_ctr);
		Buyer buyer = dao.selectOne(idcheck_to_ctr);
		return buyer;
	}	
	
	//박진우 - 20170320 : 판매자 가입
	@RequestMapping(value="buyerJoin", method = RequestMethod.POST)
	public String sellerJoin(Buyer buyer, MultipartFile upload) {
		System.out.println(buyer);
		dao.addBuyer(buyer);
		return "./Buyer/buyerJoin";		//Q) redirect로 바꿀까...
	}

}