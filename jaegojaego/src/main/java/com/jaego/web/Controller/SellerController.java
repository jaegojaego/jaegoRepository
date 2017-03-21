package com.jaego.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jaego.web.VO.Seller;

@Controller		//박진우 : 판매자 컨트롤러
public class SellerController {

	@RequestMapping(value="sellerJoinForm", method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "./Seller/sellerJoinForm";
	}

	@RequestMapping(value="sellerMap", method = RequestMethod.GET)
	public String sellerMap() {
		return "./Seller/sellerMap";
	}
	
	@RequestMapping(value="sellerJoin", method = RequestMethod.POST)
	public String sellerJoin(Seller seller) {
		System.out.println(seller);
		return "./Seller/sellerJoin";
	}

}