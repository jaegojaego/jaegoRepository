package com.jaego.web.DAO;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.Sales;
import com.jaego.web.VO.Seller;

@Repository
public class AnalysisDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public String select(String id){
		AnalysisMapper mapper= sqlsession.getMapper(AnalysisMapper.class);
		return mapper.select(id);
		
	}
	
	public List<HashMap> allmoney(String sellerCRN,String date1,String date2){
		AnalysisMapper mapper= sqlsession.getMapper(AnalysisMapper.class);
		return mapper.allmoney(sellerCRN,date1,date2);
	}
	public List<HashMap> month(String sellerCRN){
		AnalysisMapper mapper= sqlsession.getMapper(AnalysisMapper.class);
		return mapper.month(sellerCRN);
	}
	public List<HashMap> circle(String sellerCRN,String date1,String date2){
		AnalysisMapper mapper= sqlsession.getMapper(AnalysisMapper.class);
		return mapper.circle(sellerCRN,date1,date2);
	}
	public List<HashMap> tcircle(String sellerCRN){
		AnalysisMapper mapper= sqlsession.getMapper(AnalysisMapper.class);
		return mapper.tcircle(sellerCRN);
	}
	
}
