//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

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
	
	public ArrayList<CSBoard> getAll() {
		ArrayList<CSBoard> bList = new ArrayList<CSBoard>();
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		bList = mapper.getAll();
		return bList;
	}

}