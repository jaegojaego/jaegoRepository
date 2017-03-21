package com.jaego.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller		//박진우 : 판매자 컨트롤러
public class SellerController {

	@RequestMapping(value="sellerJoinForm", method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "./Seller/sellerJoinForm";
	}

	@RequestMapping(value="sellerMap", method = RequestMethod.GET)
	public String sellerJoin() {
		return "./Seller/sellerMap";
	}

}