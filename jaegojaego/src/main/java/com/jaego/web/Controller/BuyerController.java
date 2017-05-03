//박진우 : 구매자 컨트롤러
package com.jaego.web.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.DAO.BuyerDAO;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Seller;

@Controller
public class BuyerController {
	
	@Autowired
	private BuyerDAO bdao;

	@Autowired
	private SellerDAO sdao;

    @RequestMapping(value = "buyerupdateFormPJW", method = RequestMethod.GET)
    public String buyerupdatePJW(HttpSession session,/*String sellerId,*/Model model) {
       
       String buyerId = (String)session.getAttribute("custid");
       Buyer buyer = bdao.selectOne(buyerId);
       model.addAttribute("buyer",buyer);
       
       System.out.println("들어갈때"+buyer);
       return "./Buyer/buyerupdateFormPJW";
    }
	
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
		Buyer buyer = bdao.selectOne(idcheck_to_ctr);

		//Buyer도 체크하고, Seller도 체크
		if (buyer == null) {
			Seller seller = sdao.selectOne(idcheck_to_ctr);
			if (seller != null) {
				Buyer b = new Buyer();
				b.setBuyerId(seller.getSellerId());
				return b;
			}
		}
		
		return buyer;
	}	
	
	//박진우 - 20170320 : 판매자 가입
	@RequestMapping(value="buyerJoin", method = RequestMethod.POST)
	public String sellerJoin(Buyer buyer, MultipartFile upload) {
		System.out.println(buyer);
		bdao.addBuyer(buyer);
		return "./Buyer/buyerJoin";		//Q) redirect로 바꿀까...
	}

}