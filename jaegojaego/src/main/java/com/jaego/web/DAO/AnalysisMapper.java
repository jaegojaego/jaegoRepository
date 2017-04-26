package com.jaego.web.DAO;

import java.util.HashMap;
import java.util.List;

import com.jaego.web.VO.Sales;
import com.jaego.web.VO.Seller;

public interface AnalysisMapper {


	public String select(String id);
	public List<HashMap> allmoney(String sellerCRN);
	public List<HashMap> month(String sellerCRN);
	public List<HashMap> circle(String sellerCRN);
	public List<HashMap> tcircle(String sellerCRN);



}