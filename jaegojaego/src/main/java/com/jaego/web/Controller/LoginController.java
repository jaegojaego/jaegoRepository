//20170406 박진우
package com.jaego.web.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jaego.web.DAO.BuyerDAO;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Seller;

@Controller
public class LoginController {

	@Autowired
	private SellerDAO sdao;

	@Autowired
	private BuyerDAO bdao;	

	//판매자 로그인 폼 전송
	@RequestMapping(value="SellerLoginForm", method=RequestMethod.GET)
	public String SellerLoginForm(){	
		return "SellerLoginForm";
	}

	//구매자 로그인 폼 전송
	@RequestMapping(value="BuyerLoginForm", method=RequestMethod.GET)
	public String BuyerLoginForm(){	
		return "BuyerLoginForm";
	}
	
	//판매자 로그인 처리
	@RequestMapping(value="SellerLogin", method=RequestMethod.POST)
	public String SellerLoginForm(String custid, String password, HttpSession session, /*에러 메시지를 띄우고 싶다면 Model 사용*/Model model) {

		Seller seller = sdao.selectOne(custid);
		if (seller == null) {
			model.addAttribute("loginErr","로그인 정보가 틀렸습니다.");		//에러 메시지를 띄우고 싶다면 Model 사용
			return "SellerLoginForm";
		} else {
			if (seller.getSellerPw().equals(password)) {	//성공
				session.setAttribute("custid", seller.getSellerId());
				session.setAttribute("name", seller.getSellerName());
				session.setAttribute("type", "판매자");				
				session.setAttribute("sellerCRN", seller.getSellerCRN());
				session.setAttribute("sellerShopName", seller.getSellerShopName());
				return "redirect:/goodslist";
			} else {										//실패
				model.addAttribute("loginErr","로그인 정보가 틀렸습니다.");		//에러 메시지를 띄우고 싶다면 Model 사용
				return "SellerLoginForm";
			}
		}
	}

	//구매자 로그인 처리
	@RequestMapping(value="BuyerLogin", method=RequestMethod.POST)
	public String BuyerLoginForm(String custid, String password, HttpSession session, /*에러 메시지를 띄우고 싶다면 Model 사용*/Model model) {

		Buyer seller = bdao.selectOne(custid);
		if (seller == null) {
			model.addAttribute("loginErr","로그인 정보가 틀렸습니다.");		//에러 메시지를 띄우고 싶다면 Model 사용
			return "BuyerLoginForm";
		} else {
			if (seller.getBuyerPw().equals(password)) {	//성공
				session.setAttribute("custid", seller.getBuyerId());
				session.setAttribute("name", seller.getBuyerName());
				session.setAttribute("type", "구매자");
				return "redirect:/map1";
			} else {										//실패
				model.addAttribute("loginErr","로그인 정보가 틀렸습니다.");		//에러 메시지를 띄우고 싶다면 Model 사용
				return "BuyerLoginForm";
			}
		}
	}

	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("custid");
		session.removeAttribute("name");
		session.removeAttribute("type");				
		session.removeAttribute("sellerCRN");
		session.removeAttribute("sellerShopName");		
		return "redirect:/";	
	}
	
	//JOIN선택창
	@RequestMapping(value="homejoin", method=RequestMethod.GET)
	public String homejoin(){	
		return "home-join";
	}
	
	//로그인선택창
	@RequestMapping(value="homelogin", method=RequestMethod.GET)
	public String homelogin(){	
		return "home-login";
	}
	
}