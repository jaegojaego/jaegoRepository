package com.jaego.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SellerController {
	
	@RequestMapping(value="sellerMap", method = RequestMethod.GET)
	public String sellerJoin() {
		return "./Seller/sellerMap";
	}

}