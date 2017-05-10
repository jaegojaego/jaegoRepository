//권록헌 매출분석
package com.jaego.web.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	
	@Autowired
	private SellerDAO sdao;

	@RequestMapping(value = "analysis", method = RequestMethod.GET)
	public String analysis() {
		return "./analysis/goodsanalysis";
	}

	//20170502 박진우 - 테스트
	@RequestMapping(value = "analysisPJW", method = RequestMethod.GET)
	public String analysisPJW() {
		return "./analysis/goodsanalysisPJW";
	}


	@RequestMapping(value = "analysis1", method = RequestMethod.GET)
	public String analysis1() {
		return "./analysis/goodsanalysis1";
	}

	@ResponseBody
	@RequestMapping(value = "analysismoney", method = RequestMethod.GET)		//라인 차트
	public List<HashMap> analysismoney(HttpSession session,String date1,String date2) {
		
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);
		List<HashMap> result = dao.allmoney(sellerCRN,date1,date2);
		
		return result;
	}
	
	@RequestMapping(value = "goodsanalysis", method = RequestMethod.GET)
	public String goodsanalysis() {
		return "./analysis/goodsanalysis";//총판매수량(원형)
	}
	@RequestMapping(value = "goodsanalysis2", method = RequestMethod.GET)
	public String goodsanalysis2() {
		return "./analysis/goodsanalysis2";//오늘 판매수량(원형)
	}
	@RequestMapping(value = "goodsanalysis3", method = RequestMethod.GET)
	public String goodsanalysis3() {
		return "./analysis/goodsanalysis3";//품목별 총 판매수익(점선)
	}
	@RequestMapping(value = "goodsanalysis4", method = RequestMethod.GET)
	public String goodsanalysis4() {
		return "./analysis/goodsanalysis4";//일별(막대)
	}
	
	@ResponseBody
	@RequestMapping(value = "circle", method = RequestMethod.GET)
	public ArrayList<Object> circle(HttpSession session,String date1,String date2) {//총수량
		
		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);
		
		
		List<HashMap> result = dao.circle(sellerCRN,date1,date2);		
		
		ArrayList<String> aList = new ArrayList();//  상품타이틀 리스트		
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
		
		dList.add(cList);
		return dList;
	}
	
	@ResponseBody
	@RequestMapping(value = "todaycircle", method = RequestMethod.GET)
	public ArrayList<Object> todaycircle(HttpSession session) {//오늘 수량

		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);
		
		List<HashMap> result = dao.tcircle(sellerCRN);
		
		ArrayList<String> aList = new ArrayList();//  상품타이틀 리스트
		
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
		
		dList.add(cList);
		
		
		return dList;
	}

	
	@ResponseBody
	@RequestMapping(value = "analysismonth", method = RequestMethod.GET)
	public ArrayList<Object> analysismonth(HttpSession session) {//오늘자 막대

		String sellerId = (String)session.getAttribute("custid");
		String sellerCRN=dao.select(sellerId);

		List<HashMap> result = dao.month(sellerCRN);

		ArrayList<String> aList = new ArrayList();// 이름리스트
		ArrayList<Object> bList = new ArrayList();// 가격리스트	
		ArrayList<Object> cList = new ArrayList();// 총리스트
		
		
		
		aList.add("오늘");
		for (int i = 0; i < result.size(); i++) {
			
			String name = (String) result.get(i).get("SALESNAME");
			
				aList.add(name);

		}
		cList.add(aList);
		bList.add("today");
		for (int j=0; j<result.size();j++){
			
			bList.add(result.get(j).get("PRICE"));
		}
		
		cList.add(bList);
		return cList;
				
						
	}

}

