//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.CSBoard;

@Repository
public class CSBoardDAO {

	@Autowired
	private SqlSession sqlsession;

	public int write(CSBoard csboard) {
		int result = 0;

		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		try {
			result = mapper.write(csboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<CSBoard> getAll(int startRecord, int countPerPage, String searchText) {

		
		
		ArrayList<CSBoard> bList = new ArrayList<CSBoard>();
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);		//offset은 시작위치, limit은 개수(제한) - ★ MyBatis에서 알아서 범위를 지정하도록 도와주는 명령어(쿼리로 해결할 수도 있지만, 이게 더 간단!)
		bList = mapper.getAll(rb,searchText);
		return bList;
	}

	public int getAllCount(String searchText) {	
		int result = 0; 
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		result = mapper.getAllCount(searchText);
		return result;
	}

}