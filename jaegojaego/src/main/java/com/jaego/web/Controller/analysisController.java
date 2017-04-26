//권록헌 매출분석
package com.jaego.web.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.set.SynchronizedSortedSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaego.web.DAO.AnalysisDAO;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.VO.Sales;
import com.jaego.web.VO.Seller;

@Controller

public class analysisController {

	
	@Autowired
	private AnalysisDAO dao;

	@RequestMapping(value = "analysis", method = RequestMethod.GET)
	public String analysis() {
		return "./analysis/goodsanalysis";
	}


	@RequestMapping(value = "analysis1", method = RequestMethod.GET)
	public String analysis1() {
		return "./analysis/goodsanalysis1";
	}

	@ResponseBody
	@RequestMapping(value = "analysismoney", method = RequestMethod.GET)		//라인 차트
	public List<HashMap> analysismoney(HttpSession session) {
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);
		System.out.println(sellerCRN);

		List<HashMap> result = dao.allmoney(sellerCRN);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "goodsanalysis", method = RequestMethod.GET)
	public String goodsanalysis() {
		return "./analysis/goodsanalysis";
	}
	@RequestMapping(value = "goodsanalysis2", method = RequestMethod.GET)
	public String goodsanalysis2() {
		return "./analysis/goodsanalysis2";
	}
	@RequestMapping(value = "goodsanalysis3", method = RequestMethod.GET)
	public String goodsanalysis3() {
		return "./analysis/goodsanalysis3";
	}
	@RequestMapping(value = "goodsanalysis4", method = RequestMethod.GET)
	public String goodsanalysis4() {
		return "./analysis/goodsanalysis4";
	}
	
	@ResponseBody
	@RequestMapping(value = "circle", method = RequestMethod.GET)
	public ArrayList<Object> circle(HttpSession session) {//총수량

		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);
		
		List<HashMap> result = dao.circle(sellerCRN);
		
		ArrayList<String> aList = new ArrayList();//  상품타이틀 리스트
		System.out.println("result="+result);
		ArrayList<Object> bList = new ArrayList();// 상품 이름,수량리스트
		ArrayList<Object> cList = new ArrayList();// a저장
		ArrayList<Object> dList = new ArrayList();//최종
		String a="타이틀";
		String b="상품";
		aList.add(a);
		aList.add(b);
		cList.add(aList);
		for (int i=0; i<result.size();i++){
			bList.add((String) result.get(i).get("SALESNAME"));
			bList.add(result.get(i).get("QUANTITY"));
			cList.add(bList);
			bList=new ArrayList();
		}
		System.out.println("bList="+bList);
		System.out.println("cList="+cList);
		
		dList.add(cList);
		System.out.println("dList="+dList);
		return dList;
		
	}
	@ResponseBody
	@RequestMapping(value = "todaycircle", method = RequestMethod.GET)
	public ArrayList<Object> todaycircle(HttpSession session) {//오늘 수량

		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);

		List<HashMap> result = dao.tcircle(sellerCRN);
		
		ArrayList<String> aList = new ArrayList();//  상품타이틀 리스트
		System.out.println("result="+result);
		ArrayList<Object> bList = new ArrayList();// 상품 이름,수량리스트
		ArrayList<Object> cList = new ArrayList();// a저장
		ArrayList<Object> dList = new ArrayList();//최종
		String a="타이틀";
		String b="상품";
		aList.add(a);
		aList.add(b);
		cList.add(aList);
		for (int i=0; i<result.size();i++){
			bList.add((String) result.get(i).get("SALESNAME"));
			bList.add(result.get(i).get("QUANTITY"));
			cList.add(bList);
			bList=new ArrayList();
		}
		System.out.println("bList="+bList);
		System.out.println("cList="+cList);
		
		dList.add(cList);
		System.out.println("dList="+dList);
		return dList;
		
	}

	
	@ResponseBody
	@RequestMapping(value = "analysismonth", method = RequestMethod.GET)
	public ArrayList<Object> analysismonth(HttpSession session) {//오늘자 막대

		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);

		List<HashMap> result = dao.month(sellerCRN);

		System.out.println(result);
		ArrayList<String> aList = new ArrayList();// 이름리스트
		ArrayList<Object> bList = new ArrayList();// 가격리스트	
		ArrayList<Object> cList = new ArrayList();// 총리스트
		
		
		
		aList.add("오늘");
		for (int i = 0; i < result.size(); i++) {
			
			String name = (String) result.get(i).get("SALESNAME");
			
				aList.add(name);

		}
		cList.add(aList);
		System.out.println(aList);
		bList.add("today");
		for (int j=0; j<result.size();j++){
			
			bList.add(result.get(j).get("PRICE"));
		}
		System.out.println(bList);
		
		cList.add(bList);
		System.out.println(cList);
		return cList;
				
						
	}

}

/*	@ResponseBody

	@RequestMapping(value = "analysismonth", method = RequestMethod.GET)
	public ArrayList<Object> analysismonth(HttpSession session) {

		String sellerCRN = "0";

		List<HashMap> result = dao.month(sellerCRN);

		ArrayList<String> bList = new ArrayList();// 수량리스트

		ArrayList<String> aList = new ArrayList();// 목록리스트
		ArrayList<Object> cList = new ArrayList();// 행리스트
		ArrayList<Object> dList = new ArrayList();// 전체리스트
		String month = "월별";
		aList.add(month);
		System.out.println(result);

		for (int i = 0; i < result.size(); i++) {
			
			String name = (String) result.get(i).get("SALESNAME");
			
				aList.add(name);

		}
		dList.add(aList);
		String date = "";

		for (int j = 0; j < result.size(); j++) {

			if (!date.equals(result.get(j).get("SALESTIME"))) {
				bList = new ArrayList<String>();
				date = (String) result.get(j).get("SALESTIME");
				bList.add(date);
				System.out.println(date);
				for (int x = 0; x < result.size(); x++) {

					String quantity = (String.valueOf(result.get(x).get("QUANTITY")));
					if (!quantity.equals(result.get(j).get("SALESTIME"))) {
						bList.add(quantity); //
						System.out.println("bList" + bList);
					}
					else{
						bList.add("0");
					}

				}
				cList.add(bList);
				break;
				// System.out.println("cList"+cList); }

			}

		}

		dList.add(cList);

		System.out.println("dList" + dList);
		return dList;
	}
}
*/